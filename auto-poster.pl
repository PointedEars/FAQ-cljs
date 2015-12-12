#!/usr/bin/perl

####################################################################
# comp.lang.javascript FAQ - Daily sendout to Usenet based upon    #
# XML feed in defined format.                                      #
#------------------------------------------------------------------#
# Message headers can only contain 7bit ASCII chars (RFC2822).     #
# I'm using ISO-8859-1 in the message bodies for maximum           #
# compatibility with all kinds of newsreaders.                     #
#------------------------------------------------------------------#
# Code by Bart Van der Donck - www.dotinternet.be - Aug 2006.      #
#------------------------------------------------------------------#
# This program is free software released under the GNU/GPL; you    #
# can redistribute it and/or modify it under the GNU/GPL terms.    #
####################################################################

####################################################################
# Load modules & locale for English formatted date.                #
# These modules should be present in default Perl 5.6+ installs.   #
####################################################################

use strict;
use warnings;
use POSIX;
use Net::NNTP;
use LWP::UserAgent;
use HTML::Parser;
use HTML::Entities;
use XML::Parser;
use XML::Simple;

setlocale(LC_ALL, 'English (UK)');


####################################################################
# Configuration area.                                              #
####################################################################

# account on news server (leave both blanco if no authentication
# is needed)
my $account       = 'javas...@dotinternet.be';
my $password      = 'secret';

# server and newsgroup
my $server        = 'news.sunsite.dk';
my $ng            = 'comp.lang.javascript';

# sender data
my $sendername    = 'FAQ server';
my $senderaddress = 'javas...@dotinternet.be';

# where is the XML file to load ?
my $xml_file      = 'http://www.jibbering.com/faq/index.xml';

# footer of the message
my $footer        = <<FOOT
--
 Postings as these are automatically sent once a day.  Their goal
 is to answer repeated questions, and to offer the content to the
 community for continuous evaluation/improvement.  The complete
 comp.lang.javascript FAQ is at http://www.jibbering.com/faq/.
 The FAQ workers are a group of volunteers.
FOOT
;

# where is writable file that keeps track of the counter
# (path must be absolute or relative to this script)
my $writablefile  = 'entry2post.cnt';
my $fc;

# misc. header settings, these should be left untouched
my $mime_version  = '1.0';
my $charset       = 'iso-8859-1';
my $content_type  = 'text/plain';
my $trans_enc     = '8bit';
my $organization  = 'comp.lang.javascript FAQ workers';
my $date          = strftime "%a, %d %b %Y %H:%M:%S +0000", gmtime;

# which regexes for nice Usenet layout
my %regexes       =  (
                        "p"           => "\n",
                        "/p"          => "\n",
                        "em"          => "_",
                        "/em"         => "_",
                        "url"         => "\n\n",
                        "/url"        => "\n\n",
                        "ul"          => "\n",
                        "/ul"         => "\n",
                        "li"          => "* ",
                        "/li"         => "",
                        "moreinfo"    => "\n\n",
                        "/moreinfo"   => "\n\n",
                        "resource"    => "\n\n",
                        "/resource"   => "\n\n",
                        "icode"       => "`` ",
                        "/icode"      => " ''",
                        "code"        => "\n\n",
                        "/code"       => "\n\n",
                     );

# run options
my $sendout       = 1; # 1 = send to Usenet, 0 = print to screen.
my $printnrs      = 0; # 1 = include FAQ chapter & entry nr,
                       # 0 = exclude. CAUTION! as it takes this
                       # data not from XML feed but from this
                       # porgram's internal counting.

####################################################################
# Get XML file.                                                    #
####################################################################

# fetch XML file
my $ua = new LWP::UserAgent;
$ua->agent("AgentName/0.1 " . $ua->agent);
my $req = new HTTP::Request GET => $xml_file;
$req->content_type('text/xml');
my $res = $ua->request($req);
unless ($res->is_success)  {
  die "Error: couldn't get $xml_file: $!\n";
}

# is XML file well-formed ?
my $xml = $res->content;
eval { XML::Parser->new(ErrorContext=>1)->parse($xml) };
if ($@)  {
  die "Error: $xml_file is not well-formed XML\n";
}

####################################################################
# Regexes on XML feed.                                             #
####################################################################

# regex the mentionned tags to Usenet layout format
while ( my ($key, $val) = each %regexes )  {
  $xml =~ s/<\Q$key\E(?:[^>'"]*|(['"]).*?\1)*>/$val/gsi;
}

# regex out all other tags except CONTENTS, CONTENT, FAQ, TITLE
my $result_xml = '';
my @report_tags = qw(content contents faq title);
HTML::Parser->new(api_version   => 3,
                  start_h       => [\&tag,   'tokenpos, text'],
                  process_h     => ['', ''],
                  comment_h     => ['', ''],
                  declaration_h => [\&decl,   'tagname, text'],
                  default_h     => [\&text,   'text'],
                  report_tags   => \@report_tags,
                 )
    ->parse( $xml );

# check for well-formedness
eval { XML::Parser->new(ErrorContext=>1)->parse($result_xml) };
if ($@)  {
  die "Error: XML file not well-formed after Usenet format regexes";
}

####################################################################
# Decide which subject/body part we need.                          #
####################################################################

# tie xml to vars
my $xml_ref = XMLin($result_xml, ForceArray => 1);

# load counter file
open my $F, '<', $writablefile
             || die "Error: can't open $writablefile: $!";
flock($F, 1) || die "Error: can't get LOCK_SH on $writablefile: $!";
$fc = $_ while <$F>;
close $F     || die "Error: can't close $writablefile: $!";
my ($chap, $cnt) = split /\|/, $fc;

# lookup subject/body in hashed structure
unless ($xml_ref->{CONTENTS}->[0]
                ->{CONTENT}->[$chap]
                ->{CONTENT}->[$cnt])  {
  save4next ( $chap, $cnt );
  die "Error: FAQ entry ".($chap+1).".".($cnt+1).". doesn't exist";
}

my $part = $xml_ref->{CONTENTS}->[0]
                   ->{CONTENT}->[$chap]
                   ->{CONTENT}->[$cnt];
my %hash_deref = %$part;
my $subject = $hash_deref{TITLE};
my $body    = $hash_deref{content};


####################################################################
# Regexes on $body and $subject and compile final $message         #
####################################################################

# decode num/char HTML entities in subject and in message
$subject  = HTML::Entities::decode($subject);
$body     = HTML::Entities::decode($body);

# take care of Euro sign towards ISO-8859-1, just in case
s//Euro/ig for ($body, $subject);

# don't allow EOLs and successive blancs in subject lines
$subject =~ s/\n/ /g;
$subject =~ s/\s+/ /g;

# remove 1-6 initial blanks from begin + all from end
my @splitbody = split /\n/, $body;
for (@splitbody)  {
  s/\s+$//;
  s/^\s{1,6}//;
  s/^\s+http:/http:/g; # issue with leading http on line
}
$body = join "\n", @splitbody;

# remove more than three EOLs
$body =~ s/\n{3,}/\n\n/gs;

# remove all EOLs from begin and end of $body
for ($body)  {
  s/^\n+//;
  s/\n+$//;
}

# should we add the FAQ entry chapter/number ? (own counting)
if ($printnrs==1)  {
$subject = 'FAQ ' . $chap . '.' . $cnt . '. - ' . $subject ;
}
else  {
$subject = 'FAQ - ' . $subject;
}

# format full body
$body = "\x2D" x 71 . "\n" . $subject . "\n" . "\x2D" x 71
        . "\n" x 2 . $body . "\n" x 3 . $footer;

# remove lines that consist only of 1 dot
$body =~ s/\n\.\n/\n/g;

# compute & store which entry is to send next time
save4next ( $chap, $cnt );

# compile complete message
my $message = <<EOM;
Reply-To: "$sendername" <$senderaddress>
From: "$sendername" <$senderaddress>
Date: $date
Newsgroups: $ng
Subject: $subject
Organization: $organization
Mime-Version: $mime_version
Content-Type: $content_type; charset="$charset"
Content-Transfer-Encoding: $trans_enc\n
$body
EOM

# should we send the message to Usenet or print to screen ?
if ($sendout != 1)  {
  print $message;
  exit;
}


####################################################################
# Fire off the message.                                            #
####################################################################

# do some final checks
if ( !$message || $message eq '' || !$body || $body eq ''
     || !$subject || $subject eq '')  {
  die "Error: didn't send message due to malformed data";
}

# send action (heavy error checking)
my $nntp = Net::NNTP->new( $server )
                || die "Error: can't connect to $server: $!\n";

$nntp->authinfo( $account, $password )
                || die "Error: Net::NNTP->authinfo() failed: $!\n"
if ( defined $account && defined $password
     && $account ne '' && $password ne '');

$nntp->postok() || die "Error: $server said: not allowed to post\n";

$nntp->post( $message )
                || die "Error: can't send message: $!\n";
$nntp->quit;


####################################################################
# HTML::Parser and $chap/$cnt counting routines.                   #
####################################################################

sub tag  {
  my ($pos, $text) = @_;
  if (@$pos >= 4)  {
    my ($k_offset, $k_len, $v_offset, $v_len) = @{$pos}[-4 .. -1];
    my $next_attr = $v_offset?$v_offset+$v_len:$k_offset+$k_len;
    my $edited;
    while (@$pos >= 4) {
        ($k_offset, $k_len, $v_offset, $v_len) = splice @$pos, -4;
        $next_attr = $k_offset;
    }
    $text =~ s/^(<\w+)\s+>$/$1>/ if $edited;
  }
  $result_xml.=$text;
}

sub decl  {
  my $type = shift;
  $result_xml.=shift if $type eq 'doctype';
}

sub text  {
  $result_xml.= shift;
}

sub save4next  {
  my ($ch, $cn) = @_;

  # next entry in same chapter exists ?
  if ($xml_ref->{CONTENTS}->[0]
                          ->{CONTENT}->[$ch]
                          ->{CONTENT}->[$cn+1])  {
         writefile( $ch . '|' . ($cn+1) );
         return
  }

  # first entry in next chapter exists ?
  if ($xml_ref->{CONTENTS}->[0]
                          ->{CONTENT}->[$ch+1]
                          ->{CONTENT}->[0])  {
         writefile( ($ch+1).'|0' );
         return
  }

  # reset entries if we're at the last entry of the last chapter
  if ($xml_ref->{CONTENTS}->[0]
                          ->{CONTENT}->[1]
                          ->{CONTENT}->[0])  {
         writefile( '1|0' );
         return
  }

  # last resort: no entry found => reset counter and die
  writefile( '1|0' );
  die "Error: couldn't find next entry for FAQ ".($ch+1).".".($cn+1)
      ."; next time I'll take the first entry again";
}

sub writefile  {
  open WR, '>', $writablefile
               || die "Error: can't open $writablefile: $!";
  print WR shift;
  close WR     || die "Error: can't close $writablefile: $!";
}

__END__
