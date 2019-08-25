<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
            "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
<title>Browser Detection (and What to Do Instead)</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<link href="../../faq.css" rel="stylesheet" type="text/css">
<link href="../notes.css" rel="stylesheet" type="text/css">
<style type="text/css">
.tip {
    border: 1px solid #ccc;
    padding: 1ex;
    background: #fcfcfc;
    font-size: 90%;
}
</style>
</head>
<body>
<h1 id="bdTop">Browser Detection (and What to Do Instead)</h1>
<div id="faqNav">
  <a href="../../">FAQ</a> &gt; <a href="../">FAQ Notes</a>
</div>
<p>
By Richard Cornford, edited by Garrett Smith 
</p>
<ul>
    <li><a href="#bdIntro">Introduction</a></li>
    <li><a href="#bdValid">Avoiding Structural Differences in the Browser DOMs</a></li>
    <li><a href="#bdDif">Browsers Differences</a></li>
    <li><a href="#bdFailS">Failed Strategies: Browser Detecting</a>
        <ul>
            <li><a href="#bdUAS">Assumptions Based on navigator.userAgent</a></li>
            <li><a href="#bdOI">Assumptions Based on DOM Objects: Object inference</a></li>
        </ul>
    </li>
    <li><a href="#bdFD">A Strategy That Works: Object/Feature Detecting.</a>
        <ul>
            <li><a href="#bdGEID">Example 1: IDed Element Retrieval</a></li>
            <li><a href="#bdScroll">Example 2: Scroll Values</a></li>
            <li><a href="#bdReplace">Example 3: String.prototype.replace</a></li>
        </ul>
    </li>
    <li><a href="#bdDesPb">The Javascript Design Problem</a></li>

</ul>

<h2 id="bdIntro">Introduction</h2>

<p id="bdIntro_1">
Under normal circumstances computer programs are written for a known
environment. The programmer knows what to expect; which APIs will be
available, how they will behave and so on. Java is an ideal example
of this, providing a theoretically consistent set of APIs and language
features across all Java Virtual Machine (JVM) implementations. But
this is also true in most other circumstances. The programmer of C++
for the Windows operating system will know what MFC classes are
available and how to program them. Their expectations will be
rewarded, if they posses the required knowledge.
</p>

<p id="bdIntro_2">
Client side javascript for the Internet, on the other hand, has the
possibly unique problem of having to be authored with no specific
knowledge of the environment in which it will be executed. The
client side environment will usually be a web browser and web
browsers do tend to have many common features (and increasingly
standardised features) but the author cannot know which version of
which browser will be making any HTTP request (or
whether it is a browser at all). It is not even possible to tell in
advance whether the User Agent will be capable of executing
javascript; all of those that can include a user configurable option
to disable it anyway.
</p>

<p id="bdIntro_3">
Javascript authors for the Internet must realise that they are dealing
with the unknown and that any, and all, scripts will fail to execute
somewhere. The challenge is to get the most from your javascript when
it is available but to cope with their failure in a meaningful way.
</p>

<p id="bdIntro_4">
I once read a description of a variant on the game of chess, played
at military academies. Two players sit at separate boards set up with
only their own pieces, out of sight of each other, and a referee
supervises the game. Each player makes their move in turn and the
referee is responsible for informing them how the other's move impacts
on their own pieces and how the other's disposition of pieces impact
on their intended move. The player is informed only when one of their
own pieces is taken, when one of their moves is affected by
interacting with one of their opponents pieces (i.e. a player may want
to move a bishop across the board but the referee may inform them that
their move was stopped four squares early when the bishop took a pawn
from the other side) and when one of their opponents pieces is
sitting on a square adjacent to one of their own.
</p>

<p id="bdIntro_5">
The game is used to teach battlefield strategy. To win a player must
probe and test to deduce his opponent's disposition, while planing and
executing a response that will achieve the desired checkmate. It is
this sort of strategy that needs to be added to the normal programming
problems in order that javascript may cope with its unknown execution
environment, with the significant difference that the strategy, its
tests and all of the paths of execution must be fully planed out before
the code can even starts executing.
</p>

<h2 id="bdValid">Avoiding Structural Differences in the Browser DOMs</h2>

<p id="bdValid_1">
While the point of this article is to introduce techniques for handling
the differences between web browsers and their DOM implementations it
is also possible to avoid some types of differences especially related
to the structure of the DOM that is being scripted.
</p>

<p id="bdValid_2">
If I was asked to recommend one action most likely to promote the
authoring of cross-browser scripts it would be: <strong><em>Start
from a basis of valid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language"
>HTML</abbr></span></em></strong>.</p>

<p id="bdValid_3">
Browsers presented with invalid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> will usually attempt to error
correct it in order to do the best possible job of displaying it.
Some browsers, particularly IE, are tolerant of all sorts of strange
formulations of mark-up. Valid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> has a tree-like structure, elements
may completely contain others but they cannot overlap, and there are
rules about which elements may appear in which contexts. The DOM that
is to be scripted also has a tree-like structure and there is a very
simple relationship between the tree-like structure of valid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> and
the DOM constructed from it. So any browser presented with valid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span>
will be able to directly translate that <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> into a corresponding DOM
using well specified rules, resulting in a DOM that is of predictable
and consistent structure on all of the browsers that can build a DOM.
</p>

<p id="bdValid_4">
Invalid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> will not translate as naturally into a DOM, or even a
tree-like structure. If the browser is going to build a DOM with the
source provided it is going to have to apply error correcting rules
and attempt to build the best DOM it can. But the error correcting
rules are not standardised, not even published. So different browsers
have no choice but apply different rules and that directly results in
the building of DOMs with different (and in extremes, radically
different) structures.
</p>

<p id="bdValid_5">
As a result, using invalid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> directly produces differences in the
DOMs produced by different browsers. No matter how good the application
of techniques for dealing with the differences between browsers, it
does not make sense to do anything that will provoke more differences
than are unavoidable.
</p>

<p id="bdValid_6">
The authoring of invalid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span>, justified because &quot;It works in
browser XYZ&quot;, gives the authors of accompanying scripts the
impression that cross-browser scripting is harder than it is. If they
had started with valid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> they would never have encountered any of
the structural inconsistencies that invalid <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> can provoke.
</p>

<h2 id="bdDif">Browsers Differences</h2>

<p id="bdDif_1">
As browsers have evolved they have offered more features to javascript.
Different manufactures have adopted the features of other browsers,
while adding new features, that may in turn have been adopted by (or
will be adopted by) their competitors. Various sets of common features
have emerged and some have been formalised by the W3C into a sequence
of standard DOM specifications. Along the way an increasing number of
javascript capable browsers have emerged. In addition to desktop PC
browsers, javascript capable browsers exist for a whole range of
devices; PDAs, mobile telephones (Microwave ovens, refrigerators).
</p>

<p id="bdDif_2">
Unfortunately it is the case that the browsers on the smaller devices
cannot offer the range of features available to a desktop PC and even
as the technology improves and features are added to the smaller
browsers the problem will not improve as browsers will become available
on a wider range of devices while the desktop PC browsers will continue
to march ahead of them.
</p>

<p id="bdDif_3">
Over the years various strategies have been attempted to tackle this
problem and some have failed miserably.
</p>

<h2 id="bdFailS">Failed Strategies: Browser Detecting</h2>

<h3 id="bdUAS">Assumptions Based on navigator.userAgent</h3>

<p id="bdUAS_1">
One of the most popular strategies for handling the differences between
web browsers was browser detecting based on the User Agent string.
Browsers possessing a <code>navigator</code> object also provide a
property of that object: <code>navigator.userAgent</code> containing a
string that (in theory) identifies the browser. Its application went
something like:-
</p>

<pre id="bdUAS_ex1">
<span class="commentJS">/* Warning: never use this script, or any script based on, or resembling, it.
*/</span>
var userAgent = self.navigator.userAgent;
var appName = self.navigator.appName;
var isOpera = false;
var isOpera5 = false;
var isOpera6p = false;
var isIE = false;
var isIE4 = false;
var isIE5p = false;
var isMozilla1p = false;
var isNet4 = false;
var isNet5p = false;
var operaVersion = 0;
var ieVersion = 0;
var appVersion = self.navigator.appVersion;
var brSet = false;

function brSetup(){
 for(var c = 3;c &lt; appVersion.length;c++){
  var chr = appVersion.charAt(c);
  if(isNaN(chr)){
   appVersion = appVersion.substring(0, c);
   break;
  }
 }
 if((userAgent.indexOf('webtv') &lt; 0) &amp;&amp;
    (userAgent.indexOf('hotjava') &lt; 0)){
  if(userAgent.indexOf('Opera') &gt;= 0){
   var ind = (userAgent.indexOf('Opera')+6);
   if(((ind+1) &lt; userAgent.length)&amp;&amp;(ind &gt;= 6)){
    isOpera = true;
    var bsVersion = parseInt(userAgent.substring(ind, ind+1));
    if(!isNaN(bsVersion)){
     operaVersion = bsVersion;
     if(operaVersion &gt;= 6){
      isOpera6p = true;
     }else if(operaVersion &gt;= 5){
      isOpera5 = true;
     }
    }
   }
  }else if(appName.indexOf('Microsoft Internet Explorer') &gt;= 0){
   var ind = (userAgent.indexOf('MSIE')+5);
   if(((ind+1) &lt; userAgent.length)&amp;&amp;(ind &gt;= 5)){
    isIE = true;
    var bsVersion = parseInt(userAgent.substring(ind, ind+1));
    if(!isNaN(bsVersion)){
     ieVersion = bsVersion;
     if(ieVersion &gt;= 5){
      isIE5p = true;
     }else if(ieVersion &gt;= 4){
      isIE4 = true;
     }
    }
   }
  }else if(appName.indexOf('Netscape') &gt;= 0){
   if((self.navigator.vendor)&amp;&amp;
      (self.navigator.vendor.indexOf('Netscape') &gt;= 0)&amp;&amp;
      (userAgent.indexOf('Gecko') &gt;= 0)){
    isNet5p = true;
   }else if((userAgent.indexOf('Netscape') &lt; 0)&amp;&amp;
            (userAgent.indexOf('Gecko') &gt;= 0)&amp;&amp;
            (appVersion &gt;= 5)){
    isMozilla1p = true;
   }else if((appVersion &lt; 5)&amp;&amp;
            (userAgent.indexOf('compatible') &lt; 0)){
    isNet4 = true;
   }
  }
 }
 brSet = true;
}
</pre>

<p id="bdUAS_2">
This version also uses some other properties of the
<code>navigator</code> object; <code>appName</code> and
<code>appVersion</code>.
</p>

<p id="bdUAS_3">
Superficially this type of script seems to be saying quite a lot about
what browser is executing the script. Knowing that the
<code>isIE5p</code> variable is boolean <code>true</code> seems to be
a reasonable indicator that the browser in question is Internet
Explorer Version 5 or above and from that all of the available features
on the IE 5+ DOM could be assumed to exist.
</p>

<p id="bdUAS_4">
Unfortunately, if this type of script ever was an effective determiner
of the browser type, it is not now. The first problem is that you cannot
write this type of script to take into account all web browsers. The
script above is only interested in Internet Explorer, Netscape and
(some) Mozilla derived browsers and Opera. Any other browser will not
be identified, and that will include a number of W3C DOM conforming
fully dynamic visual browsers quite capable of delivering on even quite
demanding code.
</p>

<p id="bdUAS_5">
The second problem is that scripts like this one, and server-side
counter-parts (reading the HTTP User Agent header) were used to
<em>exclude</em> browsers that did not fall into a set of browsers
known to the author, regardless of whether those browsers were
capable of displaying the offending site or not.
</p>

<p id="bdUAS_6">
As more browsers were written, their authors discovered that if they
honestly reported their type and version in their User Agent string
they would likely be excluded from sites that they would
otherwise be quite capable of displaying. To get around this problem
browsers began spoofing the more popular versions, sending HTTP User
Agent headers, and reporting <code>navigator.userAgent</code> strings,
that were indistinguishable from, say, IE. 
</p>

<p id="bdUAS_7">
As a result, when the above script reports <code>isIE5p</code> as true, it is
possible that the browser that is executing the script is one of
numerous current browsers. Many of those browsers support sufficient
features found on IE5+ to allow most scripts to execute but the
trueness of <code>isIE5p</code> is not a valid indicator that the
browser will support <em>all</em> of the IE 5+ DOM.
</p>

<p id="bdUAS_8">
Now you might decide that a browser that lies about its identity 
deserves what it gets (though they started lying in order to make
themselves usable in the face of near-sighted <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> and script authors)
but is worth bearing in mind that the IE 5
<code>navigator.userAgent</code> string is:
<code>&quot;Mozilla/4.0 (compatible; MSIE 5.01; Windows NT)&quot;</code>.
IE 5 is in fact spoofing Netscape 4, and Microsoft started to do that
for precisely the same reasons that motivate many current browsers to
send User Agent headers, and report <code>navigator.userAgent</code>
strings that are indistinguishable form those of Microsoft browsers.
</p>

<p id="bdUAS_9">
No browser manufacture wants (or ever has wanted) their browser to be
needlessly excluded from displaying a web site that it is perfectly
capable of handling just because the author of that site does not
know it by name. And to prevent that they have followed Microsoft and
taken action that has rendered the <code>userAgent</code> string (and
the HTTP User Agent header) meaningless.
</p> 

<p id="bdUAS_10">
We are now at a point where the contents of the User Agent strings
bear no relationship at all to the capabilities and features of the
browser that is reporting it. The situation has gone so far that a
number of javascript experts have stated that a standard quality test
for an unknown script would include searching the source code of the
script for the string <code>&quot;userAgent&quot;</code> and dismissing
the script out of hand if that string is found.
</p>

<h3 id="bdOI">Assumptions Based on DOM Objects: Object inference</h3>

<p id="bdOI_1">
A second browser detecting strategy uses the objects present in various
browser DOMs and make the assumption that the presence (or absence) of
one or more objects indicates that a browser is a particular type or
version. I quickly found this example of typical code of this type:-
</p>

<pre id="bdOI_ex1">
<span class="commentJS">/* Warning: never use this script, or any script based on, or resembling, it.
*/</span>
var isDOM=(document.getElementById)?true:false;
var isIE4=(document.all&amp;&amp;!isDOM)?true:false;
var isIE5p=(document.all&amp;&amp;isDOM)?true:false;
var isIE=(document.all)?true:false;
var isOP=(window.opera)?true:false;
var isNS4=(document.layers)?true:false;
</pre>

<p id="bdOI_2">
Javascript performs automatic type conversion so when a boolean result
is expected from an expression that evaluates to a non-boolean value
that non-boolean value is (internally) converted to a boolean value
(using the rules defined in the ECMAScript specification) and that
boolean is used as the result.
</p>

<p id="bdOI_3">
Take the first line:-
</p>

<pre id="bdOI_ex2">
var isDOM=(document.getElementById)?true:false;
</pre>

<p id="bdOI_4">
The conditional expression requires that the expression preceding the <code>?</code>
have a boolean result. The <code>document.getElementById</code>
property accessor can resolve as one of two values depending on whether
the <code>getElementById</code> function is supported in the browser in
question. If it is supported then the accessor resolves as a function
object, and is type converted to boolean <code>true</code>. If
<code>getElementById</code> is not supported the accessor resolves as
undefined, and undefined type converts to boolean
<code>false</code>. Thus the expression preceding the question mark
resolves as <code>true</code> or <code>false</code> and based on that
result <code>true</code> or <code>false</code> are assigned to the
variable <code>isDOM</code>.
</p>

<div class="tip">
    <h4>Boolean Conversion Tip: !!</h4>
    <p id="bdOI_5">
    Incidentally, this code is not the optimum method of assigning a boolean
    value based on the type converted to boolean result of a property accessor.
    It is better to use the javascript NOT operator ( <code>!</code> ) twice
    or to pass the object reference as the argument to the <code>Boolean</code>
    constructor called as a function. The not operator will type convert its
    operand to boolean and then invert it so <code>false</code> becomes
    <code>true</code> and <code>true</code> becomes <code>false</code>.
    Passing that result as the operand for a second not operator inverts
    the boolean again so a reference to a function object results in boolean
    <code>true</code> and an undefined reference results in boolean
    <code>false</code>. The <code>Boolean</code> constructor called as a
    function converts its argument to boolean and returns that value. The
    statement would become:-
    </p>
    
    <pre id="bdOI_ex3">
    var isDOM = !!document.getElementById;
    
    <span class="commentJS">/*  - or -  */</span>
    
    var isDOM = Boolean(document.getElementById);
    </pre>
    
    <p id="bdOI_6">
    Which is shorter and faster than the original version and certainly
    more direct.
    </p>
</div>

<h4>Inductive Generalization Fallacy</h4>
<p id="bdOI_7">
The problem with this type of browser detecting script is that it is
used to make assumptions about the browser's capabilities that are
rarely valid. For example, this <code>isDOM</code> result, based on
the browser's support for <code>document.getElementById</code>, is
often used as the basis for the assumption that the browser has a
fully dynamic DOM with methods such as
<code>document.createElement</code>, <code>replaceChild</code> and
<code>appendChild</code>. Browsers do not live up to that expectation,
some are not that dynamic and while they may implement some of the Core
DOM level 1 methods such as <code>getElementById</code> They do not
necessarily implement large parts of the various DOM standards,
including all of the dynamic <code>Node</code> manipulation methods.
</p>

<p id="bdOI_8">
The result of the <code>isIE5p</code> test is intended to indicate that
the browser is Internet Explorer 5.0 or above. However, Opera 7,
IceBrowser 5.4, Web Browser 2.0 (palm OS), Konquerer, Safari, NetFront,
iCab and others will all produce a <code>true</code> value in
<code>isIE5p</code> because they implement <code>getElementById</code>
and the <code>document.all</code> collection. As a result, code that
assumes that it will have <em>all</em> of the capabilities of IE 5.0+
available to it when <code>isIE5p</code> is <code>true</code> will as
often as not be mistaken.
</p>

<p id="bdOI_9">
This problem applies to all of the tests above with the possible
exception of the <code>window.opera</code> test. I am unaware of a
second browser type that has implemented an <code>opera</code> object
on the window object. But then Opera 7 is a radically different, and
much more dynamic browser that its preceding versions, though they all
possess a <code>window.opera</code> object. 
</p>

<p id="bdOI_10">
To get around the problem that multiple browsers implement the same
features (even if they start off unique to one browser) script authors
have attempted to find more discriminating features to test. For
example, the following script extract is intended to work only on IE
5.0+ browsers:-
</p>

<pre id="bdOI_ex4">
var isIE5p = !!window.ActiveXObject;
...
function copyToClip(myString){
    if(!isIE5p) return;
    window.clipboardData.setData(&quot;text&quot;,myString);
}
</pre>

<p id="bdOI_11">
The <code>ActiveXObject</code> constructor is intended to be
discriminating of an IE browser. However, this type if script still
does not work. It has placed the competing browser manufacturers in
exactly the same position as they were in when scripts tested the
<code>navigator.userAgent</code> string and excluded them from
accessing a site because they honestly reported that they where not
IE. As a result I already know of one browser that has implemented
a <code>window.ActiveXObject</code> function, it probably is a dummy
and exists in the browsers DOM specifically to defeat the exclusion
of that browser based on tests like the one above.
</p>

<p id="bdOI_12">
The assumptions that the existence of one (or two) feature(s) in a
javascript environment infers the existence of any feature beyond
the ones tested is invalid. It is only used by those ignorant of the
potential for diversity, imitation and the patterns of evolution in
browser DOMs.
</p>

<p id="bdOI_13">
No matter how specifically the objects from which the inferences are
derived are chosen, the technique itself sows the seeds of its own
invalidity, an object that may actually validly be used to infer that
a browser is of a particular type/version today probably will not still
be valid next year. Adding a maintenance burden to a task that already
presupposes an omniscient knowledge of <em>all</em> browser DOMs just
in order to be effectively implemented at present.
</p>


<h2 id="bdFD">A Strategy That Works: Object/Feature Detecting</h2>

<p id="bdFD_1">
The main point of the previous discussion is to convey the idea that it
is impossible to detect exactly which type of browser (or version of
that browser) a script is being executed on. The use that such scripts
have been put to in the past (to exclude browsers from sites that
they probably could have successfully handled) has motivated the
manufactures of browsers to render browser detecting nonviable
as a strategy for dealing with the variations in browser DOMs.
</p>

<p id="bdFD_2">
Fortunately, not being able to identify a web browser type or version
with more accuracy than could be achieved by generating a random number
and then biasing the result by your favourite (meaningless, because
they too are based on browser detecting and suffer exactly the same
unreliability) browser usage statistics, does not need to impact upon
your ability to script web browsers at all. A viable alternative
strategy has been identified and developed to the point where it is
possible to author javascript to be used on web pages without any
interest in the type or version of the browser at all.
</p>

<p id="bdFD_3">
That alternative strategy is known as object or feature detecting. I
prefer to use the term &quot;feature detecting&quot;, partly because the
resulting code often needs to test and probe a wider range of
features than just those that could be described as objects, but
mostly because &quot;object detecting&quot; is occasionally
erroneously applied to the object inference style of script described
above.
</p>

<p id="bdFD_4">
Feature detecting seeks to match an attempt to execute as script (or a
part of a script) with the execution environment by seeking to test
features of that environment where the results of the test have a
direct one-to-one relationship with the features that need to be
supported in the environment for the code to successfully execute. It
is the direct one-to-one relationship in the implemented tests that
avoids the need to identify the specific browser because whatever
browser it is it either will support all of the required features or
it will not. That would mean testing the feature itself (to ensure
that it exists on the browser) and possibly aspects of the behaviour
of that feature.
</p>

<p id="bdFD_5">
Taking the previous example that illustrated how the
<code>ActiveXObject</code> constructor might be used as the basis for
a script that inferred the existence of, and ability to use, the
<code>clipboardData</code> feature implemented on window IE. Rather
than inferring the browser's support for the <code>clipboardData</code>
feature from some other unrelated feature it should be fairly obvious
that the feature that should be tested for prior to attempting to write
to the clipboard <em>is</em> the <code>clipboardData</code> object, and
further, that calling the <code>setData</code> method of that object
should necessitate checking that it too is implemented:-
</p>

<pre id="bdFD_ex1">
function copyToClip(myString){
    if((typeof clipboardData != 'undefined')&amp;&amp;
                      (clipboardData.setData)){
        clipboardData.setData(&quot;text&quot;,myString);
    }
}
</pre>

<p id="bdFD_6">
In this way the tests that determine whether the
<code>clipboardData.setData</code> method is called have a direct
one-to-one relationship with the browser's support for the feature. It
is not necessary to be interested in whether the browser is the
expected windows IE that is known to implement the feature, or whether
it is some other browser that has decided to copy IE's implementation
and provide the feature itself. If the feature is there (at least to
the required extent) it is used and if it is not there no attempt is
made to use it.
</p>

<p id="bdFD_7">
The above feature detecting tests are done using two operations. The
first employs the <code>typeof</code> operator, which returns a string
depending on the type of its operand. That string is one of
<code>&quot;undefined&quot;</code>, <code>&quot;object&quot;</code>,
<code>&quot;function&quot;</code>, <code>&quot;boolean&quot;</code>
<code>&quot;string&quot;</code> and <code>&quot;number&quot;</code>
and the test compares the returned string with the string
<code>&quot;undefined&quot;</code>. The <code>clipboardData</code>
object is not used unless typeof does not return
<code>&quot;undefined&quot;</code>.
</p>


<p id="bdFD_8">
The second test is a type-converting test. The logical AND
(<code>&amp;&amp;</code>) operator internally converts its operands to
boolean in order to make its decision about what value it will return.
If <code>clipboardData.setData</code> is undefined it will type-convert
to boolean <code>false</code>, while if it is an object or a function
the result of the conversion will be boolean <code>true</code>.
</p>

<p id="bdFD_9">
However, that function is not a particularly clever application of
feature detecting because, while it avoids the function throwing errors 
in an attempt to execute <code>clipboardData.setData</code> on a browser 
thatdoes not support it, it will do nothing on a browser that does not
support it. That is a problem when the user has been presented with a
GUI component that gives them the impression that their interaction
will result in something being written to the clipboard but when they
use it nothing happens. And of course nothing was going to happen if
the browser in use did not support javascript or it had been disabled.
</p>

<p id="bdFD_10">
Ensuring that a script will not attempt to use a feature that is not
supported is not sufficient to address the design challenge of crating
scripts for the Internet. Testing the browser for the features that it
does support makes it practical to handle a spectrum of browser DOMs
but the script design task also involves planning how to handle the
range of possibilities. A range that goes from guaranteed failure to
execute at all on browser that do not support javascript, to full
support for all of the required features.
</p>

<p id="bdFD_11">
You can tell when the browser does not support the
<code>clipboardData</code> feature from the script prior to using it
but the user has no way of knowing why a button that promised them
some action has failed to do anything. So in addition to matching the
script to the browser's ability to execute it, it is also necessary to
match the GUI, and the user's resulting expectations, to what the
script is going to be able to deliver.
</p>

<p id="bdFD_12">
Suppose the <code>copyToClip</code> function was called from an
<code>INPUT</code> element of <code>type=&quot;button&quot;</code>
and was intended to copy a company e-mail address into the clipboard,
the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> code for the button might look like:-
</p>

<pre id="bdFD_ex2">
&lt;input type=&quot;button&quot;
    value=&quot;copy our contact e-mail address to your clipboard&quot;
    onclick=&quot;copyToClip('info@example.com')&quot;&gt;
</pre>

<p id="bdFD_13">
We know that that <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> will do nothing if javascript is
disabled/unavailable and we know that it will do nothing if the browser
does not support the required features, so one option would be to use a
script to write the button <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> into the document in the position in
which the button was wanted when the browser provided the facility:-
</p>

<pre id="bdFD_ex3">
&lt;script type=&quot;text/javascript&quot;&gt;
    if((typeof clipboardData != 'undefined')&amp;&amp;
                     (clipboardData.setData)&amp;&amp;
                             (document.write)){
        document.write('&lt;input type=&quot;button&quot;',
                       'value=&quot;copy our contact e-mail address',
                       ' to your clipboard&quot; onclick=&quot;',
                       'copyToClip(\'info@example.com\')&quot;&gt;');
    }
&lt;/script&gt;
</pre>

<p id="bdFD_14">
Now the user will never see the button unless the browser supports the
required features <em>and</em> javascript is enabled. The user never
gets an expectation that the script will not be able to deliver (at
least that is the theory, it is still possible for the user's browser
configuration to prevent scripts from writing to the clipboard, but
the user might be expected to know how their browser is configured and
understand that the button is not in a position to override it).
</p>

<p id="bdFD_15">
If the <code>copyToClip</code> function is only ever called from
buttons that are written only following the required feature detection
then it can be simplified by the removal of the test from its body as
it would be shielded from generating errors on nonsupporting browsers by
the fact that there would be no way for it to be executed.
</p>

<p id="bdFD_16">
The <code>document.write</code> method is not the only way of adding
GUI components to a web page in a way that can be subject to the
verification of the features that render those components meaningful.
Alternatives include writing to a parent element's
<code>innerHTML</code> property (where supported, see 
<a href="/faq/#updateContent">FAQ: How do I modify the content of the current page?</a>), or using the W3C DOM
<code>document.crateElement</code> (or <code>createElementNS</code>)
methods and appending the created element at a suitable location within
the DOM. Either of these two approaches are suited to adding the
components after the page has finished loading, but that can be useful
as some feature testing is not practical before that point. The
approach used can be chosen based on the requirements of the script.
If the script is going to be using the
<code>document.createElement</code> method itself then it is a good
candidate as a method for inserting any required GUI components,
similarly with <code>innerHTML</code>. The <code>document.write</code>
method is universally supported in <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOMs but is not necessarily
available at all in XHTML DOMs.
</p>

<p id="bdFD_17">
Other ways of handling the possibility that the browser will not
support either javascript or the features required by the script used
is to design the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span>/<span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> parts of the page so that the script, upon
verifying support for the features it requires, can modify, manipulate
and transform the resulting elements in the DOM. But in the absence of
sufficient script support the unmodified <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> presents all of the
required content, navigation, etc.
</p>

<p id="bdFD_18">
This can be particularly significant with things like navigation menus.
One style of design would place the content of the navigation menus,
the URLs and text, in javascript structures such as Arrays. But either
of javascript being disabled/unavailable on the client or the absence
of the features required to support a functional javascript menu would
leave the page without any navigation at all. Generally that would not
be a viable web page, and not that good for search engine placement as
search engine robots do not tend to execute javascript either so they
would be left unable to navigate a site featuring such a menu and so
unable to rank its content for listing.
</p>

<p id="bdFD_19">
A better approach to menu design would have the navigation menu content
defined in the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span>, possibly as nested list elements of some sort, and
once the script has ascertained that the browser is capable of executing
it and providing the menu in an interactive form it can modify the <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span>
<code>position</code>, <code>display</code> and <code>visibility</code>
properties, move the elements to their desired location, attach event
handlers and generally get on with the task of providing a javascript
menu. And the worst that happens when the browser does not support
scripting or the required features is that the user (and any search
engine robots) finds the navigation in the page as a series of nested
lists containing links. Fully functional, if not quite as impressive as
it could have been had the script been supported. This is termed
&quot;clean degradation&quot; and goes hand in hand with feature
detecting during the process of planing and implementing a browser
script for the Internet.
</p>

<h3 id="bdGEID">Example 1: IDed Element Retrieval</h3>

<p id="bdGEID_1">
An important aspect of feature detecting is that it allows a script to
take advantage of possible fall-back options. Having deduced that a
browser lacks the preferred feature it still may be possible to
achieve the desired goal by using an alternative feature that is know
to exist on some browsers. A common example of this is retrieving an
element reference from the DOM given a string representing the
<code>ID</code> attribute of that element. The preferred method would
be the W3C Core DOM standard <code>document.getElementById</code>
method which is supported on the widest number of browsers. If that
method was not available but the browser happened to support the
<code>document.all</code> collection then it could be used for the
element retrieval as a fall-back option. And for some types of
elements, such as <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> positioned elements on Netscape 4 (where the
<code>document.layers</code> collection may be used to retrieve such
a reference), additional options may be available.
</p>

<pre id="bdGEID_ex1">
function getElementWithId(id){
    var obj;
    if(document.getElementById){
        <span class="commentJS">/* Prefer the widely supported W3C DOM method, if
           available:-
        */</span>
        obj = document.getElementById(id);
    }else if(document.all){
        <span class="commentJS">/* Branch to use document.all on document.all only
           browsers. Requires that IDs are unique to the page
           and do not coincide with NAME attributes on other
           elements:-
        */</span>
        obj = document.all[id];
    }else if(document.layers){
        <span class="commentJS">/* Branch to use document.layers, but that will only work for
           <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> positioned elements and LAYERs that are not nested. A
           recursive method might be used instead to find positioned
           elements within positioned elements but most DOM nodes on
           document.layers browsers cannot be referenced at all.
        */</span>
        obj = document.layers[id];
    }
    <span class="commentJS">/* If no appropriate/functional element retrieval mechanism
       exists on this browser this function returns null:-
    */</span>
    return obj||null;
}
</pre>

<p id="bdGEID_2">
Although that function is not very long or complex (without its
comments) it does demonstrate a consequence of one style of
implementation of feature detecting, it repeats the test each time
it is necessary to retrieve an element using its ID. If not too many
elements need retrieving that may not be significant, but if many
elements needed retrieving in rapid succession and performance was
significant then the overhead of performing the feature detection on
each retrieval may add up and impact on the resulting
script.
</p>

<p id="bdGEID_3">
An alternative is to assign one of many functions to a global
<code>getElementWithId</code> variable based on the results of the
feature detecting tests, as the script loads.
</p>

<pre id="bdGEID_ex2">
var getElementWithId;
if(document.getElementById){
    <span class="commentJS">/* Prefer the widely supported W3C DOM method, if 
       available:-
    */</span>
    getElementWithId = function(id){
        return document.getElementById(id);
    }
}else if(document.all){
    <span class="commentJS">/* Branch to use document.all on document.all only
       browsers. Requires that IDs are unique to the page
       and do not coincide with NAME attributes on other
       elements:-
    */</span>
    getElementWithId = function(id){
        return document.all[id];
    }
}else if(document.layers){
    <span class="commentJS">/* Branch to use document.layers, but that will only work for <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span>
       positioned elements. This function uses a recursive method
       to find positioned elements within positioned elements but most
       DOM nodes on document.layers browsers cannot be referenced at
       all. This function is expected to be called with only one
       argument, exactly like the over versions.
    */</span>
    getElementWithId = function(id, baseLayers){
       <span class="commentJS">/* If the - baseLayers - parameter is not provided default
          its value to the document.layers collection of the main
          document:
       */</span>
       baseLayers = baseLayers||document.layers;
       <span class="commentJS">/* Assign the value of the property of the - baseLayers -
          object (possibly defaulted to the document.layers
          collection) with the property name corresponding to the
          - id - parameter to the local variable - obj:
       */</span>
       var obj = baseLayers[id];
       <span class="commentJS">/* If - obj - remains undefined (no element existed with the
          given - id -) try searching the indexed members of
          - baseLayers - to see if any of their layers collections
          contain the element with the corresponding - id:
       */</span>
       if(!obj){ <span class="commentJS">//Element not found</span>
          <span class="commentJS">/* Loop through the indexed members of - baseLayers: */</span>
          for(var c = 0;c &lt; baseLayers.length;c++){
             if((baseLayers[c])&amp;&amp;  <span class="commentJS">//Object at index - c.</span>
               (baseLayers[c].document)&amp;&amp; <span class="commentJS">//It has a - document.</span>
               <span class="commentJS">/* And a layers collection on that document: */</span>
               (baseLayers[c].document.layers)){
                <span class="commentJS">/* Recursively call this function passing the - id - as
                   the first parameter and the layers collection from
                   within the document found on the layer at index - c
                   - in - baseLayers - as the second parameter and
                   assign the result to the local variable - obj: 
                */</span>
                obj=getElementWithId(id,baseLayers[c].document.layers);
                <span class="commentJS">/* If - obj - is now not null then we have found the
                   required element and can break out of the - for -
                   loop:
                */</span>
                if(obj)break;
             }
          }
       }
       <span class="commentJS">/* If - obj - will type-convert to boolean true (it is not null
          or undefined) return it, else return null:
       */</span>
       return obj||null;
    }
}else{
    <span class="commentJS">/* No appropriate element retrieval mechanism exists on
       this browser. So assign this function as a safe dummy.
       Values returned form calls to getElementWithId probably
       should be tested to ensure that they are non-null prior
       to use anyway so this branch always returns null:-
    */</span>
    getElementWithId = function(id){
        return null;
    }
}

<span class="commentJS">/*
Usage:-

var elRef = getElementWithId(&quot;ID_string&quot;);
if(elRef){
    ... //element was found
}else{
    ... //element could not be found.
}
*/</span>
</pre>

<p id="bdGEID_4">
The feature detecting tests are performed once as the page loads and
one of many function expressions assigned to the
<code>getElementWithId</code> global variable as a result. The
assigned function is the one most capable of retrieving the required
element on the browser in use but it is still necessary to check that
the returned value in not <code>null</code> and plan for the
possibility of failure in the element retrieval process. It is
guaranteed to fail on any browser that does not implement at least one
of the element retrieval mechanisms used as the default function just
returns <code>null</code>.
</p>

<p id="bdGEID_5">
It may not be sufficient to provide a function that does the best job
of element retrieval that can be done on the browser in use. Other
scripts, or parts of the script, may need to know how successful their
attempts to retrieve elements are likely to be. The
<code>getElementWithId</code> version that uses
<code>document.layers</code> cannot retrieve elements that are not <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span>
positioned and that may not be good enough for some scripts, while it
may not matter to others. The <code>document.getElementById</code> and
<code>document.all</code> versions should be able to retrieve any
element given its <code>ID</code>. An opting would be to set a couple
of boolean flags to indicate how successful element retrieval can be
expected to be. Defaulting the flags to <code>false</code> and setting
them to <code>true</code> in the branches that assign the various
function expressions. Then if other code is interested in what can be
expected from the <code>getElementWithId</code> function, say in order
to decide how to configure, or default itself,  it can check the
pertinent flag.
</p>

<pre id="bdGEID_ex3">
var getElementWithId;
var canGetAnyElement = false; <span class="commentJS">//default any element flag</span>
var canGetCSSPositionedElements = false; <span class="commentJS">//default <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> positioned flag</span>
if(document.getElementById){
    canGetAnyElement = true; <span class="commentJS">//set any element flag to true</span>
    canGetCSSPositionedElements = true; <span class="commentJS">//set <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> positioned flag true</span>
    getElementWithId = ...
}else if(document.all){
    canGetAnyElement = true; <span class="commentJS">//set any element flag to true</span>
    canGetCSSPositionedElements = true; <span class="commentJS">//set <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> positioned flag true</span>
    getElementWithId = ...
}else if(document.layers){
    canGetCSSPositionedElements = true; <span class="commentJS">//set <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> positioned flag true</span>
    <span class="commentJS">/* The - canGetAnyElement - flag is not set in this branch because 
       the document.layers collection does not make *all* elements
       available.
    */</span>
    getElementWithId = ...
}else{
    <span class="commentJS">/* Neither flag is set when the dummy function is assigned because
       it is guaranteed not to be able to retrieve any elements:
    */</span>
    getElementWithId = function(id){
        return null;
    }
}
...
if(canGetCSSPositionedElements){
    <span class="commentJS">/* Expect to be able to retrieve <span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span> positioned elements.
    */</span>
    ...
    if(canGetAnyElement){
        <span class="commentJS">/* Expect to also be able to retrieve any other elements that
           have an ID attribute.
        */</span>
        ...
    }
}
</pre>

<p id="bdGEID_6">
The flags do not directly reflect which feature is going to be used
for element retrieval, instead they reflect what can be expected from
the <code>getElementWithId</code> function on the current browser.
Allowing a script that requires a particular level of performance
(say the retrieval of any element) to determine whether it will have
that facility but without denying the facility from a script with a
less demanding requirement.
</p>

<h3 id="bdScroll">Example 2: Scroll Values</h3>

<p id="bdScroll_1">
Another common task that needs to be approached differently on
different browsers is the retrieval of the extent to which the user
has scrolled a web page. The majority of browsers provide properties
of the global object called <code>pageXOffset</code> and
<code>pageYOffset</code>, which hold the relevant values. Some make the
equivalent browsers available as scrollLeft and scrollTop properties on
the &quot;root&quot; element (either in addition to the
<code>pageX/YOffset</code> properties or instead of them). The task is
complicated further by the fact that which element is the
&quot;root&quot; element depends on various factors, it was always the
<code>document.body</code> element in the past but newer (<span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span>)
standards compliant browsers (and browsers that can operate in various
modes, including standards compliant mode) make the
<code>document.documentElement</code> the root element. Then there may
be browsers that do not make the scrolling values available at all.
</p>

<p id="bdScroll_2">
Because the <code>pageXOffset</code> and <code>pageYOffset</code>
properties are implemented on the largest number of browsers, and their
use avoids the need to worry about the &quot;root&quot; element, they
are the preferred values to use. In there absence the problem moves on
to identifying the &quot;root&quot; element, which is made easier by
the browsers that understand standards compliant mode and provide a
<code>document.compatMode</code> string property to announce which mode
they are in.  If the string property is missing or the value of that
string is other than <code>&quot;CSS1Compat&quot;</code> then it is the
<code>document.body</code> object that needs to be read for the
scrolling values, else the <code>document.documentElement</code> should
be read. Testing for the presence of any of the scroll values
themselves needs to done with a <code>typeof</code> test because they
are numeric values and if implemented but set to zero a type-converting
test would return <code>false</code> but that would not be an indicator
of their absence.
</p>

<p id="bdScroll_3">
The following is an example that employs feature detection to decide
which scroll values to read:-
</p>

<pre id="bdScroll_ex1">
<span class="commentJS">/* The - getPageScroll - global variable is assigned a reference to a
   function and when that function is called initially it configures
   the script to read the correct values, if available, and then
   returns a reference to the object - interface - which provides
   methods that retrieve the scroll values. Subsequent invocations of
   the getPageScroll function do not repeat the configuration, they
   just return a reference to the same interface object. Because the
   configuration stage may need to check whether the document.body
   element exists the function cannot be called until the browser has
   parsed the opening body tag as prior to that point there is no
   document.body element.

   Usage:-
   var scrollInterface = getPageScroll();
   var scrollX = scrollInterface.getScrollX();
   var scrollY = scrollInterface.getScrollY();

   The interface methods return NaN if the browser provides no method
   of reading the scroll values. A returned NaN value can be tested for
   with the - isNaN - global function, but it should not be necessary
   to perform the isNaN test on more than the first retrieval because
   if the returned value is NaN it will always be NaN and if it is not
   it should never be.

   if(isNaN(scrollX)){
    //No scroll value retrieval mechanism was available on this browser
   }

   (* The script performs an inline execution of a function expression
   which returns the function object that is assigned to the -
   getPageScroll - global variable. This produces a closure that
   preserves the local variables of the executed function expression,
   allowing the execution context of the function expression to provide
   a repository for the configuration results, keeping them out of the
   global namespace. The format is:-

                   v--- Anonymous function expression --v
   var variable = (function(){ ...; return returnValue; })();
          Inline execution of the function expression ----^^

   The value returned by the inline execution of the anonymous function
   expression is assigned to the variable. If that returned value is a
   reference to an inner function object then the assignment will form
   a closure.)
*/</span>
var getPageScroll = (function(){
    <span class="commentJS">/* The local variable &quot;global&quot; is assigned the value - this -
       because the function expression is executing in the global
       context and - this - refers to the global object in that
       context. The global object is usually the - window - object on
       web browsers but this local variable is going to be used in the
       configuration tests for convenience:
    */</span>
    var global = this;
    <span class="commentJS">/* notSetUp - Is a flag to indicate when the script has done the
       setup configuration:
    */</span>
    var notSetUp = true;
    <span class="commentJS">/* readScroll - Is initially a dummy object that is used to return
       the NaN values whenever no functional scroll value retrieval
       mechanism is available on the browser. It is assigned a
       reference to the object from which the scroll values can be read
       if the feature detection determines that to be possible:
    */</span>
    var readScroll = {scrollLeft:NaN,scrollTop:NaN};
    <span class="commentJS">/* Using the local variables - readScrollX - and readScrollY - to
       hold the property names allows the same functions to read both
       the pageX/YOffset properties of the global object and the
       scrollTop/Left properties of the &quot;root&quot; element by assigning
       different values to the variables. These are the defaults:
    */</span>
    var readScrollX = 'scrollLeft';
    var readScrollY = 'scrollTop';
    <span class="commentJS">/* The - itrface - local variable is assigned a reference to an
       object and it is this object that is returned whenever
       getPageScroll() is called. The object has two properties,
       getScrollX and getScrollY, which are assigned the values of two
       anonymous function expressions. These functions are inner
       functions and as a result have access to the local variables of
       the function that contains them (the anonymous function
       expression that is executed inline in order to assign value to
       the getPageScroll global variable). The use a square bracket
       property accessor to read a value of whatever object has been
       assigned to the variable - readScroll - with a property name
       that corresponds to the value assigned to whichever of the
       variables - readScrollX - or - readScrollY - are employed,
       allows the functions to use the simplest code poible to provide
       values for all of the possible permutations resting from the
       feature detection derived configuration:
    */</span>
    var itrface = {
        getScrollX:function(){
            return readScroll[readScrollX];
        },
        getScrollY:function(){
            return readScroll[readScrollY];
        }
    };
    <span class="commentJS">/* The - setUp - inner function is called to perform the feature
       detection and configure the variables that will be employed in
       reading the correct scroll values. It sets the - notSetUp - flag
       to false once it has been executed so that configuration only
       happens the first time that a request for the interface object
       is made:
    */</span>
    function setUp(){
        <span class="commentJS">/* As the paeX/YOffset properties are the preferred values to
           use they are tested for first. They are not both tested
           because if one exists the other can be assumed to exist for
           symmetry. The testing method is a - typeof - test to see if
           the value is a number. A type-converting test cannot be used
           because the number zero would result in boolean false and a
           pageXOffset value will be zero if the page has not been
           scrolled:
        */</span>
        if(typeof global.pageXOffset == 'number'){
            <span class="commentJS">/* If pageXOffset is a number then the value of the -
               global - variable (assigned a reference to the global
               object earlier) is assigned to the - readScroll -
               variable and the strings &quot;pageXOffset&quot; and &quot;pageYOffset&quot;
               are assigned to the - readScrollX - and - readScrollY -
               variables so they will be the property names used to
               access the - readScroll-  (now the global) object.
            */</span>
            readScroll = global;
            readScrollY = 'pageYOffset';
            readScrollX = 'pageXOffset';
        }else{
            <span class="commentJS">/* If pageXOffset is undefined it is time to find out which
               object is the &quot;root&quot; element. First, does the browser
               have a - document.compatMode - string, if it does then
               is its value &quot;BackCompat&quot;, &quot;QuirksMode&quot; or &quot;CSS1Compat&quot;.
               Instead of comparing the string directly it is searched
               for the substring &quot;<span class="initialism" title="Cascading Style Sheet"><abbr title="Cascading Style Sheet">CSS</abbr></span>&quot; which might make the script more
               robust in the face of possible future &quot;CSSnCompat&quot;
               modes, which are unlikely to demand that the &quot;root&quot;
               element is moved again.

               The tests also verifies that there is a -
               document.documentElement - to read and that its
               - scrollLeft - property is a number:
            */</span>
            if((typeof document.compatMode == 'string')&amp;&amp;
               (document.compatMode.indexOf('CSS') &gt;= 0)&amp;&amp;
               (document.documentElement)&amp;&amp;
               (typeof document.documentElement.scrollLeft=='number')){
                <span class="commentJS">/* The - readScrollX - and - readScrollY - variables
                   are already defaulted to the required strings so it
                   is only necessary to assign a reference to the -
                   document.documentElement - to the - readScroll -
                   variable:
                */</span>
                readScroll =  document.documentElement;
            <span class="commentJS">/* If the browser is not in the appropriate mode the scroll
               values should be read from the document.body - element,
               assuming it exists on this browser and that the
               - scrollLeft - property is a number:
            */</span>
            }else if((document.body)&amp;&amp;
                     (typeof document.body.scrollLeft == 'number')){
                <span class="commentJS">/* The - readScrollX - and - readScrollY - variables
                   are already defaulted to the required strings so it
                   is only necessary to assign a reference to the -
                   document.body - to the - readScroll - variable:
                */</span>
                readScroll =  document.body;
            }
            <span class="commentJS">/* No other scroll value reading options exist so if -
               readScroll - has not been assigned a new value by this
               point it will remain a reference to the object with the
               NaN value properties.
            */</span>
        }
        notSetUp = false; <span class="commentJS">//No need to repeat configuration.</span>
    }
    <span class="commentJS">/* The inline execution of the anonymous function expression
       returns with the following statement. It returns an inner
       function expression and it is that function that will be called
       when getPageScroll() is executed. Doing this forms a closure,
       preserving all of the local variables and functions defined
       within the executed anonymous function expression. Calling that
       returned function as - getPageScroll() - executes the setUp
       function, but only if it has not already been called, and
       returns a reference to the - itrface - object.
    */</span>
    return (function(){
        if(notSetUp){ <span class="commentJS">//If the - notSetUp - variable is still true.</span>
            setUp();  <span class="commentJS">//Execute the - setUp - function.</span>
        }
        return itrface; <span class="commentJS">//returns a reference to - itrface</span>
    });
})(); <span class="commentJS">//inline-execution of anonymous function expression, one-off!</span>
</pre>

<p id="bdScroll_4">
The effect of this code is to match the browser's ability to provide
the scrolling information with a script's desire to read it through a
simple and efficient interface that acts based on the results of
featured detecting tests that it applies only once, and if the browser
does not support any methods of reading the scroll values the return
values form the interface method indicate that fact by being NaN. It
does not matter that Netscape 4 will be reading the global
<code>pageX/YOffset</code> properties, that IE 4 will read the
<code>scrollTop/Left</code> properties from <code>document.body</code>
or that IE 6 will read those values from one of two possible objects
based on the <code>document.compatMode</code> value. What is important
is that if unknown browser XYZ provides any of those mechanisms for
reporting the scroll values the script is going to be able to use them,
without ever knowing (or caring) that it is browser XYZ that it is
executing on.
</p>

<h3 id="bdReplace">Example 3: String.prototype.replace</h3>

<p id="bdReplace_1">
Feature detecting is not restricted to features of the DOM, it can be
extended to include features of the javascript language implementation.
For example the <code>String.prototype.replace</code> function in later
language versions will accept a function reference as its second
argument, while earlier versions only accept a string in that context.
Code that wants to use the function argument facility of the
<code>replace</code> method will fail badly if it is not supported on
the browser.
</p>

<p id="bdReplace_2">
As usual, a feature-detecting test for the implementation's ability to
support function arguments with the <code>replace</code> method has to
be a direct test on that feature. The following example test takes
advantage of the fact that a browser that only supports the string
argument version of <code>replace</code> will type-convert a function
reference used in that context into a string. The <code>replace</code>
method uses a Regular Expression (its first argument) to
identify parts of a string and then replaces them with a string that is
provided as its second argument. If the second argument is a function,
and the browser supports the function argument, that function is called
and its return value replaces the identified parts of the string.
</p>

<p id="bdReplace_3">
By providing a function expression that returns an empty string as its
second argument and a Regular Expression that identifies the entire
original string as the first argument, the operation of the
<code>replace</code> method will result in an empty string if the
function argument is supported. But if only string arguments are
supported then the function will be type-converted into a string and
that string will not be an empty string so the result of the
evaluation of the <code>replace</code> method will not be an empty
string. Applying a NOT (<code>!</code>) operation to the resulting
string type-converts the empty string into a boolean value, inverts
it and returns <code>true</code>, the non-empty string would result
in <code>false</code>.
</p>

<pre id="bdReplace_ex1">
<span class="commentJS">/* The original string is the one letter string literal &quot;a&quot;. The
   Regular Expression /a/ identifies that entire string, so it is the
   entire original string that will be replaced. The second argument is
   the function expression - function(){return '';} -, so the entire
   original string will be replaced with an empty string if the
   function expression is executed. If it is instead type-converted
   into a string that string will not be an empty string. The NOT (!)
   operation type-converts its operand to boolean and then inverts it
   so the results of the test is boolean true if function references
   are supported in the second argument for the - replace - method, and
   false when not supported:
*/</span>
if(!('a'.replace(/a/, (function(){return '';})))){
    ... <span class="commentJS">//function references OK.</span>
}else{
    ... <span class="commentJS">//no function references with replace.</span>
}
</pre>

<p id="bdReplace_4">
The common thread with feature detecting is that it is the code that is
going to use the features, and the nature of those features, that
defines how support for the required feature needs to be tested. Once
you get used to the idea it starts to become obvious which tests need
to be applied to verify a browser's support for a feature, and then it
is time to work on the efficient application of feature detection.
</p>

<h2 id="bdDesPb">The Javascript Design Problem</h2>

<p id="bdDesPb_1">
Javascript as a language is not that complex, it may have its quirks
but it can be defined entirely in the 173 pages of the ECMA
specification (3rd edition). The challenge of authoring javascript
comes form the diversity of execution environments. When authoring for
the Internet nothing is known about the receiving software in advance,
and even when that software is a web browser that will execute
javascript, there is still a spectrum of possible DOM implementations
to contend with.
</p> 

<p id="bdDesPb_2">
The combination of the facts that it is impossible to determine which
browser is executing the script, and that it is impossible to be
familiar with all browser DOMs can be rendered insignificant by using
feature detection to match code execution with any browser's ability to
support it. But there is still going to be a diversity of
outcomes, ranging from total failure to execute any scripts (on
browsers that do not support javascript, or have it disabled) to full
successful execution on the most capable javascript enabled browsers.
</p>

<p id="bdDesPb_3">
The challenge when designing scripts is to cope with all of the
possibilities in a way that makes sense for everyone. As those
possibilities will always include browsers incapable of executing
javascript at all, the starting point must be pages based on (valid)
<span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> that contain all of the required content, allow the necessary
navigation and are as functional as they purport to be (possibly with
the backing of server-side scripting, which does not have any of the
problems of client side scripting). On top of that reliable foundation
it is possible to layer the scripts. Feature detecting and adding
scripted enhancements when the browser is capable of supporting them,
cleanly degrading to the underlying and reliable <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> when it is not.
</p>

<p id="bdDesPb_4">
A well designed script, implementing a suitable strategy, can enhance
the underlying <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> page, exploiting the browser's capabilities to the
maximum extent possible and still exhibit planed behaviour in the
absence of any (or all) desired features and degrade cleanly where
necessary. Nobody should either consider themselves a skilled Internet
javascript author, or deprecate javascript as a language and/or browser
scripting as a task, until they have demonstrated an ability to write
a non-trivial script that achieves that goal.
</p>
</body>
</html>
