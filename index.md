<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<meta name="DCTERMS.language" scheme="RFC1766" content="en">
<meta name="DC.title" content="FAQ for comp.lang.javascript">
<meta name="DCTERMS.subject" content="Frequently asked questions in the Usenet newsgroup comp.lang.javascript">
<meta name="DC.format" content="text/html">
<meta name="DC.type" content="Text">
<meta name="DC.creator" content="Jim Ley">
<meta name="DC.publisher" content="Thomas 'PointedEars' Lahn">
<meta name="DC.Publisher.Address" content="cl&amp;#106;&amp;#115;&amp;#64;&amp;#80;o&amp;#105;n&amp;#116;&amp;#101;d&amp;#69;a&amp;#114;s.&amp;#100;&amp;#101;">
<meta name="DCTERMS.modified" content="2010-10-08">
<meta name="DCTERMS.audience" content="Programmers, web developers">
<meta name="DC.description" content="Frequently Asked Questions about JavaScript and other ECMAScript implementations">
<meta name="DC.identifier" content="http://PointedEars.de/scripts/faq/cljs/">
<meta name="DC.source" content="http://www.ecma-international.org/publications/standards/Ecma-262.htm">
<meta name="DC.source" content="news:comp.lang.javascript">
<meta name="DC.source" content="https://developer.mozilla.org/en/JavaScript">
<meta name="DC.source" content="http://msdn.microsoft.com/en-us/library/hbxc2t98%28VS.85%29.aspx">
<meta name="DC.source" content="http://msdn.microsoft.com/en-us/library/ms533050%28VS.85%29.aspx">
<meta name="DC.rights" content="copyright contributors, comp.lang.javascript">
<link rel="StyleSheet" href="faq.css" type="text/css" media="screen">
</head>
<body>
<h1>FAQ for comp.lang.javascript</h1>
<p>by <a href="http://PointedEars.de/">Thomas 'PointedEars' Lahn</a>
           and <a href="#contributors">contributors</a><br>
           Based on the <a href="http://jibbering.com/faq/">comp.lang.javascript FAQ</a>,
           version 32.2
           of 2010-10-08,
           by <a href="http://personx.tumblr.com/">Garrett Smith</a>
           and contributors.</p>
<div><ul class="horizontal">
<li><a href="https://github.com/PointedEars/faq-cljs/commits/master" title="View commit history on GitHub">Changelog</a></li>
<li><a href="https://github.com/PointedEars/faq-cljs" title="Browse Git repository on GitHub">GitHub</a></li>
</ul></div>
<p style="clear: left; text-align: left">
          Available online at <a href="http://PointedEars.de/scripts/faq/cljs/">http://PointedEars.de/scripts/faq/cljs/</a></p>
<hr>
<h2 id="toc">Table of contents</h2>
<div id="nav"><a href="notes/">FAQ Notes</a></div>
<ul id="faqList">
<li>1 <a href="#meta">Meta-FAQ meta-questions</a><ul>
<li>1.1 <a href="#why">Why this FAQ?</a>
</li>
<li>1.2 <a href="#newsgroups">Which newsgroups deal with javascript?</a>
</li>
<li>1.3 <a href="#appropriateQuestions">What questions are on-topic for comp.lang.javascript?</a>
</li>
<li>1.4 <a href="#posting">What should I do before posting to comp.lang.javascript?</a>
</li>
<li>1.5 <a href="#noAnswer">Why was my post not answered?</a>
</li>
</ul>
</li>
<li>2 <a href="#tips">Language Overview</a><ul>
<li>2.1 <a href="#ecma">What is ECMAScript?</a>
</li>
<li>2.2 <a href="#jScript">What is JScript?</a>
</li>
<li>2.3 <a href="#dom">What is the Document Object Model (DOM)?</a>
</li>
<li>2.4 <a href="#localization">Internationalisation and Localisation in javascript</a>
</li>
<li>2.5 <a href="#futureEcmaScript">What does the future hold for ECMAScript?</a>
</li>
</ul>
</li>
<li>3 <a href="#ecmascriptResources">Javascript Resources</a><ul>
<li>3.1 <a href="#books">What books are recommended for javascript?</a>
</li>
<li>3.2 <a href="#onlineResources">What online resources are available?</a>
</li>
<li>3.3 <a href="#libraryResources">Javascript Libraries</a>
</li>
</ul>
</li>
<li>4 <a href="#functions">Functions</a><ul>
<li>4.1 <a href="#scope">What is (function(){ /*...*/ })() ?</a>
</li>
<li>4.2 <a href="#functionStatement">What is a function statement?</a>
</li>
</ul>
</li>
<li>5 <a href="#dates">Dates</a><ul>
<li>5.1 <a href="#formatDate">How do I format a Date object with javascript?</a>
</li>
<li>5.2 <a href="#parseDate">How can I create a Date object from a String?</a>
</li>
</ul>
</li>
<li>6 <a href="#numbers">Numbers</a><ul>
<li>6.1 <a href="#formatNumber">How do I format a Number as a String with exactly 2 decimal places?</a>
</li>
<li>6.2 <a href="#binaryNumbers">Why does simple decimal arithmetic give strange results?</a>
</li>
<li>6.3 <a href="#parseIntBase">Why does K = parseInt('09') set K to 0?</a>
</li>
<li>6.4 <a href="#typeConvert">Why does 1+1 equal 11? or How do I convert a string to a number?</a>
</li>
<li>6.5 <a href="#randomNumber">How do I generate a random integer from 1 to n?</a>
</li>
</ul>
</li>
<li>7 <a href="#objects">Objects</a><ul>
<li>7.1 <a href="#nativeObject">What is a native object?</a>
</li>
<li>7.2 <a href="#builtInObject">What is a built-in object?</a>
</li>
<li>7.3 <a href="#hostObject">What is a host object?</a>
</li>
<li>7.4 <a href="#eval">When should I use eval?</a>
</li>
<li>7.5 <a href="#propertyAccessAgain">How do I access a property of an object using a string?</a>
</li>
</ul>
</li>
<li>8 <a href="#strings">Strings and RegExp</a><ul><li>8.1 <a href="#trimString">How do I trim whitespace?</a>
</li></ul>
</li>
<li>9 <a href="#domRef">DOM and Forms</a><ul>
<li>9.1 <a href="#formControlAccess">How do I get the value of a form control?</a>
</li>
<li>9.2 <a href="#propertyAccess">My element is named myselect[], how do I access it?</a>
</li>
<li>9.3 <a href="#globalPollution">Why doesn't the global variable "divId" always refer to the element with id="divId"?</a>
</li>
<li>9.4 <a href="#updateContent">How do I modify the content of the current page?</a>
</li>
<li>9.5 <a href="#accessElementBeforeDefined">Why does my code fail to access an element?</a>
</li>
<li>9.6 <a href="#testCookie">How can I see in javascript if a web browser accepts cookies?</a>
</li>
</ul>
</li>
<li>10 <a href="#windows">Windows and Frames</a><ul>
<li>10.1 <a href="#disableBackButton">How can I disable the back button in a web browser?</a>
</li>
<li>10.2 <a href="#frameRef">How do I access a frame's content?</a>
</li>
<li>10.3 <a href="#getWindowSize">How do I find the size of the window?</a>
</li>
<li>10.4 <a href="#isWindowOpen">How do I check to see if a child window is open, before opening another?</a>
</li>
<li>10.5 <a href="#printFrame">Why does framename.print() not print the correct frame in IE?</a>
</li>
<li>10.6 <a href="#windowClose">How do I close a window and why does it not work on the first one?</a>
</li>
<li>10.7 <a href="#permissionDenied">Why do I get permission denied when accessing a frame/window?</a>
</li>
<li>10.8 <a href="#setTimeout">How do I make a 10 second delay?</a>
</li>
<li>10.9 <a href="#printSettings">How do I change print settings for window.print()?</a>
</li>
<li>10.10 <a href="#changeBrowserDialog">How do I change the confirm box to say yes/no or default to cancel?</a>
</li>
<li>10.11 <a href="#fileDownload">How do I prompt a "Save As" dialog for an accepted mime type?</a>
</li>
<li>10.12 <a href="#modifyChrome">How do I modify the current browser window?</a>
</li>
<li>10.13 <a href="#target">How do I POST a form to a new window?</a>
</li>
<li>10.14 <a href="#openWindow">How do I open a new window with javascript?</a>
</li>
</ul>
</li>
<li>11 <a href="#ajaxRef">Ajax and Server Communication</a><ul>
<li>11.1 <a href="#ajax">What is Ajax?</a>
</li>
<li>11.2 <a href="#downloadPage">How do I download a page to a variable?</a>
</li>
<li>11.3 <a href="#getServerVariable">How do I get a jsp/php variable into client-side javascript?</a>
</li>
<li>11.4 <a href="#sessionExpired">How do I log-out a user when they leave my site?</a>
</li>
<li>11.5 <a href="#runServerScript">How do I run a server side script?</a>
</li>
<li>11.6 <a href="#noCache">How do I force a reload from the server/prevent caching?</a>
</li>
<li>11.7 <a href="#ajaxCache">Why is my Ajax page not updated properly when using an HTTP GET request in Internet Explorer?</a>
</li>
</ul>
</li>
<li>12 <a href="#debugging">Debugging</a><ul><li>12.1 <a href="#javascriptErrors">How do I get my browser to report script errors?</a>
</li></ul>
</li>
<li>13 <a href="#doNotTry">Things not to attempt in a browser</a><ul>
<li>13.1 <a href="#detectBrowser">How do I detect Opera/Safari/IE?</a>
</li>
<li>13.2 <a href="#preventAccess">How can I prevent access to a web page by using javascript?</a>
</li>
<li>13.3 <a href="#hideSource">How do I protect my javascript code?</a>
</li>
<li>13.4 <a href="#disableRightClick">How do I suppress a context menu (right-click menu)?</a>
</li>
<li>13.5 <a href="#readFile">How can I access the client-side filesystem?</a>
</li>
<li>13.6 <a href="#javascriptURI">I have &lt;a href="javascript:somefunction()"&gt;  what ... ?</a>
</li>
</ul>
</li>
<li>14 <a href="#comments">Comments and Suggestions</a><ul>
<li>14.1 <a href="#FAQENTRY">Why do some posts have &lt;FAQENTRY&gt; in them?</a>
</li>
<li>14.2 <a href="#makeSuggestion">How do I make a suggestion?</a>
</li>
<li>14.3 <a href="#contributors">Contributors</a>
</li>
</ul>
</li>
</ul>
<hr>
<div id="meta" class="section">
<h2 id="FAQ1">1 Meta-FAQ meta-questions</h2>
<P>
    This is the meta-FAQ for comp.lang.javascript.  The latest
    version is available at <a href="http://PointedEars.de/faq/">http://PointedEars.de/faq/</a> in HTML form.
</P>
<P>
    For additional explanation and detail relating to some aspects
    of the FAQ, please see the
    <a href="notes/index.md">FAQ Notes</a>.
    It has been provided separately to avoid increasing the size of
    the FAQ to a point where it would be unreasonable to post it to
    the group.
</P>
<P>
    Code examples in this FAQ use <a href="https://code.google.com/p/jsdoc-toolkit/">JSDoc Toolkit</a> comments.
</P>
<div id="why" class="section">
<h3 id="FAQ2_0">1.1 Why this FAQ?</h3>
<P>
      This document is work in progress, intended to replace
      the comp.lang.javascript FAQ that has gone unmaintained
      since 2010-10-08 CE.
</P>
</div>
<div id="newsgroups" class="section">
<h3 id="FAQ2_1">1.2 Which newsgroups deal with javascript?</h3>
<P>
      The official Big 8 Usenet newsgroup dealing with javascript is
      <a href="news:comp.lang.javascript'">comp.lang.javascript</a>.
      Some "language" hierarchies also have *.comp.lang.javascript groups.
</P>
<P>
      c.l.js is an unmoderated newsgroup.
</P>
</div>
<div id="appropriateQuestions" class="section">
<h3 id="FAQ2_2">1.3 What questions are on-topic for comp.lang.javascript?</h3>
<P>
      The comp.lang.javascript newsgroup deals with ECMAScript
      languages, so any questions about JavaScript or JScript are
      welcome. However, the majority of questions sent to this group
      relates to javascript in a web browser. If you are experiencing
      issues with a particular browser, or the host is not a browser
      at all, please make this information clear.
</P>
<P>
      Javascript and Java are two completely different languages.
      Java questions should be asked in one of the comp.lang.java.*
      newsgroups; they are not appropriate for c.l.js (as Java and
      javascript are distinct programming languages with only
      superficial similarities due to sharing a C-like syntax and
      some of the characters in their names).
</P>
<P>
      Questions dealing with other scripting languages, such as
      VBScript, PerlScript or CGI scripting are also off-topic,
      as are HTML-only or CSS-only questions.
</P>
    
<P>
      Questions that are specific to Microsoft's JScript may also
      be appropriately asked at:
      <a href="news:microsoft.public.scripting.jscript'">microsoft.public.scripting.jscript</a>
</P>
<P>
      The comp.lang.javascript newsgroup charter is included in
      <a href="faq_notes/cljs_charter.html">faq_notes/cljs_charter.html</a>.
</P>
</div>
<div id="posting" class="section">
<h3 id="FAQ2_3">1.4 What should I do before posting to comp.lang.javascript?</h3>
<P>
      Before posting to c.l.js, you should read this document.
      You should also check the <a href="#onlineResources">Resources section</a>.
</P>
<h4 id="ask">How to Ask a Question</h4>
<UL>
<LI>State your question clearly and concisely.</LI>
<LI>Use the Subject: line to show the type of problem you have but
          include the question in the body as well.</LI>
<LI>For a more detailed explanation of formatting, see
          "<a href="notes/posting/">Posting Questions and Replies to comp.lang.javascript</a>".</LI>
</UL>
<h4 id="reply">Replying</h4>
<UL>
<LI>Quote only relevant parts of earlier messages, and add your
          comments below each quoted section
          (<a href="http://www.ietf.org/rfc/rfc1855.txt">FYI28/RFC1855</a>).</LI>
<LI>Link to specific sections of the FAQ that are relevant.</LI>
<LI>Avoid being unnecessarily rude, but do not complain about other rude posts.</LI>
<LI>Don't quote signatures.</LI>
</UL>
<h4 id="postCode">Posting Code</h4>
<UL>
<LI>
        Remove everything that does not contribute to the problem (images,
        markup, other scripts, etc).
</LI>
<LI>Validate the HTML and CSS <a href="http://validator.w3.org/">http://validator.w3.org/</a>,
          <a href="http://jigsaw.w3.org/css-validator/">http://jigsaw.w3.org/css-validator/</a>.</LI>
<LI>Make sure the code is executable as transmitted.</LI>
<LI>Format lines to 72 characters; indent with 2-4 spaces (not tabs).</LI>
<LI>State what you expect the code to do.</LI>
<LI>Mention the platforms, browsers, and versions.</LI>
<LI>See also the <a href="#debugging">FAQ section on debugging</a>.</LI>
<LI>Post in plain-text only. Do not encode it. Do not attach files.</LI>
<LI>If the code is more than about 100 lines, provide a URL in addition.</LI>
<LI>Do not multi-post; cross-post if necessary
          (<a href="http://en.wikipedia.org/wiki/Cross-post">Wikipedia description</a>).</LI>
</UL>
<h4 id="doNotPost">What Not to Post</h4>
<UL>
<LI>Do not post job postings. Job postings should go to
          an appropriate regional jobs group.</LI>
<LI>Do not post copyright material without permission
          from the copyright holder.</LI>
</UL>
<P>
      Relevant announcements are welcome, but no more often than once
      per major release, as a short link to the product's webpage.
</P>
</div>
<div id="noAnswer" class="section">
<h3 id="FAQ2_4">1.5 Why was my post not answered?</h3>
<P>This could be for several reasons:</P>
    <UL>
<LI>It was a variation of a frequently asked question and was
          therefore ignored by everyone.</LI>
<LI>Nobody knows the answer.</LI>
<LI>The person with the answer has not seen the post.</LI>
<LI>It might not be possible to do what you want to do but perhaps
          readers of c.l.js are reluctant to answer your post in the negative
          when they are not convinced that it cannot be done.</LI>
<LI>The question was not asked clearly enough, or did not included
          enough information to be answered.</LI>
<LI>The questioner did not realise the need to read the group, for a
          few days, to see the answers posted there.</LI>
<LI>You ignored the <a href="#posting">section on posting</a>
</LI>
    </UL>
<p>If it is not one of these, then after a few days consider
       reposting after checking
       <a href="http://groups.google.com/group/comp.lang.javascript/topics">http://groups.google.com/group/comp.lang.javascript/topics</a>
       for replies. Make sure the post is phrased well, and everything
       needed to answer is correct, and the subject is appropriate.</p>
</div>
</div>
<div id="tips" class="section">
<h2 id="FAQ2">2 Language Overview</h2>
<div id="ecma" class="section">
<h3 id="FAQ2_6">2.1 What is ECMAScript?</h3>
<P>
      <a href="http://www.ecma-international.org/publications/standards/Ecma-262.htm">ECMA-262</a>
      is the international standard that current language implementations
      (JavaScript™, JScript etc.) are based on.
</P>
<P>
      <a href="http://www.ecma-international.org/publications/standards/Ecma-262.htm">ECMA-262</a>
      defines the language Syntax, Types, Keywords, Operators, and built-in
      objects. The ECMAScript specification is the reference to determine the
      expected behavior of a program. ECMAScript does not define any host 
      objects, such as <code>document</code>, <code>window</code>, or
      <code>ActiveXObject</code>. 
</P>
<P>
      ECMA-327 defines the Compact Profile of ECMAScript by 
      describing the features from ECMA 262 that may be omitted in some 
      resource-constrained environments.
      <a href="http://www.ecma-international.org/publications/standards/Ecma-327.htm">http://www.ecma-international.org/publications/standards/Ecma-327.htm</a>
</P>
<P>
      The most widely supported edition of ECMA-262 is the 3rd edition (1999). 
      There is fair support for this edition in JScript 5.5+ (buggy) and good 
      support JavaScript 1.5.
</P>
<P>
      <em>For historical reasons, the term “javascript” is used herein
      as a shorthand for “ECMAScript-based programming languages”.
      Note that not all uses of that term here are correct.  For example,
      there are instances where using “DOM” instead would have been correct.
      This will be fixed in a later revision.</em>
</P>
</div>
<div id="jScript" class="section">
<h3 id="FAQ2_7">2.2 What is JScript?</h3>
<P>
      JScript is Microsoft's implementation of ECMAScript.
</P>
<P>
      Questions that are specific to Microsoft's JScript may also
      be appropriately asked at:
      <a href="news:microsoft.public.scripting.jscript'">microsoft.public.scripting.jscript</a>.    
</P>
</div>
<div id="dom" class="section">
<h3 id="FAQ2_9">2.3 What is the Document Object Model (DOM)?</h3>
<P>
      The <DFN>Document Object Model</DFN> (DOM) is a interface-based model for <code>Document</code> 
      objects. The DOM allows scripts to dynamically access and update a 
      document's content, style, and event handlers. 
</P>
<P>
      The DOM is <EM>not</EM> part of the ECMAScript programming language.
</P>
<P>
      Official DOM standards are defined by the World Wide Web Consortium.
      Scriptable browsers also have <DFN>proprietary</DFN> DOM features (<a href="http://msdn.microsoft.com/en-us/library/ms533050(VS.85).aspx">MSDN</a>, <a href="https://developer.mozilla.org/en/DOM_Client_Object_Cross-Reference">MDC</a>),
      such as <code>document.writeln()</code>.
</P>
<P>
      Also see the section on <a href="#domRef">DOM and Forms</a>.
</P>
<ul class="linkList">
<li><a href="#onlineResources">c.l.js DOM Resources</a></li>
<li><a href="http://www.w3.org/DOM/faq.html">W3C DOM FAQ</a></li>
<li><a href="http://www.w3.org/DOM/">W3C DOM </a></li>
<li><a href="https://developer.mozilla.org/en/Gecko_DOM_Reference/Introduction#What_is_the_DOM.3F">MDC: What is the DOM?</a></li>
</ul>
</div>
<div id="localization" class="section">
<h3 id="FAQ2_10">2.4 Internationalisation and Localisation in javascript</h3>
<P>
      <DFN>Internationalisation</DFN> means using one form which is everywhere both
      acceptable and understood.  Any international standard not supported by
      default can be coded for.
</P>
<P>
      For example, there is an International Standard for numeric Gregorian 
      date format; but none for decimal and thousands separators.
</P>
<P>
      <DFN>Localisation</DFN> is the process of adapting software for a specific region 
      or language by adding locale-specific components and translating text. It 
      cannot work well in general, because it requires a knowledge of all 
      preferences and the ability to choose the right one, in an environment 
      where many systems are inappropriately set anyway.
</P>
<P>
      ECMAScript has a few <DFN>localisation</DFN> features. The various 
      <code>toString()</code> methods are all implementation dependent, 
      but tend to use either UK or US settings (not necessarily correctly).
      ECMAScript Ed. 3 introduced some capabilities, including the 
      <code>toLocaleString()</code>method which should create a string 
      based on the host's locale.
</P>
<P>
      ECMAScript 5th Edition introduces limited ISO 8601 capabilities with 
      <code>Date.prototype.toISOString()</code> and new behavior for <code>Date.parse()</code>.
</P>
</div>
<div id="futureEcmaScript" class="section">
<h3 id="FAQ2_12">2.5 What does the future hold for ECMAScript?</h3>
<P>
      The 5th edition of ECMAScript was approved on 2009-12-04. There is some 
      support in implementations released before approval date (JScript 5.8, 
      JavaScript 1.8, JavaScriptCore). 
      http://www.ecma-international.org/publications/standards/Ecma-262.htm
</P>
<ul class="linkList"><li><a href="http://www.ecma-international.org/publications/standards/Ecma-262.htm">http://www.ecma-international.org/publications/standards/Ecma-262.htm</a></li></ul>
</div>
</div>
<div id="ecmascriptResources" class="section">
<h2 id="FAQ3">3 Javascript Resources</h2>
<div id="books" class="section">
<h3 id="FAQ3_1">3.1 What books are recommended for javascript?</h3>
<P>
      Most javascript books have been found to contain so many technical 
      errors that consensus recommendations have not emerged from the group.
</P>
<P>
      The following books have been considered to have value by some
      individuals on c.l.js. The reviews of these books are provided: 
</P>
<UL>
<LI>
<EM>"JavaScript: The Definitive Guide,"</EM> 5th Edition, by David Flanagan 
        <UL>
<LI>Published: 2006-08</LI>
<LI>Pages: 1018</LI>
<LI>Errata: <a href="http://oreilly.com/catalog/9780596101992/errata/">http://oreilly.com/catalog/9780596101992/errata/</a>
</LI>
<LI>Discussed in:   
            <UL>
<LI>
                <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/7283898f77fd2a66/9252aa024e058dea#c5f145ae807c918e">FAQ Update 9.85 Dated 2007-08-31</a>
</LI>
            </UL>
</LI>
        </UL>
</LI>
<LI>
        <EM>"JavaScript, The Good Parts,"</EM> 1st Edition, by Douglas Crockford
        <UL>
<LI>Published: 2008-05</LI>
<LI>Pages: 170</LI>
<LI>Errata: <a href="http://oreilly.com/catalog/9780596517748/errata/">http://oreilly.com/catalog/9780596517748/errata/</a>
</LI>
<LI>Discussed in:
                <UL> 
<LI>
                      <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/d084d2109f7b4ec7#">Crockford's 'The Good Parts': a short review</a>
</LI>
<LI>
                      <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/db1e49ab113aa05c/3987eac87ad27966#3987eac87ad27966">FunctionExpression's and memory consumptions</a>
</LI>
<LI>
                      <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/6a41f7835ee728de/da5ccfc65e2df64a#da5ccfc65e2df64a">FAQ Topic - What books are recommended for javascript? (2008-12-02)</a>
</LI>
<LI>
                       <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/3a08fb741525ab6d/">Augmenting functions</a>
</LI>    
<LI>
                       <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/bf26be6e63494ee2/acb733a1c35f6ce5#ee9e4ee29e658d5d">Crockford's JavaScript, The Good Parts (a book review).</a>
</LI>
<LI>
                       <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/df602506ee48b400/e65e00f5cad07676#e65e00f5cad07676">Closures Explained</a>
</LI>
<LI>
                       <a href="http://groups.google.com/group/comp.lang.javascript/browse_thread/thread/acadf1b22b219433/4f69a95607d0b3ae#4f69a95607d0b3ae">Javascript library development</a>
</LI>
                  </UL>
</LI>
        </UL>
</LI>
</UL>
</div>
<div id="onlineResources" class="section">
<h3 id="FAQ3_2">3.2 What online resources are available?</h3>
<h4 id="ecmaResources">ECMAScript</h4>
<DL>
<DT>The Official ECMAScript Specification</DT>
<DD><a href="%5BECMA-262%5D%20http://www.ecma-international.org/publications/standards/Ecma-262-arch.htm">[ECMA-262] http://www.ecma-international.org/publications/standards/Ecma-262-arch.htm</a></DD>
<DT>[ISO16262] ISO/IEC 16262, Second Edition 2002-06-01 : ISO Standard matching
          ECMA-262 3rd Edition, with corrections.</DT>
<DD><a href="http://standards.iso.org/ittf/PubliclyAvailableStandards/c033835_ISO_IEC_16262_2002(E).zip">http://standards.iso.org/ittf/PubliclyAvailableStandards/c033835_ISO_IEC_16262_2002(E).zip</a></DD>
<DT>[MS-ES3]: Internet Explorer ECMA-262 ECMAScript Language Specification Standards Support</DT>
<DD><a href="http://msdn.microsoft.com/en-us/library/ff520996%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ff520996%28VS.85%29.aspx</a></DD>
<DD>
<a href="res/%5BMS-ES3%5D.pdf">res/%5BMS-ES3%5D.pdf</a> (local alias)</DD>
<DT>[MS-ES3EX]: Microsoft JScript Extensions to the ECMAScript Language Specification Third Edition</DT>
<DD><a href="http://msdn.microsoft.com/en-us/library/ff521046%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ff521046%28VS.85%29.aspx</a></DD>
<DD>
<a href="res/%5BMS-ES3EX%5D.pdf">res/%5BMS-ES3EX%5D.pdf</a> (local alias)</DD>
<DT>ECMAScript on Wikipedia</DT>
<DD><a href="http://en.wikipedia.org/wiki/ECMAScript">http://en.wikipedia.org/wiki/ECMAScript</a></DD>
</DL>
<h4 id="domResources">W3C DOM</h4>
<DL>
<DT>DOM Level 1 ECMAScript Binding</DT>
<DD><a href="http://www.w3.org/TR/REC-DOM-Level-1/ecma-script-language-binding.html">http://www.w3.org/TR/REC-DOM-Level-1/ecma-script-language-binding.html</a></DD>
<DT>DOM Level 2 ECMAScript Binding</DT>
<DD><a href="http://www.w3.org/TR/DOM-Level-2-HTML/ecma-script-binding.html">http://www.w3.org/TR/DOM-Level-2-HTML/ecma-script-binding.html</a></DD>
<DT>DOM Level 2 Events</DT>
<DD><a href="http://www.w3.org/TR/DOM-Level-2-Events/events.html">http://www.w3.org/TR/DOM-Level-2-Events/events.html</a></DD>
<DT>DOM Level 2 Style</DT>
<DD><a href="http://www.w3.org/TR/DOM-Level-2-Style/">http://www.w3.org/TR/DOM-Level-2-Style/</a></DD>
<DT>DOM Level 3 ECMAScript Binding</DT>
<DD><a href="http://www.w3.org/TR/DOM-Level-3-Core/ecma-script-binding.html">http://www.w3.org/TR/DOM-Level-3-Core/ecma-script-binding.html</a></DD>
</DL>
<h4 id="browserResources">Browser Documentation</h4>
<DL>
<DT>Mozilla</DT>
<DD>JavaScript: <a href="http://developer.mozilla.org/en/docs/JavaScript">http://developer.mozilla.org/en/docs/JavaScript</a>
</DD>
<DD>Gecko DOM Reference: <a href="http://developer.mozilla.org/en/docs/Gecko_DOM_Reference">http://developer.mozilla.org/en/docs/Gecko_DOM_Reference</a>
</DD>
<DT>Microsoft</DT>
<DD>HTML and DHTML Reference: <a href="http://msdn.microsoft.com/en-us/library/ms533050.aspx">http://msdn.microsoft.com/en-us/library/ms533050.aspx</a>
</DD>
<DD>JScript Language Reference:<a href="http://msdn.microsoft.com/en-us/library/hbxc2t98%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/hbxc2t98%28VS.85%29.aspx</a>
</DD>
<DD>Scripting: <a href="http://msdn.microsoft.com/en-us/library/ms950396.aspx">http://msdn.microsoft.com/en-us/library/ms950396.aspx</a>
</DD>
<DT>Opera</DT>
<DD>Web Specifications Support: <a href="http://www.opera.com/docs/specs/#ecmascript">http://www.opera.com/docs/specs/#ecmascript</a>
</DD>
<DD>JavaScript Support: <a href="http://www.opera.com/docs/specs/js/">http://www.opera.com/docs/specs/js/</a>
</DD>
<DD>ECMAScript Support: <a href="http://www.opera.com/docs/specs/js/ecma">http://www.opera.com/docs/specs/js/ecma</a>
</DD>
<DT>BlackBerry JavaScript Reference</DT>
<DD><a href="http://docs.blackberry.com/en/developers/deliverables/11849/">http://docs.blackberry.com/en/developers/deliverables/11849/</a></DD>
<DT>ICab InScript</DT>
<DD><a href="http://www.muchsoft.com/inscript/">http://www.muchsoft.com/inscript/</a></DD>
<DT>Apple Safari</DT>
<DD>Web Content Guide: <a href="http://developer.apple.com/safari/library/documentation/AppleApplications/Reference/SafariWebContent/Introduction/Introduction.html">http://developer.apple.com/safari/library/documentation/AppleApplications/Reference/SafariWebContent/Introduction/Introduction.html</a>
</DD>
<DT>Webkit</DT>
<DD>Project Site: <a href="http://webkit.org/">http://webkit.org/</a>
</DD>
<DD>Wiki: <a href="http://trac.webkit.org/wiki">http://trac.webkit.org/wiki</a>
</DD>
<DD>DOM Reference: <a href="http://developer.apple.com/Mac/library/documentation/AppleApplications/Reference/WebKitDOMRef/index.html#//apple_ref/doc/uid/TP40006089">http://developer.apple.com/Mac/library/documentation/AppleApplications/Reference/WebKitDOMRef/index.html#//apple_ref/doc/uid/TP40006089</a>
</DD>
<DT>Netscape 4 Client-Side JavaScript Reference</DT>
<DD><a href="http://docs.sun.com/source/816-6408-10/">http://docs.sun.com/source/816-6408-10/</a></DD>
<DT>Archived documentation for MSIE 3.x</DT>
<DD><a href="http://members.tripod.com/%7Ehousten/download/">http://members.tripod.com/%7Ehousten/download/</a></DD>
</DL>
<h4 id="standaloneImplementations">Standalone ECMAScript Implementations</h4>
<DL>
<DT>Rhino: An open-source implementation of JavaScript written in Java</DT>
<DD><a href="http://www.mozilla.org/rhino/">http://www.mozilla.org/rhino/</a></DD>
<DT>Besen IDE: ECMAScript Edition 5 with IDE</DT>
<DD><a href="http://besen.sourceforge.net/">http://besen.sourceforge.net/</a></DD>
<DT>V8: Google's open source JavaScript engine</DT>
<DD><a href="http://code.google.com/p/v8/">http://code.google.com/p/v8/</a></DD>
<DT>SpiderMonkey: Mozilla's C implementation of JavaScript</DT>
<DD><a href="http://www.mozilla.org/js/spidermonkey/">http://www.mozilla.org/js/spidermonkey/</a></DD>
<DT>Digital Mars DMD Script, console and MS Active Script implementation of ECMAScript</DT>
<DD><a href="http://www.digitalmars.com/dscript/">http://www.digitalmars.com/dscript/</a></DD>
</DL>
<h4 id="nonBrowserResources">Other ECMAScript Implementations</h4>
<DL>
<DT>Developing Dashboard Widgets: Apple Developer Connection</DT>
<DD><a href="http://developer.apple.com/macosx/dashboard.html">http://developer.apple.com/macosx/dashboard.html</a></DD>
<DT>Whitebeam Apache Module: Server Side JavaScript in Apache</DT>
<DD><a href="http://www.whitebeam.org/">http://www.whitebeam.org/</a></DD>
</DL>
</div>
<div id="libraryResources" class="section">
<h3>3.3 Javascript Libraries</h3> 
<P>
      No javascript libraries are endorsed by this group. If you want help 
      with using a library, visit that library's discussion group instead.
</P> 
</div>
</div>
<div id="functions" class="section">
<h2>4 Functions</h2>
<div id="scope" class="section">
<h3>4.1 What is (function(){ /*...*/ })() ?</h3>
<P>
      This is an anonymous <DFN>FunctionExpression</DFN> that is called 
      immediately after creation.
</P>
<P>
      Variables declared inside a function are not accessible from
      outside the function. This can be useful, for example, to hide
      implementation details or to avoid polluting the global scope.
</P> 
<ul class="linkList">
<li><a href="http://yura.thinkweb2.com/named-function-expressions/">http://yura.thinkweb2.com/named-function-expressions/</a></li>
<li><a href="notes/closures/">notes/closures/</a></li>
<li><a href="http://dmitrysoshnikov.com/ecmascript/chapter-5-functions/#question-about-surrounding-parentheses">http://dmitrysoshnikov.com/ecmascript/chapter-5-functions/#question-about-surrounding-parentheses</a></li>
</ul>
</div>
<div id="functionStatement" class="section">
<h3>4.2 What is a function statement?</h3>
<P>
      The term <DFN>function statement</DFN> has been widely and wrongly used to
      describe a <code>FunctionDeclaration</code>. This is misleading because in ECMAScript, 
      a <code>FunctionDeclaration</code> is not a <DFN>Statement</DFN>; there are places in a program 
      where a <DFN>Statement</DFN> is permitted but a <code>FunctionDeclaration</code> is not. To add 
      to this confusion, some implementations, notably Mozillas', provide a 
      syntax extension called <DFN>function statement</DFN>. This is allowed under 
      section 16 of ECMA-262, Editions 3 and 5.
</P>
<P>
      Example of nonstandard <DFN>function statement</DFN>:
</P>
    
    
```javascript
// Nonstandard syntax, found in GMail source code. DO NOT USE.
try {
  // FunctionDeclaration not allowed in Block.
  function Fze(b,a){return b.unselectable=a}
  /*...*/
} catch(e) { _DumpException(e) }
```
  
<P>
      Code that uses <DFN>function statement</DFN> has three known interpretations. Some 
      implementations process <code>Fze</code> as a <DFN>Statement</DFN>, in order. Others, including 
      JScript, evaluate <code>Fze</code> upon entering the execution context that it 
      appears in. Yet others, notably DMDScript and default configuration of BESEN, 
      throw a <code>SyntaxError</code>.
</P>
<P>
      For consistent behavior across implementations, <EM>do not use function
      statement</EM>; use either <code>FunctionExpression</code> or <code>FunctionDeclaration</code> instead.
</P>
<P>
      Example of <code>FunctionExpression</code> (valid):
</P>
    
    
```javascript
var Fze;
try {
  Fze = function(b,a){return b.unselectable=a};
  /*...*/
} catch(e) { _DumpException(e) }
```
  
    Example of <code>FunctionDeclaration</code> (valid):
    
    
```javascript
// Program code
function aa(b,a){return b.unselectable=a}
```
  

<ul class="linkList">
<li><a href="example/functionStatement.html">example/functionStatement.html</a></li>
<li><a href="https://mail.mozilla.org/pipermail/es-discuss/2008-February/005314.html">https://mail.mozilla.org/pipermail/es-discuss/2008-February/005314.html</a></li>
<li><a href="http://groups.google.com/group/comp.lang.javascript/msg/aa9a32d0c6ae0342">http://groups.google.com/group/comp.lang.javascript/msg/aa9a32d0c6ae0342</a></li>
<li><a href="http://groups.google.com/group/comp.lang.javascript/msg/3987eac87ad27966">http://groups.google.com/group/comp.lang.javascript/msg/3987eac87ad27966</a></li>
<li><a href="http://nanto.asablo.jp/blog/2005/12/10/172622">http://nanto.asablo.jp/blog/2005/12/10/172622</a></li>
</ul>
</div>
</div>
<div id="dates" class="section">
<h2>5 Dates</h2>
<P>
    ISO 8601 defines date and time formats. Some benefits include:
</P>
<UL>
<LI>language-independent and unambiguous world-wide</LI>
<LI>sortable with a trivial string comparison</LI>
<LI>easily readable and writable by software</LI>
<LI>compatible with standards ISO 9075 and <a href="http://www.ietf.org/rfc/rfc3339.txt">rfc 3339</a>
</LI>
</UL>
<P>
    The ISO Extended format for common date is <code>YYYY-MM-DD</code>, and for time is
    <code>hh:mm:ss</code>.
</P>
<P>
    For an event with an offset from UTC, use <code>YYYY-MM-DDThh:mm:ss±hh:mm</code>.
</P>
<P>
    Never use a local date/time format for a non-local event. Instead, use
    UTC, as in <code>YYYY-MM-DDThh:mm:ssZ</code> (<code>Z</code> is the only letter suffix).
</P>
<P>
    The <code>T</code> can be omitted where that would not cause ambiguity. For
    rfc 3339 compliance, it may be replaced by a space and for SQL,
    it <EM>must</EM> be replaced by a single space. 
</P>
<P>
    Year <code>0000</code> is unrecognized by some formats (XML Schema, <code>xs:date</code>).
</P>
<ul class="linkList">
<li><a href="#onlineResources">ECMA-262 Date.prototype, s. 15.9</a></li>
<li><a href="http://www.cl.cam.ac.uk/~mgk25/iso-time.html">A summary of the international standard date and time notation, by Markus Kuhn</a></li>
<li><a href="http://en.wikipedia.org/wiki/ISO_8601">http://en.wikipedia.org/wiki/ISO_8601</a></li>
<li><a href="res/ISO_8601-2004_E.pdf">ISO 8601:2004(E)</a></li>
<li><a href="http://www.w3.org/QA/Tips/iso-date">W3C QA Tip: Use international date format (ISO)</a></li>
<li><a href="http://www.ietf.org/rfc/rfc3339.txt">RFC 3339, Date and Time on the Internet: Timestamps</a></li>
<li><a href="http://www.w3.org/TR/xmlschema-2/#dateTime">http://www.w3.org/TR/xmlschema-2/#dateTime</a></li>
</ul>
<div id="formatDate" class="section">
<h3 id="FAQ4_30">5.1 How do I format a Date object with javascript?</h3>
<P>
      A local <code>Date</code> object where <code>0 <= year <= 9999</code> can be 
      formatted to a common ISO 8601 format <code>YYYY-MM-DD</code> with:-
</P>
    
    
```javascript
/** Formats a Date to YYYY-MM-DD (local time), compatible with both 
 *  ISO 8601 and ISO/IEC 9075-2:2003 (E) (SQL 'date' type).
 *  @param {Date} dateInRange year 0000 to 9999.
 *  @throws {RangeError} if the year is not in range
 */
function formatDate(dateInRange) {
   var year = dateInRange.getFullYear(),
       isInRange = year >= 0 && year <= 9999, yyyy, mm, dd;
   if(!isInRange) {
     throw RangeError("formatDate: year must be 0000-9999");
   }
   yyyy = ("000" + year).slice(-4);
   mm = ("0" + (dateInRange.getMonth() + 1)).slice(-2);
   dd = ("0" + (dateInRange.getDate())).slice(-2);
   return yyyy + "-" + mm + "-" + dd;
}
```
  
<ul class="linkList"><li><a href="http://www.merlyn.demon.co.uk/js-date9.htm">http://www.merlyn.demon.co.uk/js-date9.htm</a></li></ul>
</div>
<div id="parseDate" class="section">
<h3>5.2 How can I create a Date object from a String?</h3>
<P>
      An Extended ISO 8601 local Date format <code>YYYY-MM-DD</code> can be parsed to a 
      Date with the following:
</P>
    
    
```javascript
/**Parses string formatted as YYYY-MM-DD to a Date object.
 * If the supplied string does not match the format, an 
 * invalid Date (value NaN) is returned.
 * @param {string} dateStringInRange format YYYY-MM-DD, with year in
 * range of 0000-9999, inclusive.
 * @return {Date} Date object representing the string.
 */
function parseISO8601(dateStringInRange) {
  var isoExp = /^\s*(\d{4})-(\d\d)-(\d\d)\s*$/,
      date = new Date(NaN), month,
      parts = isoExp.exec(dateStringInRange);

  if(parts) {
    month = +parts[2];
    date.setFullYear(parts[1], month - 1, parts[3]);
    if(month != date.getMonth() + 1) {
      date.setTime(NaN);
    }
  }
  return date;
}
```
   
</div>
</div>
<div id="numbers" class="section">
<h2>6 Numbers</h2>
<div id="formatNumber" class="section">
<h3 id="FAQ4_6">6.1 How do I format a Number as a String with exactly 2 decimal places?</h3>
<P>
      (For example: When formatting currency, how to format
      <code>6.57634</code> as <code>"6.58"</code>,
      <code>6.5</code> as <code>"6.50"</code>, and <code>6</code>
      as <code>"6.00"</code>?)
</P>
<P>
      Rounding of x.xx5 is unreliable, as most numbers are not
      represented exactly. See also: 
      <a href="#binaryNumbers">Why does simple decimal arithmetic give strange results?</a>
</P>
<P>
      The statement <code>n = Math.round(n * 100) / 100</code>
      converts <code>n</code> to a <code>Number</code> value close
      to a multiple of <code>0.01</code>. However, there are
      problems.  Converting the <code>Number</code> value
      <code>n</code> to a <code>String</code> value
      (<code>n.toString()</code>), does not give trailing zeroes.
      Rounding numbers that are very close to <code>x.5</code>,
      for example, <code>Math.round(0.49999999999999992)</code>
      returns <code>1</code>.      
</P>
<P>
      ECMA-262 Edition 3 introduced <code>Number.prototype.toFixed()</code>. 
      However, there are bugs in JScript 5.8 and below with certain
      values; for example, <code>0.007.toFixed(2)</code> incorrectly
      returns <code>"0.00"</code>.
</P>
    
    
```javascript
var numberToFixed = (function () { 
  /** 
   * @param {string} input
   *   Input value to be converted to string.
   * @param {number} size
   *   Desired length of output.
   * @param {string} ch
   *   Single character to prefix to <var>s</var>.
   * @return {string}
   */
  function padLeft (input, size, ch)
  {
    var s = input.toString();
    
    while (s.length < size)
    {
      s = ch + s;
    }
    
    return s;
  }
  
  function toUnsignedString (m, digits)
  {
    var t,
        s = Math.round(m * Math.pow(10, digits)).toString(),
        start, end;
        
    if (/\D/.test(s))
    { 
      return m.toString();
    }
    
    s = padLeft(s, 1 + digits, "0");
    start = s.substring(0, t = (s.length - digits));
    end = s.substring(t);
    
    if (end)
    {
      end = "." + end;
    }
    
    /* avoid "0." */
    return start + end;
  }  

  /**
   * @param {number} n
   *   Number to be formatted
   * @param {number} digits
   *   Number of decimal digits
   * @return {string}
   *   The formatted string 
   */
  return function (n, digits) {
    var unsigned = toUnsignedString(Math.abs(n), digits);
    return (n < 0 ? "-" : "") + unsigned;
  };  
})();

// Test results 
document.writeln([
  "numberToFixed(9e-3, 12) => " + numberToFixed(9e-3, 12),
  "numberToFixed(1.255, 2) => " + numberToFixed(1.255, 2),
  "numberToFixed(1.355, 2) => " + numberToFixed(1.355, 2),
  "numberToFixed(0.1255, 3) => " + numberToFixed(0.1255, 3),
  "numberToFixed(0.07, 2)   => " + numberToFixed(0.07, 2),
  "numberToFixed(0.0000000006, 1) => " + numberToFixed(0.0000000006, 1),
  "numberToFixed(0.0000000006, 0) => " + numberToFixed(0.0000000006, 0)
].join("\n"));
```
  
<ul class="linkList">
<li><a href="http://www.merlyn.demon.co.uk/js-round.htm">http://www.merlyn.demon.co.uk/js-round.htm</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/sstyff0z%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/sstyff0z%28VS.85%29.aspx</a></li>
</ul>
</div>
<div id="binaryNumbers" class="section">
<h3 id="FAQ4_7">6.2 Why does simple decimal arithmetic give strange results?</h3>
<P>
      For example, <code>5 * 1.015</code> does not give exactly 
      <code>5.075</code> and <code>0.06+0.01</code> does 
      not give exactly <code>0.07</code> in javascript. 
</P>
<P>
      ECMAScript numbers are represented in binary as IEEE-754 (IEC 559)
      Doubles, with a resolution of 53 bits, giving an accuracy of
      15-16 decimal digits; integers up to just over <code>9e15</code> are 
      precise, but few decimal fractions are.  Given this, arithmetic 
      is as exact as possible, but no more.  Operations on integers 
      are exact if the true result and all intermediates are integers 
      within that range.
</P>
<P>
      In particular, non-integer results should not normally be
      compared for equality; and non-integer computed results
      commonly need rounding; see <a href="#formatNumber">How do I format a Number as a String with exactly 2 decimal places?</a>
</P>
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/7wkd9z69%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/7wkd9z69%28VS.85%29.aspx</a></li>
<li><a href="http://www.merlyn.demon.co.uk/js-misc0.htm#DW4">http://www.merlyn.demon.co.uk/js-misc0.htm#DW4</a></li>
</ul>
<P>
      Otherwise, use <code>Math.round</code> on the results of expressions which 
      should be of integer value.
</P>
</div>
<div id="parseIntBase" class="section">
<h3 id="FAQ4_12">6.3 Why does K = parseInt('09') set K to 0?</h3>
<P>
      Method <code>parseInt</code> generally needs a second parameter, <code>radix</code>, 
      for the base (from 2 to 36).
</P>
<P>
      If <code>radix</code> is omitted, the base is determined by the contents of 
      the string. Any string beginning with <code>'0x'</code> or <code>'0X'</code> represents a 
      hexadecimal number. A string beginning with a leading 0 may be parsed as 
      octal (as if <code>raxix</code> were 8), in ECMA-262 Ed 3 (octal digits are <code>0-7</code>). 
      If string <code>'09'</code> is converted to <code>0</code>. 
</P>
<P>
      To force use of a particular base, use the <code>radix</code> 
      parameter: <code>parseInt("09", base)</code>. 
     
     
</P>
<ul class="linkList">
<li><a href="http://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Global_Functions/parseInt">http://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Global_Functions/parseInt</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/x53yedee%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/x53yedee%28VS.85%29.aspx</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/toplev.htm#1064173">http://docs.sun.com/source/816-6408-10/toplev.htm#1064173</a></li>
<li><a href="notes/type-conversion/#tcPrIntRx">notes/type-conversion/#tcPrIntRx</a></li>
</ul>
</div>
<div id="typeConvert" class="section">
<h3>6.4 Why does 1+1 equal 11? or How do I convert a string to a number?</h3>
<P>
      Variables are not typed; their values are. The conversion between a
      string and a number happens automatically. 
</P>
<P>
      The addition operator (<code>+</code>) performs concatenation if either operand is a 
      string, thus <code>"1" + 1</code> results <code>"11"</code>. To perform addition, you might need 
      to first convert the string to a number. For example <code>+varname</code> or 
      <code>Number(varname)</code> or <code>parseInt(varname, 10)</code> or 
      <code>parseFloat(varname)</code>. Form control values are strings, as is the result 
      from a <code>prompt</code> dialog. Convert these to numbers before performing 
      addition: <code>+'1' + 1</code> results <code>2</code>.
</P>
<ul class="linkList">
<li><a href="notes/type-conversion/">Additional Notes</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/67defydd%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/67defydd%28VS.85%29.aspx</a></li>
</ul>
</div>
<div id="randomNumber" class="section">
<h3 id="FAQ4_22">6.5 How do I generate a random integer from 1 to n?</h3>
<P>
      <code>Math.random()</code> returns a value <code>R</code> such that <code>0 <= R < 1.0</code>; therefore:
</P>
    
    
```javascript
// positive integer expected
function getRandomNumber(n) { 
  return Math.floor(n * Math.random());
}
```
  
gives an evenly distributed random integer in the range from 
    <code>0</code> to <code>n - 1</code> inclusive; use <code>getRandomNumber(n)+1</code> for <code>1</code> to <code>n</code>.
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/41336409%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/41336409%28VS.85%29.aspx</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/math.htm">http://docs.sun.com/source/816-6408-10/math.htm</a></li>
<li><a href="http://www.merlyn.demon.co.uk/js-randm.htm">http://www.merlyn.demon.co.uk/js-randm.htm</a></li>
</ul>
</div>
</div>
<div id="objects" class="section">
<h2>7 Objects</h2>
<div id="nativeObject" class="section">
<h3>7.1 What is a native object?</h3>
<P>
      A <DFN>native object</DFN> is any object whose semantics are fully defined by
      ECMA-262.
</P>
<P>
      Some <DFN>native objects</DFN> are <DFN>built-in</DFN>; others, such as <DFN>user-defined</DFN> objects, 
      may be constructed during the execution of an ECMAScript program.
</P>
<P>
      Example:
</P>
    
    
```javascript
// Native built-in objects:
var m = Math, // Built-in Math object.
    slice = Array.prototype.slice, // Built-in native method.
    o = {}, // Native user-defined object.
    f = function(){}, // Native user-defined function.
    d = new Date(),
    a = [],
    e = new Error("My Message.");
```
  
See also:
<ul class="linkList"><li><a href="http://dmitrysoshnikov.com/ecmascript/chapter-7-2-oop-ecmascript-implementation/">http://dmitrysoshnikov.com/ecmascript/chapter-7-2-oop-ecmascript-implementation/</a></li></ul>
</div>
<div id="builtInObject" class="section">
<h3>7.2 What is a built-in object?</h3>
<P>
      A <DFN>built-in</DFN> object is any object supplied by an ECMAScript 
      implementation, independent of the host environment, that is present 
      at the start of the execution of an ECMAScript program.
</P>
<P>
      ECMA-262 3rd Edition defines the following <DFN>built-in</DFN> objects:
</P>
<DL id="builtInsList">
<DT>Objects</DT>
<DD>
<EM>global</EM>, Math</DD>
<DT>Constructors</DT>
<DD>Object, Function, Array, String, Boolean, Number, Date, RegExp</DD>
<DT>Errors</DT>
<DD>Error, Date, EvalError, RangeError, ReferenceError, SyntaxError, TypeError, URIError</DD>
<DT>Functions</DT>
<DD>eval, parseInt, parseFloat, isNaN, isFinite, decodeURI,
          decodeURIComponent, encodeURI, encodeURIComponent</DD>
</DL>
<P>
      ECMA-262 Edition 5 defines also the built-in object <code>JSON</code>.
</P>
<P>
      Nonstandard <DFN>built-in</DFN> objects may include <code>RuntimeObject</code>,
      <code>String.prototype.link</code>, <code>CollectGarbage</code>, and more.
</P>
</div>
<div id="hostObject" class="section">
<h3 id="FAQ2_8">7.3 What is a host object?</h3>
<P>
      A <DFN>host object</DFN> is any object supplied by the host environment to
      complete the execution environment of ECMAScript. 
</P>
<P>
      A <DFN>host object</DFN> is not part of the ECMAScript implementation, but is 
      exposed to the ECMAScript implementation.
</P>
<P>
      A <DFN>host object</DFN> may be implemented as a native ECMAScript object, however 
      this is not required. For example, Internet Explorer implements many 
      scriptable DOM objects as ActiveX Objects, often resulting in unexpected errors. 
</P>
<P>
      Availability and behavior of a host object depends on the host environment.
</P>
<P>
    For example, in a browser, <code>XMLHttpRequest</code> might be available, with or
    without standard or proprietary features or events. Windows Script Host object model 
    has the <code>WScript</code> object available.
</P>
<P> 
     For information on a particular host object, consult the pertinent
     documentation available for the implementation(s). For web browsers,
     this usually includes the w3c specifications as well as documentation
     for that browser.
     See also:
</P>
<ul class="linkList">
<li><a href="notes/code-guidelines/#hostObjects">notes/code-guidelines/#hostObjects</a></li>
<li><a href="http://peter.michaux.ca/articles/feature-detection-state-of-the-art-browser-scripting">http://peter.michaux.ca/articles/feature-detection-state-of-the-art-browser-scripting</a></li>
</ul>
</div>
<div id="eval" class="section">
<h3 id="FAQ4_40">7.4 When should I use eval?</h3>
<P>
The <code>eval</code> function should <EM>only</EM> be used when it is necessary to
evaluate a string supplied or composed at run-time; the string
can be anything from a simple (but unpredictable) expression such
as <code>"12 * 2.54"</code> to a substantial piece of javascript code.
</P>
<P>
When <code>eval( '{"key" : 42}' )</code> is called, <code>{</code> is interpreted as a block of
code instead of an object literal. Hence, the Grouping Operator (parentheses) 
is used to force <code>eval</code> to interpret the JSON as an object literal:
<code>eval( '({"key" : 42})' );</code>.
</P>
<ul class="linkList">
<li><a href="http://json.org/">http://json.org/</a></li>
<li><a href="#propertyAccessAgain">How do I access a property of an object using a string?</a></li>
<li><a href="notes/square-brackets/">notes/square-brackets/</a></li>
</ul>
</div>
<div id="propertyAccessAgain" class="section">
<h3 id="FAQ4_39">7.5 How do I access a property of an object using a string?</h3>
<P>
      There are two ways to access properties: dot notation and square bracket 
      notation. What you are looking for is the square bracket notation in 
      which the dot, and the identifier to its right, are replaced with a set 
      of square brackets containing a string. The value of the string matches 
      the identifier. For example:-
</P>
    
    
```javascript
//dot notation
var bodyElement = document.body;

//square bracket notation, using an expression
var bodyElement = document["bo"+"dy"];
```
  
<ul class="linkList"><li><a href="notes/square-brackets/">notes/square-brackets/</a></li></ul>
</div>
</div>
<div id="strings" class="section">
<h2>8 Strings and RegExp</h2>
<div id="trimString" class="section">
<h3 id="FAQ4_16">8.1 How do I trim whitespace?</h3>
<P>
      ECMAScript Edition 5 specifies <code>String.prototype.trim()</code>. Where not implemented,
      it can be defined as a method that uses a <DFN>regular expression</DFN>:
</P>
    
    
```javascript
if (typeof String.prototype.trim != "function")
{
  String.prototype.trim = function () {
    return this.replace(/^\s+/, "").replace(/\s+$/, "");
  };
}
```
  
<P>
      Implementations are inconsistent with <code>\s</code>. For example, 
      some implementations, notably JScript 5.8 and Safari 2, do not match <code>\xA0</code> 
      (no-break space), among others.</P>
<P>
      A more consistent approach would be to create a character class 
      that defines the characters to trim.  For example, the following
      method trims exactly the characters that should be trimmed by
      a conforming implemenation of ECMAScript Ed. 5.1 (<i>WhiteSpace</i>
      and <i>LineTerminator</i>):      
</P>
    
    
```javascript
if (typeof String.prototype.trim != "function")
{
  String.prototype.trim = (function () {
    var sWhiteSpace = "[\\u0009\\u000A-\\u000D\\u0020\\u00A0"
      + "\\uFEFF\\u2028\\u2029]";
    var _prefix = new RegExp("^" + sWhiteSpace + "+");
    var _suffix = new RegExp(sWhiteSpace + "+$");
  
    return function () {
      return this.replace(_prefix, "").replace(_suffix, "");
    };
  }());
}
```
  
<ul class="linkList">
<li><a href="https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Global_Objects/RegExp">https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Global_Objects/RegExp</a></li>
<li><a href="http://thinkweb2.com/projects/prototype/whitespace-deviations/">http://thinkweb2.com/projects/prototype/whitespace-deviations/</a></li>
<li><a href="https://developer.mozilla.org/en/Firefox_3.1_for_developers">https://developer.mozilla.org/en/Firefox_3.1_for_developers</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/regexp.htm">http://docs.sun.com/source/816-6408-10/regexp.htm</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/6wzad2b2%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/6wzad2b2%28VS.85%29.aspx</a></li>
<li><a href="http://groups.google.com/group/comp.lang.javascript/browse_frm/thread/c7010139217600c3/31092c5eb99625d0?#31092c5eb99625d0">http://groups.google.com/group/comp.lang.javascript/browse_frm/thread/c7010139217600c3/31092c5eb99625d0?#31092c5eb99625d0</a></li>
<li><a href="http://unicode.org/Public/UNIDATA/PropList.txt">http://unicode.org/Public/UNIDATA/PropList.txt</a></li>
</ul>
</div>
</div>
<div id="domRef" class="section">
<h2>9 DOM and Forms</h2>
<div id="formControlAccess" class="section">
<h3 id="FAQ4_13">9.1 How do I get the value of a form control?</h3>
<P>
      In HTML documents, a form may be referred to as a property of the 
      <code>document.forms</code> collection, either by its ordinal index or by name 
      (if the <code>form</code> has a name). A <code>form</code>'s controls may be similarly referenced 
      from its <code>elements</code> collection:
</P>
    
    
```javascript
var frm = document.forms[0];
var control = frm.elements["elementname"];
```
  
<P>
      Once a reference to a control is obtained, its (string) <code>value</code> 
      property can be read:-
</P>
    
    
```javascript
var value = control.value;
value = +control.value; //string to number.
```
  
Some exceptions would be: 
<P>
      First Exception: Where the control is a <code>SELECT</code> element, and 
      support for older browsers, such as NN4, is required:
</P>
    
    
```javascript
var value = control.options[control.selectedIndex].value;
```
  
<P>
      Second Exception: Where several controls share the same name,
      such as radio buttons. These are made available as collections
      and require additional handling. For more information, see:-
</P>
<ul class="linkList">
<li><a href="notes/form-access/">notes/form-access/</a></li>
<li><a href="names/">Unsafe Names for HTML Form Controls</a></li>
</ul>
<P>
      Third Exception: File inputs. Most current browsers do not allow
      reading of <code>type="file"</code> input elements in a way that is useful.
</P>
</div>
<div id="propertyAccess" class="section">
<h3 id="FAQ4_25">9.2 My element is named myselect[], how do I access it?</h3>
<P>
Form controls with any "illegal" characters can be accessed with
<code>formref.elements["myselect[]"]</code> - The bracket characters,
amongst others, are illegal in ID attributes and javascript
identifiers, so you should try to avoid them as browsers may
handle them incorrectly.
</P>
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/ms537449%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms537449%28VS.85%29.aspx</a></li>
<li><a href="https://developer.mozilla.org/en/DOM/form">https://developer.mozilla.org/en/DOM/form</a></li>
<li><a href="notes/form-access/">notes/form-access/</a></li>
</ul>
</div>
<div id="globalPollution" class="section">
<h3 id="FAQ4_41">9.3 Why doesn't the global variable "divId" always refer to the element with id="divId"?</h3>
<P>
      Microsoft introduced a shortcut that can be used to reference
      elements which include an <code>id</code> attribute where the 
      <code>id</code> becomes a globally-accessible property. Some browsers reproduce 
      this behavior. Some, most notably Gecko-based browsers (Netscape and Mozilla),
      do so only in "quirks" mode. The best approach is the <code>document.getElementById</code>
      method, which is part of the W3C DOM standard and implemented
      in modern browsers (including IE from version 5.0). So an
      element with <code>id="foo"</code> can be referenced
      with:-
</P>
    
    
```javascript
var el = document.getElementById("foo");
```
  
<P>
      Note: make sure not to use the same <code>id</code> twice in the same document 
      and do not give an element a <code>name</code> that matches an <code>id</code> 
      of another in the same document or it will trigger bugs in MSIE &lt;= 7 with 
      <code>document.getElementsByName</code> and <code>document.getElementById</code>.
</P>
<ul class="linkList">
<li><a href="https://developer.mozilla.org/en/Using_Web_Standards_in_your_Web_Pages/Using_the_W3C_DOM#Accessing_Elements_with_the_W3C_DOM">https://developer.mozilla.org/en/Using_Web_Standards_in_your_Web_Pages/Using_the_W3C_DOM#Accessing_Elements_with_the_W3C_DOM</a></li>
<li><a href="faq_notes/faq_notes.html#FAQN4_41">faq_notes/faq_notes.html#FAQN4_41</a></li>
</ul>
</div>
<div id="updateContent" class="section">
<h3 id="FAQ4_15">9.4 How do I modify the content of the current page?</h3>
<P>
      Using the non-standard but widely implemented 
      <code>innerHTML</code> property:
      <code><div id="anID">Some Content</div></code> with script:
</P>
    
    
```javascript
document.getElementById("anID").innerHTML = 
  "Some <em>new</em> Content";
```
  
<P>
      Where <code>"anID"</code> is the (unique on the HTML page) 
      <code>id</code> attribute value of the element to modify.
</P>
<P>
      All versions of Internet Explorer exhibit problems with innerHTML, including:
</P>
<UL>
<LI>Fails with FRAMESET, HEAD, HTML, STYLE, SELECT,
          OBJECT, and all TABLE-related elements.</LI>
<LI>Replaces consecutive whitespace characters with a single space.</LI>
<LI>Changes attribute values and order of appearance.</LI>
<LI>Removes quotations around attribute values.</LI>
</UL>
<P>
      If the new content is only text and does not need to replace existing HTML, 
      it is more efficient to modify the <code>data</code> property of a text node.
</P>
    
    
```javascript
document.getElementById("anID").firstChild.data = "Some new Text";
```
  
<P>
      Compatibility Note: Implementations have been known to split long text 
      content among several adjacent text nodes, so replacing the data of the 
      first text node may not replace all the element's text. The <code>normalize</code> 
      method, where supported, will combine adjacent text nodes.
</P>
<P>
      Note: Make sure the element exists in the document (has been parsed) before trying to 
      reference it.
</P>
<ul class="linkList">
<li><a href="http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-FF21A306">http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-FF21A306</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/cc304097%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/cc304097%28VS.85%29.aspx</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms533897%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms533897%28VS.85%29.aspx</a></li>
<li><a href="http://developer.mozilla.org/en/Whitespace_in_the_DOM">http://developer.mozilla.org/en/Whitespace_in_the_DOM</a></li>
<li><a href="http://developer.mozilla.org/en/docs/DOM:element.innerHTML">http://developer.mozilla.org/en/docs/DOM:element.innerHTML</a></li>
<li><a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-end.html#html-fragment-serialization-algorithm">http://www.whatwg.org/specs/web-apps/current-work/multipage/the-end.html#html-fragment-serialization-algorithm</a></li>
</ul>
</div>
<div id="accessElementBeforeDefined" class="section">
<h3>9.5 Why does my code fail to access an element?</h3>
<P>
      An element can only be accessed after it exists in the document. 
</P>
<P>
      Either:
      A) include your script after the HTML element it refers to, or
      B) use the <code>"load"</code> event to trigger your script.
</P>
<P>
      Example A:
</P>
    
    
```javascript
<div id="snurgle">here</div>
<script type="text/javascript">
// Don't forget var.
var snurgleEl = document.getElementById("snurgle");
window.alert(snurgleEl.parentNode);
</script>
```
  
<P>
      Example B:
</P>
    
    
```javascript
// In the HEAD.
<script type="text/javascript">
window.onload = function(){
  var snurgleEl = document.getElementById("snurgle");
};
</script>
```
  
<h4>Other problems can include:</h4>
<UL>
<LI>invalid HTML</LI>
<LI>two elements with the same <code>name</code> or <code>id</code>
</LI>
<LI><a href="names/">use of an unsafe name</a></LI>
</UL>
</div>
<div id="testCookie" class="section">
<h3 id="FAQ4_4">9.6 How can I see in javascript if a web browser accepts cookies?</h3>
<P>
      Write a cookie and read it back and check if it's the same.
</P>
<ul class="linkList">
<li><a href="http://www.ietf.org/rfc/rfc2965.txt">http://www.ietf.org/rfc/rfc2965.txt</a></li>
<li><a href="http://www.galasoft-lb.ch/myjavascript/consulting/2001012701/">http://www.galasoft-lb.ch/myjavascript/consulting/2001012701/</a></li>
<li><a href="http://www.cookiecentral.com/">http://www.cookiecentral.com/</a></li>
</ul>
</div>
</div>
<div id="windows" class="section">
<h2>10 Windows and Frames</h2>
<P>
    The <code>window</code> object (also referred to by <code>self</code>) is "DOM Level 0". 
    No formal standard for it exists. 
</P>
<div id="disableBackButton" class="section">
<h3 id="FAQ4_2">10.1 How can I disable the back button in a web browser?</h3>
<P>
      You can't. The browser's history cannot be modified. However, you
      can use <code>self.location.replace(url);</code> in some browsers to replace
      the current page in the history.
</P>
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/ms536712%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms536712%28VS.85%29.aspx</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/location.htm#1194240">http://docs.sun.com/source/816-6408-10/location.htm#1194240</a></li>
</ul>
</div>
<div id="frameRef" class="section">
<h3 id="FAQ4_8">10.2 How do I access a frame's content?</h3>
<P>
      To reference another frame on the <EM>same domain</EM>:
</P>
<P>
      The <DFN>content window</DFN> of a <code>FRAME</code> or <code>IFRAME</code> can be 
      accessed by the <code>frames</code> collection.
</P>
<P>
      Example:
</P>
    
    
```javascript
var fwin;
fwin = self.frames[0]; // or:
fwin = self.frames["iframeName"];
```
  
<P>or, from the <code>IFRAME</code> or <code>FRAME</code> element:</P>
    
    
```javascript
var iframeEl = document.getElementById("myFrame");
var fwin = iframeEl.contentWindow; // Nonstandard, but widely supported.
var fdoc = iframeEl.contentDocument; // DOM2 HTML Standard.
```
  
<P>
      A global identifier <code>moomin</code> in the the iframe's <DFN>content window</DFN>
      is accessed as <code>fwin.moomin</code>.
</P>
<P>
      To communicate between frames on <EM>different</EM> domains:
</P>
<P>
      Where supported, (IE8, Firefox 3, Opera 9, Safari 4), use
      <code>window.postMessage( message[, port], otherDomain);</code>.
</P>
<P>
      Example: 
      <a href="http://jibbering.com/faq/example/postMessage.html">http://jibbering.com/faq/example/postMessage.html</a> 
</P>
<P>
      Where <code>window.postMessage</code> is not supported, the <code>window.name</code> property 
      can be set on the other window, which can poll for updates to that 
      property using <code>setInterval(checkWinName, 100);</code> where <code>checkWinName</code> 
      is a function that polls to check the value of 
      <code>self.name</code>.
</P>
<ul class="linkList">
<li><a href="http://en.wikipedia.org/wiki/Same_origin_policy">http://en.wikipedia.org/wiki/Same_origin_policy</a></li>
<li><a href="http://www-archive.mozilla.org/docs/dom/domref/dom_frame_ref5.html">http://www-archive.mozilla.org/docs/dom/domref/dom_frame_ref5.html</a></li>
<li><a href="https://developer.mozilla.org/en/DOM/window.postMessage">https://developer.mozilla.org/en/DOM/window.postMessage</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/cc197015(VS.85).aspx">http://msdn.microsoft.com/en-us/library/cc197015(VS.85).aspx</a></li>
</ul>
</div>
<div id="getWindowSize" class="section">
<h3 id="FAQ4_9">10.3 How do I find the size of the window?</h3>
<P>
      Here is a detailed explanation of a cross-browser strategy to 
      find the dimensions of the viewport, excepting all chrome 
      (excludes scrollbars, etc).
</P>
<P>
      We can consider various properties:
</P>
    
    
```javascript
window.innerWidth
document.clientWidth
document.documentElement.clientWidth
document.body.clientWidth
```
  
<P>
      Of the browsers that have an <code>innerWidth</code> property, most 
      include scrollbar dimensions. Some versions of KHTML browsers 
      (including Safari 2) do <EM>not</EM> include scrollbar width.  
</P>
<P>
      The <code>window.inner*</code> properties are unreliable and not 
      useful here. We don't want scrollbar dimensions included.
</P>

    
```javascript
document.clientWidth
```
  
<P>
      Certain versions of KHTML, including Safari 2, have 
      <code>document.clientHeight</code> and <code>document.clientWidth</code>
      properties. Where supported, these rare properties accurately 
      return the height and width of the viewport, without including 
      scrollbar dimensions.
</P>
    
    
```javascript
document.documentElement.clientWidth
document.body.clientWidth
```
  
<P>
      MSHTML (Trident), Firefox (Gecko), Opera (Presto), and Safari 
      (Webkit) all support <code>clientHeight</code> on <code>document.body</code> 
      and <code>document.documentElement</code>. The difficulty is figuring out 
      which one is reliable. In other words which object to get the 
      <code>clientHeight</code> property from:<code>documentElement</code> or <code>body</code>? 
</P>
<P>
      What the number returned from either of these properties 
      represents depends on the environment. The environment includes 
      the browser, its version, and the rendering mode of the document. 
      In quirks mode, we'll mostly want to use <code>body.clientHeight</code> 
      (except for in Safari 2).
</P>
    
    
```javascript
document.body.clientHeight
```
  
<P>    
      Some environments will return the viewport height. Others will 
      return <code>0</code>. Yet others will return the <code>clientHeight</code> of 
      the <code>BODY</code> element.
</P>
    
    
```javascript
document.documentElement.clientHeight
```
  
<P>
      This is the more "standard" property for getting the height of 
      the viewport. It usually "works" in modern browsers in 
      <DFN>standards mode</DFN>. Notable exceptions include Safari 2 and 
      Opera  &lt;= 9.25, both of which return the <code>clientHeight</code> 
      of the <code>html</code> <EM>element</EM>. (Oddly, Opera &lt;= 9.25 
      in standards mode returns the width of the viewport for 
      <code>documentElement.clientWidth</code>). 
</P>
<P>
      With the exception of Safari 2, <code>body.clientHeight</code> is reliable 
      where <code>documentElement.clientHeight</code> is found to be unreliable. 
      For example, in Safari 3+, Opera, and Mozilla, all in quirks mode, 
      <code>document.documentElement.clientHeight</code> returns the <code>clientHeight</code> 
      of the <code>html</code> element (this may seem unsurprising but 
      it is not what we want).
</P>
<P>
      Conversely, <code>document.body.clientHeight</code> will return 
      the height of the viewport in most cases where 
      <code>document.documentElement.clientHeight</code> does not. An exception
      to that is Safari 2, where <code>documentElement.clientHeight</code>
      and <code>body.clientHeight</code> both return the height of their 
      corresponding element (not what we want).
</P>
<P>
      By using a combination of <DFN>Feature Testing</DFN> and <DFN>Capability Testing</DFN>, 
      the dimensions of the viewport can be strategically retrieved 
      from  the property that works in the environment the script is 
      running in. The trick is determining which property will give us 
      the value we want.
</P>
<P>
      Since <code>document.clientHeight</code> is reliable where 
      (rarely) supported, and since browsers that support this property 
      don't return the viewport dimensions from 
      <code>document.body.clientHeight</code> or 
      <code>document.documentElement.clientHeight</code>, this should be the 
      very first condition:
</P>
    
    
```javascript
// Safari 2 uses document.clientWidth (default).
if(typeof document.clientWidth == "number") {
   // use document.clientWidth.
}
```
  
<P>
      The next strategy is to determine if 
      <code>document.documentElement.clientHeight</code> property is unreliable. 
      It is deemed "unreliable" when it is either <code>0</code> or taller 
      than the viewport.
</P>
<P>
       Determining if <code>documentElement.clientHeight</code> is <code>0</code> is easy. 
       The result is stored in a variable <code>IS_BODY_ACTING_ROOT</code>.
</P>
    
    
```javascript
var docEl = document.documentElement,
  IS_BODY_ACTING_ROOT = docEl && docEl.clientHeight === 0;
docEl = null;
```
  
<P>
      To determine if <code>documentElement.clientHeight</code> returns 
      a value taller than the viewport, we need a <DFN>Capability Test.</DFN>
</P>
<P>
      If we can force <code>documentElement</code> to be very tall 
      (taller than a normal viewport) we can then check to see if 
      <code>documentElement.clientHeight</code> returns that "very tall" number. 
      If it does, then it is unreliable.
</P>
<P>
      We can force <code>documentElement</code> to be taller than the viewport 
      (or any "normal" viewport) by adding a <code>div</code> to the <code>body</code>,
      give that <code>div</code> a height larger than any normal monitor, 
      and then check to see if <code>documentElement.clientHeight</code> is 
      that high (or "almost" that high, to account for <code>documentElement</code> 
      having a border).
</P>
    
    
```javascript
// Used to feature test Opera returning wrong values 
// for documentElement.clientHeight. 
// The results of this function should be cached, 
// so it does not need to be called more than once.
function isDocumentElementHeightOff(){ 
    var d = document,
        div = d.createElement('div');
    div.style.height = "2500px";
    d.body.insertBefore(div, d.body.firstChild);
    var r = d.documentElement.clientHeight > 2400;
    d.body.removeChild(div);
    return r;
}
```
  
<P>
      We can use this function to see if we should use 
      <code>body.clientHeight</code>, instead. (but only after checking if 
      <code>document.clientHeight</code> is supported).
</P>
    
    
```javascript
// Safari 2 uses document.clientWidth (default).
if(typeof document.clientWidth == "number") {
   // use document.clientHeight/Width.
}
else if(IS_BODY_ACTING_ROOT || isDocumentElementHeightOff()) {
    // use document.body.clientHeight/Width.
} else {
    // use document.documentElement.clientHeight/Width.
}
```
  
<P>
      The preceding strategy was developed by Garrett Smith with input 
      from John David Dalton. A complete and tested example can be found 
      in APE Library under <code>APE.dom.getViewportDimensions</code>. 
      Source code:
      <a href="http://wayback.archive.org/web/20110814142717/http://dhtmlkitchen.com/ape/build/dom/viewport-f.js">http://wayback.archive.org/web/20110814142717/http://dhtmlkitchen.com/ape/build/dom/viewport-f.js</a>.
      APE is publicly released under Academic Free License. 
      APE home: <a href="http://wayback.archive.org/web/20110628160010/http://www.dhtmlkitchen.com/ape/">http://wayback.archive.org/web/20110628160010/http://www.dhtmlkitchen.com/ape/</a>.
</P>    
<P>
      Note: The dimensions cannot be determined accurately until after 
      the document has finished loading.
</P> 
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/ms533566%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms533566%28VS.85%29.aspx</a></li>
<li><a href="http://developer.mozilla.org/en/DOM/window.innerWidth">http://developer.mozilla.org/en/DOM/window.innerWidth</a></li>
<li><a href="http://dev.opera.com/articles/view/using-capability-detection/">http://dev.opera.com/articles/view/using-capability-detection/</a></li>
</ul>
</div>
<div id="isWindowOpen" class="section">
<h3 id="FAQ4_10">10.4 How do I check to see if a child window is open, before opening another?</h3>
    
    
```javascript
var myWin;
function openWin(aURL) {
  if (!myWin || myWin.closed ) {
    myWin = window.open(aURL,'myWin');
  } else {
    myWin.location.href = aURL;
    myWin.focus();
  }
}
```
  
<P>
      Popup windows cause usability problems and are generally best avoided.
</P> 
<ul class="linkList">
<li><a href="https://developer.mozilla.org/en/DOM:window.open">https://developer.mozilla.org/en/DOM:window.open</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms533574%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms533574%28VS.85%29.aspx</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/window.htm#1201877">http://docs.sun.com/source/816-6408-10/window.htm#1201877</a></li>
<li><a href="http://www.useit.com/alertbox/990530.html">http://www.useit.com/alertbox/990530.html</a></li>
</ul>
</div>
<div id="printFrame" class="section">
<h3 id="FAQ4_11">10.5 Why does framename.print() not print the correct frame in IE?</h3>
<P>
      IE prints the frame that has focus when you call the print
      method <code>frameref.focus();frameref.print();</code>
</P>
<ul class="linkList"><li><a href="http://msdn.microsoft.com/en-us/library/ms976105.aspx">http://msdn.microsoft.com/en-us/library/ms976105.aspx</a></li></ul>
</div>
<div id="windowClose" class="section">
<h3 id="FAQ4_14">10.6 How do I close a window and why does it not work on the first one?</h3>
<P>
      If a window was opened by javascript, then it can be closed
      without confirmation by using <code>windowRef.close()</code>. 
</P>
<P>
      Before calling <code>windowRef.close()</code> (or other <code>window</code> methods), make
      sure the window reference is not null and its <code>closed</code> property is <code>false</code>. 
</P>
<P>
      Popup windows cause usability problems and are generally best avoided.
</P>
<ul class="linkList">
<li><a href="http://www.useit.com/alertbox/990530.html">http://www.useit.com/alertbox/990530.html</a></li>
<li><a href="#isWindowOpen">#isWindowOpen</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms536367%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms536367%28VS.85%29.aspx</a></li>
<li><a href="https://developer.mozilla.org/en/DOM/window.close#Description">https://developer.mozilla.org/en/DOM/window.close#Description</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/window.htm#1201822">http://docs.sun.com/source/816-6408-10/window.htm#1201822</a></li>
</ul>
</div>
<div id="permissionDenied" class="section">
<h3 id="FAQ4_19">10.7 Why do I get permission denied when accessing a frame/window?</h3>
<P>
      In the normal browser security model, a script may only access the 
      properties of documents served from the same domain or IP address, 
      protocol, and port. 
</P>
<P>
      Any attempt to access a property in such cases will result in a "Permission
      Denied" error. Signed scripts or trusted ActiveX objects can
      overcome this in limited situations.
</P>
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/ms533028%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms533028%28VS.85%29.aspx</a></li>
<li><a href="https://developer.mozilla.org/En/Same_origin_policy_for_JavaScript">https://developer.mozilla.org/En/Same_origin_policy_for_JavaScript</a></li>
</ul>
</div>
<div id="setTimeout" class="section">
<h3 id="FAQ4_20">10.8 How do I make a 10 second delay?</h3>
<P>
      There is no built-in way to pause execution in javascript such
      as a sleep function, but hosts usually provide a method of some
      form. Web browsers are designed for event driven programming and
      only provide the <code>setTimeout</code> and <code>setInterval</code> functions
      to facilitate timed delays. The delay before calling <code>getSnork</code> may
      exceed the second parameter to <code>setTimeout</code> and <code>setInterval</code>
      due to implementation differences among browsers.
</P>
<P>
      To call the function <code>getSnork</code>, approximately 10 seconds
      after the function <code>getMoomin()</code> completes, you would do this:
</P>
    
    
```javascript
getMoomin();
setTimeout(getSnork, 10000);
```
  
<P>
      Script execution is not stopped, and adding <code>getSnufkin()</code> after the
      <code>setTimeout</code> line would immediately execute the function <code>getSnufkin</code>
      before <code>getSnork</code>.
</P>
<P>
      Achieving delays through running a loop of some sort for a pre-defined 
      period is a bad strategy, as that will inhibit whatever was supposed to 
      be happening during the delay, including blocking user interation.
</P>
<P>
      Other (less event driven) hosts have different wait functions,
      such as <code>WScript.Sleep()</code> in the Windows Script Host.
</P>
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/ms536753%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms536753%28VS.85%29.aspx</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/window.htm#1203758">http://docs.sun.com/source/816-6408-10/window.htm#1203758</a></li>
<li><a href="http://en.wikipedia.org/wiki/Event-driven_programming">http://en.wikipedia.org/wiki/Event-driven_programming</a></li>
<li><a href="faq_notes/misc.html#mtSetTI">faq_notes/misc.html#mtSetTI</a></li>
</ul>
</div>
<div id="printSettings" class="section">
<h3 id="FAQ4_23">10.9 How do I change print settings for window.print()?</h3>
<P>
      In a normal security environment, you can't change anything.  
</P>
<P>
      Print Stylesheet rules provide options. 
</P>
<P>
      For IE, <code>ActiveX</code> or Plugin ScriptX and
      Neptune from Meadroid to give you more control for Windows
      versions of Internet Explorer, Netscape, and Opera.
</P>
<ul class="linkList">
<li><a href="http://www.meadroid.com/scriptx/">http://www.meadroid.com/scriptx/</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms976105.aspx">http://msdn.microsoft.com/en-us/library/ms976105.aspx</a></li>
</ul>
</div>
<div id="changeBrowserDialog" class="section">
<h3 id="FAQ4_28">10.10 How do I change the confirm box to say yes/no or default to cancel?</h3>
<P>
      The buttons on a confirm box cannot be changed, nor can a default
      button be specified. 
</P>
<P>
      Change the question to a statement so that "OK" is suitable as the
      default response.
</P>
<P>
      Example:
      "Would you like us to charge your credit card?" (wrong)
      "We will now charge your credit card." (right). 
</P>
</div>
<div id="fileDownload" class="section">
<h3 id="FAQ4_33">10.11 How do I prompt a "Save As" dialog for an accepted mime type?</h3>
<P>
      It is not possible with client-side javascript.
</P>
<P>
      Some browsers accept the Content-Disposition header, but this 
      must be added by the server. Taking the form:-
      <code>Content-Disposition: attachment; filename=filename.ext</code>
</P>
<ul class="linkList">
<li><a href="http://classicasp.aspfaq.com/general/how-do-i-prompt-a-save-as-dialog-for-an-accepted-mime-type.html">http://classicasp.aspfaq.com/general/how-do-i-prompt-a-save-as-dialog-for-an-accepted-mime-type.html</a></li>
<li><a href="http://support.microsoft.com/kb/q260519/">http://support.microsoft.com/kb/q260519/</a></li>
</ul>
</div>
<div id="modifyChrome" class="section">
<h3 id="FAQ4_36">10.12 How do I modify the current browser window?</h3>
<P>
      In a default security environment you are very limited in how much
      you can modify the current browser window.  You can use
      <code>window.resizeTo</code> or <code>window.moveTo</code> to resize or move a
      window respectively, but that is it.  Normally you can only
      suggest chrome changes in a <code>window.open</code>.
</P>
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/ms536651%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms536651%28VS.85%29.aspx</a></li>
<li><a href="https://developer.mozilla.org/en/DOM:window.open">https://developer.mozilla.org/en/DOM:window.open</a></li>
</ul>
</div>
<div id="target" class="section">
<h3 id="FAQ4_37">10.13 How do I POST a form to a new window?</h3>
<P>
      Use the target attribute on the form, opening a window with
      that name and your feature string in the onsubmit handler of the
      FORM.
</P>
    
    
```html
<form action="" method="post"
      target="wndname" onsubmit="window.open('',this.target);return true;">
```
  
<ul class="linkList"><li><a href="http://www.htmlhelp.com/reference/html40/forms/form.html">http://www.htmlhelp.com/reference/html40/forms/form.html</a></li></ul>
</div>
<div id="openWindow" class="section">
<h3 id="FAQ4_42">10.14 How do I open a new window with javascript?</h3>
<P>
      New windows can be opened on browsers that support the
      <code>window.open</code> function and are not subject to the action of any
      pop-up blocking mechanism with code such as:-
</P>
    
    
```javascript
var wRef;
if(window.open){
  wRef = window.open("http://example.com/page.html","windowName");
}
```
  
<ul class="linkList">
<li><a href="https://developer.mozilla.org/en/DOM:window.open">https://developer.mozilla.org/en/DOM:window.open</a></li>
<li><a href="http://www.infimum.dk/HTML/JSwindows.html">http://www.infimum.dk/HTML/JSwindows.html</a></li>
</ul>
</div>
</div>
<div id="ajaxRef" class="section">
<h2>11 Ajax and Server Communication</h2>
<div id="ajax" class="section">
<h3 id="FAQ4_44">11.1 What is Ajax?</h3>
<P>
<DFN TITLE="Asynchronous JavaScript and XML">Ajax</DFN>
is shorthand for Asynchronous JavaScript and XML. The technology is 
based on the <code>XMLHttpRequest</code> Object. At its simplest, 
it is the sending/retrieving of new data from the server without 
changing or reloading the window location.
</P>
<ul class="linkList">
<li><a href="http://developer.mozilla.org/en/docs/XMLHttpRequest">http://developer.mozilla.org/en/docs/XMLHttpRequest</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms535874%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms535874%28VS.85%29.aspx</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms759148%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms759148%28VS.85%29.aspx</a></li>
<li><DFN TITLE="Asynchronous JavaScript and XML">Ajax</DFN></li>
<li><a href="http://jibbering.com/2002/4/httprequest.html">http://jibbering.com/2002/4/httprequest.html</a></li>
<li><a href="http://www.ajaxtoolbox.com/">http://www.ajaxtoolbox.com/</a></li>
</ul>
</div>
<div id="downloadPage" class="section">
<h3 id="FAQ4_38">11.2 How do I download a page to a variable?</h3>
<P>      
Although <code>XMLHttpRequest</code> can be used to download 
entire pages, it is often used for downloading small pieces 
of data that can be used to update the current page.
</P>
<ul class="linkList">
<li><a href="http://jibbering.com/2002/4/httprequest.html">http://jibbering.com/2002/4/httprequest.html</a></li>
<li><a href="http://www.ajaxtoolbox.com/">http://www.ajaxtoolbox.com/</a></li>
</ul>
</div>
<div id="getServerVariable" class="section">
<h3 id="FAQ4_18">11.3 How do I get a jsp/php variable into client-side javascript?</h3>
<P>
Use a server-side language to generate the javascript.
</P>
<P>
Certain characters of ECMAScript strings must be escaped by backslash.
These include quote marks, backslash, and line terminators. 
</P>
<P>JSP Example, using Apache Commons: <code>org.apache.commons.lang.StringEscapeUtils</code>:
</P>
      
    
```javascript
var jsVar = "<%= StringEscapeUtils.escapeJavaScript(str) %>";
```
  
<P>PHP example using <code>addcslashes</code>: </P>

    
```javascript
var jsVar = "<?php echo addcslashes($str,"\\\'\"\n\r"); ?>";
```
  
<ul class="linkList">
<li><a href="example/addcslashes.php">example/addcslashes.php</a></li>
<li><a href="http://php.net/manual/en/function.addcslashes.php">http://php.net/manual/en/function.addcslashes.php</a></li>
<li><a href="http://commons.apache.org/lang/">http://commons.apache.org/lang/</a></li>
</ul>
</div>
<div id="sessionExpired" class="section">
<h3 id="FAQ4_29">11.4 How do I log-out a user when they leave my site?</h3>
<P>
This cannot be done reliably. Here's why:
</P>
     <UL>
<LI>
The user may disable javascript so the log-out script will
never execute.
</LI>
<LI>
The user may not be on-line when they close your web page.
</LI>
<LI>
Javascript errors elsewhere in the page may prevent the script
executing.
</LI>
<LI>
The browser may not support the onunload event, or may not fire
it under certain circumstances, so the log-out function will
not execute.
</LI>
     </UL>
The URL below has more information.
<ul class="linkList"><li><a href="http://groups.google.com/groups?selm=BlmZ7.55691%244x4.7344316%40news2-win.server.ntlworld.com">http://groups.google.com/groups?selm=BlmZ7.55691%244x4.7344316%40news2-win.server.ntlworld.com</a></li></ul>
</div>
<div id="runServerScript" class="section">
<h3 id="FAQ4_34">11.5 How do I run a server side script?</h3>
<P>
You trigger a server-side script by sending an HTTP request. 
This can be achieved by setting the <code>src</code> of an <code>img</code>, 
<code>Image</code>, <code>frame</code>, or <code>iframe</code>, or by using <DFN TITLE="XMLHttpRequest or XMLHTTP">XHR</DFN>, where supported.
</P>
<P>
An image will also
"swallow" the data sent back by the server, so that they will
not be visible anywhere.
</P>
      
    
```javascript
var dummyImage = new Image();
  dummyImage.src = "scriptURL.asp?param=" + varName;
```
  
<P>
Mozilla, Opera 7.6+, Safari 1.2+, and Windows IE 7
provide the <code>XMLHttpRequest</code> object
(Windows IE versions 5+, provides ActiveX to acheive an analagous 
effect). <code>XMLHttpRequest</code> can send HTTP requests to 
the server, and provides access the <code>responseText</code> or <code>responseXML</code>
(when the response is XML), and HTTP header information.
</P>
<ul class="linkList">
<li><a href="http://jibbering.com/2002/4/httprequest.html">http://jibbering.com/2002/4/httprequest.html</a></li>
<li><a href="http://www.w3.org/TR/XMLHttpRequest/">http://www.w3.org/TR/XMLHttpRequest/</a></li>
<li><a href="http://developer.mozilla.org/en/XMLHttpRequest">http://developer.mozilla.org/en/XMLHttpRequest</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms537505(VS.85).aspx">http://msdn.microsoft.com/en-us/library/ms537505(VS.85).aspx</a></li>
</ul>
<div id="imageCache" class="section">
<h2 id="FAQ4_31">12 Why are my rollovers so slow?</h2>
<P>
Images are cached by the browser depending on the headers sent by
the server. If the server does not send sufficient information
for the browser to decide the image is cacheable, the browser
will check if the image has been updated every time you change the
src of an image (in some user settings).  To overcome this you
must send suitable headers.
</P>
<ul class="linkList"><li><a href="http://www.mnot.net/cache_docs/">http://www.mnot.net/cache_docs/</a></li></ul>
</div>
</div>
<div id="noCache" class="section">
<h3 id="FAQ4_17">11.6 How do I force a reload from the server/prevent caching?</h3>
<P>
To reload a page, use <code>location.reload()</code>. However, this depends
upon the cache headers that your server sends. To change this,
you need to alter the server configuration. A quick fix on the
client is to change the page URI so that it contains a unique
element, such as the current time. For example:
<code>location.replace(location.href+'?d='+new Date().valueOf())</code>
If the <code>location.href</code> already contains a query String, use:
<code>location.replace(location.href+'&d='+new Date().valueOf())</code>
</P>
<ul class="linkList">
<li><a href="http://www.mnot.net/cache_docs/">http://www.mnot.net/cache_docs/</a></li>
<li><a href="http://docs.sun.com/source/816-6408-10/date.htm">http://docs.sun.com/source/816-6408-10/date.htm</a></li>
</ul>
</div>
<div id="ajaxCache" class="section">
<h3 id="FAQ4_45">11.7 Why is my Ajax page not updated properly when using an HTTP GET request in Internet Explorer?</h3>
<P>
     Browsers cache the results of HTTP requests to reduce network traffic.
     To force the browser to request the document from the server, either 
     set the <code>EXPIRES</code> and/or <code>CACHE-CONTROL</code> response header(s) 
     with a past date or use a unique query string. 
</P>
     
    
```javascript
req.open("GET", "/example.jsp?date=" + (+new Date), true);
```
  

Always use the appropriate HTTP method. Do not use <code>POST</code> 
to prevent caching. See <a href="http://www.faqs.org/rfcs/rfc2616.html">RFC 2616</a>.
<ul class="linkList">
<li><a href="http://www.mnot.net/cache_docs/#EXPIRES">http://www.mnot.net/cache_docs/#EXPIRES</a></li>
<li><a href="http://www.mnot.net/javascript/xmlhttprequest/cache.html%20">http://www.mnot.net/javascript/xmlhttprequest/cache.html </a></li>
</ul>
</div>
</div>
<div id="debugging" class="section">
<h2>12 Debugging</h2>
<div id="javascriptErrors" class="section">
<h3 id="FAQ4_43">12.1 How do I get my browser to report script errors?</h3>
<P>
There are debugging tools for many browsers. Learn to use them all.
</P>
<DL>
<DT>General</DT>
<DD><a href="http://devtoolsecrets.com/">Secrets of the Browser Developer Tools</a></DD>
<DT>Windows</DT>
<DD>
<a href="http://www.fiddlertool.com/fiddler/">Fiddler</a>. 
Fiddler is an HTTP Debugging proxy (it won't find script 
errors). Fiddler logs HTTP activity, like Firebug's Net 
tab, but can be attached to any browser running on Windows. 
     </DD>
<DT>Windows IE</DT>
<DD>Microsoft Script Editor. Included with Visual Studio or Microsoft 
Word 2003 (discontinued in Office 2007).
To enable,
<code>Tools</code>, <code>Internet Options</code>, <code>Advanced</code>, and uncheck 
<code>Disable Script Debugging</code>. After enabling Script Debugging, 
a <code>Script Debugger</code> option will appear in the <code>View</code> menu.</DD>
<DD>
<a href="http://www.my-debugbar.com/wiki/IETester/HomePage">IETester</a> for testing IE 5.5- IE8.</DD>
<DD>
<a href="http://www.my-debugbar.com/wiki/CompanionJS/HomePage">CompanionJS</a> <code>console</code> for IE.</DD>
<DD>
<EM>Note:</EM> For debugging scripts in IE, the Microsoft Script <EM>Editor</EM> 
is recommended. However, if not available, the <a href="http://www.microsoft.com/downloads/details.aspx?FamilyId=2F465BE0-94FD-4569-B3C4-DFFDF19CCD99&amp;displaylang=en">Microsoft Script Debugger</a> may be somewhat helpful.
     </DD>
<DD>
<a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=e59c3964-672d-4511-bb3e-2d5e1db91038&amp;displaylang=en">Internet Explorer Developer Toolbar</a>
     </DD>
<DD>
To report errors: Wait until a little yellow
triangle appears at the left end of the status bar, double click
on it and, when the error dialog box appears, check the "Always
show errors" checkbox it contains. 

Or, <code>Internet Options</code>, <code>Advanced</code>, deselect <code>"Disable Script Debugging"</code>,
select <code>"Display a notification ..."</code>.
     </DD>
<DT>Firefox</DT>
<DD>
     <code>Tools > Error console</code> (<code>Ctrl</code> + <code>Shift</code> + <code>j</code>).
     </DD>
<DD>
<a href="http://getfirebug.com/">Firebug</a>
     </DD>
<DD>
<a href="https://addons.mozilla.org/en-US/firefox/addon/5369">YSlow</a>. 
YSlow analyzes web pages and tells you why they're slow 
based on Yahoo's rules for high performance web sites. 
     </DD>
<DD>
<a href="https://addons.mozilla.org/en-US/firefox/addon/1743">Lori</a> 
<DFN>Lori</DFN> or Life-of-request info, is useful for troubleshooting 
server response and page load time. 
     </DD>
<DD>
<a href="https://addons.mozilla.org/en-US/firefox/addon/60">Web Developer Toolbar</a>.
     </DD>
<DD>
<a href="https://addons.mozilla.org/en-US/firefox/addon/1201">Cookie Watcher</a>.
     </DD>
<DD>
<a href="https://addons.mozilla.org/en-US/firefox/addon/1192">XPather</a>. 
XPath generator, editor and inspector. 
     </DD>
<DT>Opera</DT>
<DD>
Tools &gt; Advanced &gt; Error console
     </DD>
<DD>
<a href="http://dev.opera.com/articles/view/introduction-to-opera-dragonfly/">Introduction to Opera Dragonfly</a>
     </DD>
<DT>Safari</DT>
<DD>
To display the <code>Develop</code> menu in Safari 3.1 or higher, select 
the checkbox labeled "Show Develop menu in menu bar" in 
Safari's <code>Advanced</code> Preferences panel.
     </DD>
<DD>
<a href="http://trac.webkit.org/wiki/Web%20Inspector%20">Safari Web Inspector</a>
     </DD>
<DT>Chrome</DT>
<DD>
JavaScript Console: click the <code>Page</code> menu icon and select 
<code>Developer > JavaScript Console</code>. From here, you'll be 
able to view errors in the JavaScript execution, and enter 
additional javascript commands to execute.
     </DD>
<DD>
JavaScript Debugger: available as <code>Page</code> menu icon &gt; <code>Developer</code> 
&gt; Debug JavaScript, the debugger provides a command prompt from which you 
can set breakpoints, backtrace, and more. Type <code>help</code> at the debugger 
command line to get started.    
     </DD>
<DD>
      <UL>
<LI><a href="http://www.google.com/chrome/intl/en/webmasters-faq.html#jsexec">Google Chrome Script Debugging</a></LI>
<LI><a href="http://blog.chromium.org/2009/06/developer-tools-for-google-chrome.html">Developer Tools for Google Chrome</a></LI>
<LI><a href="http://blog.chromium.org/2009/08/google-chrome-developer-tools-for.html">Tools for Eclipse Users</a></LI>
        </UL>
     </DD>
<DT>Mac IE</DT>
<DD>
Use the Preferences dialog.
     </DD>
</DL>
</div>
</div>
<div id="doNotTry" class="section">
<h2>13 Things not to attempt in a browser</h2>
<div id="detectBrowser" class="section">
<h3 id="FAQ4_26">13.1 How do I detect Opera/Safari/IE?</h3>
<P>
The short answer: <EM>Don't do that</EM>.
</P>
<P>
The <code>navigator</code> <DFN>host object</DFN> contains properties which 
may identify the browser and version. These properties are historically 
inaccurate. Some browsers allow the user to set <code>navigator.userAgent</code> to any value. For 
example, Firefox, (type <code>about:config</code> and search <code>useragent</code> 
or Safari, <code>Develop > User Agent > Other...</code>, IE, via Registry. 
</P>
<P>
Other browsers, such as Opera, provide a list of user agents 
for the user to select from. There are also at least 25 other 
javascript capable browsers, with multiple versions, each 
with their own string. 
</P>
<P>
Browser detection is unreliable, at best. It usually causes 
forward-compatibility and maintenance problems. It is unrelated to the 
problem or incompatiblity it is trying to solve and obscures the 
problems it is used for, where it is used.
</P>
<P>
Object detection is checking that the object in question exists.
<a href="http://dev.opera.com/articles/view/using-capability-detection/">Capability detection</a> goes one step further to actually test the object, 
method, or property, to see if behaves in the desired manner. 
</P>
<P>
Feature Test Example:
</P>
      
    
```javascript
/** 
 * Returns the element/object the user targeted.
 * If neither DOM nor IE event model is supported, returns undefined. 
 * @throws TypeError if the event is not an object.
 */
function getEventTarget(e) {
  e = e || window.event;
  // First check for the existence of standard "target" property.
  return e.target || e.srcElement;
}
```
  
<ul class="linkList">
<li><a href="notes/detect-browser/">notes/detect-browser/</a></li>
<li><a href="http://dev.opera.com/articles/view/using-capability-detection/">http://dev.opera.com/articles/view/using-capability-detection/</a></li>
<li><a href="http://developer.apple.com/internet/webcontent/objectdetection.html">http://developer.apple.com/internet/webcontent/objectdetection.html</a></li>
<li><a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43</a></li>
</ul>
</div>
<div id="preventAccess" class="section">
<h3 id="FAQ4_5">13.2 How can I prevent access to a web page by using javascript?</h3>
<P>
In practice you can't. While you could create a suitable
encryption system with a password in the page, the level of
support you need to do this means it's always simpler to do it
server-side. Anything that "protects" a page 
other than the current one is definitely flawed.
</P>
</div>
<div id="hideSource" class="section">
<h3 id="FAQ4_1">13.3 How do I protect my javascript code?</h3>
<P>
With clientside javascript you can't as your code is distributed 
in source form and is easily readable. With JScript, there is the 
Script Encoder (see MSDN), but this is nothing more than obfuscation.
Attempting to disable the context menu does nothing to 
protect your script in a Web browser. 
</P>
<ul class="linkList">
<li><a href="http://www.wipo.int/about-ip/en/copyright.html">http://www.wipo.int/about-ip/en/copyright.html</a></li>
<li><a href="http://webdesign.about.com/od/copyright/Copyright_Issues_on_the_Web_Intellectual_Property.htm">http://webdesign.about.com/od/copyright/Copyright_Issues_on_the_Web_Intellectual_Property.htm</a></li>
</ul>
</div>
<div id="disableRightClick" class="section">
<h3 id="FAQ4_27">13.4 How do I suppress a context menu (right-click menu)?</h3>
<P>
A context menu, often triggered by right-click, can be requested by the 
user in a few ways. For example, on windows, shift + F10 and on macs, 
click-and-hold. Other input devices exist and mouse buttons can be 
configured, making the term "right click" a misnomer, in context.
</P>
<P>
In browsers that allow it, a script can suppress the context menu by
returning false from an object's <code>oncontextmenu</code> event handler.
</P>

    
```javascript
document.oncontextmenu = function() {
  return false;
};
```
  
<P>
Some browsers lack context menus (e.g. iphone). Browsers that have
context menus do not always have a scriptable event for them. Some
browsers can be configured to disallow scripts from detecting context
menu events (IE, Opera); others may fire the event but be configured to 
disallow scripts from suppressing the context menu (Firefox,Seamonkey).
</P>
<P>
Even when the context menu has been suppressed, it will still be
possible to view/save the source code and to save images.
</P>
<ul class="linkList">
<li><a href="http://en.wikipedia.org/wiki/Context_menu">http://en.wikipedia.org/wiki/Context_menu</a></li>
<li><a href="http://kb.mozillazine.org/Ui.click_hold_context_menus">http://kb.mozillazine.org/Ui.click_hold_context_menus</a></li>
<li><a href="http://support.microsoft.com/kb/823057">http://support.microsoft.com/kb/823057</a></li>
<li><a href="http://stackoverflow.com/questions/1870880/opera-custom-context-menu-picking-up-the-right-click/1902730#1902730">http://stackoverflow.com/questions/1870880/opera-custom-context-menu-picking-up-the-right-click/1902730#1902730</a></li>
<li><a href="http://support.mozilla.com/en-US/kb/Javascript#Advanced_JavaScript_settings">http://support.mozilla.com/en-US/kb/Javascript#Advanced_JavaScript_settings</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/ms536914%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/ms536914%28VS.85%29.aspx</a></li>
</ul>
</div>
<div id="readFile" class="section">
<h3 id="FAQ4_3">13.5 How can I access the client-side filesystem?</h3>
<P>
Security means that by default you can't. In a more restricted 
environment, there are options. For example, using LiveConnect to 
connect to Java with Netscape, and using the FileSystemObject in 
IE. Check <a href="http://groups.google.com/group/comp.lang.javascript/topics">Google Groups archives</a> 
for previous posts on the subject.
</P>
<ul class="linkList">
<li><a href="http://msdn.microsoft.com/en-us/library/z9ty6h50%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/z9ty6h50%28VS.85%29.aspx</a></li>
<li><a href="http://www.javaworld.com/javaworld/jw-10-1998/jw-10-apptowin32.html">http://www.javaworld.com/javaworld/jw-10-1998/jw-10-apptowin32.html</a></li>
</ul>
</div>
<div id="javascriptURI" class="section">
<h3 id="FAQ4_24">13.6 I have &lt;a href="javascript:somefunction()"&gt;  what ... ?</h3>
<P>
Whatever the rest of your question, this is generally a very bad idea. 
The <code>javascript:</code> pseudo protocol was designed to replace the
current document with the value that is returned from the expression. 
For example:
</P>
    
    
```html
<a href="javascript:'&lt;h1>' + document.lastModified + '&lt;/h1>'">lastModified</a>
```
  
<P>
will result in replacing the current document with the value 
returned from <code>document.lastModified</code>, wrapped in an <code>&lt;h1&gt;</code> 
tag. 
</P>
<P>
When the expression used evaluates to an <code>undefined</code> value
(as some function calls do), the contents of the current page are not 
replaced. Regardless, some browsers (notably IE6) interpret this as 
navigation and will enter into a 'navigation' state where GIF 
animations and plugins (such as movies) will stop and navigational
features such as <code>META</code> refresh, assignment to <code>location.href</code>, and image 
swaps fail.
</P>
<P>
It is also possible for IE to be configured such that it supports 
javascript but not the <code>javascript:</code> protocol. This results 
in the user seeing a protocol error for <code>javascript:</code> URIs.
</P>
<P>
The <code>javascript:</code> pseudo protocol creates accessibility and 
usability problems. It provides no fallback for when the script is not 
supported.
</P>
<P>
Instead, use
<code><a href="something.html" onclick="somefunction();return false"></code>
where <code>something.html</code> is a meaningful alternative. Alternatively,
attach the <code>click</code> callback using an event registry.
</P>
<ul class="linkList">
<li><a href="example/jsuri/">example/jsuri/</a></li>
<li><a href="http://groups.google.com/group/comp.lang.javascript/msg/f665cfca3b619692">Set/Navigate to a Location</a></li>
<li><a href="http://www.useit.com/alertbox/20021223.html">Top Ten Web-Design Mistakes of 2002</a></li>
</ul>
</div>
</div>
<div id="comments" class="section">
<h2 id="FAQ14">14 Comments and Suggestions</h2>
<P>
      This FAQ uses the CSS stylesheet <a href="faq.css">faq.css</a> and is generated
      from the XML source <a href="index.xml">index.xml</a> using the XSLT stylesheet
      <a href="index.xsl">index.xsl</a>.
</P>
<div id="FAQENTRY" class="section">
<h3 id="FAQ5_1">14.1 Why do some posts have &lt;FAQENTRY&gt; in them?</h3>
<P>
        If a poster feels that the question they are answering should be
        covered in the FAQ, placing &lt;FAQENTRY&gt; in the post lets the FAQ
        robot collect the messages for easy review and inclusion. A Draft Proposal
        for the FAQ is requested and appreciated.
</P>
<P>
The &lt;FAQENTRY&gt; should not be used in posts except in
conjunction with a suggestion/proposal for this FAQ. It should
also not be literally quoted in replies, instead it should be
partly obscured as, e.g. &lt;FAQ**TRY&gt; or similar.
</P>
</div>
<div id="makeSuggestion" class="section">
<h3 id="FAQ5_2">14.2 How do I make a suggestion?</h3>
<P>
To make a suggestion to this FAQ, use either the FAQENTRY method
above, or send e-mail to Thomas 'PointedEars' Lahn
&lt;cljs@PointedEars.de&gt;
(editor).
Alternatively, you can <a href="https://help.github.com/articles/creating-a-pull-request/">create a pull
request</a> for the <a href="https://github.com/PointedEars/faq-cljs/tree/dev">dev branch</a> of the
Github repository.
All comments, suggestions, and especially corrections are welcome, and will be credited, where it is due, below.
</P>
</div>
<div id="contributors" class="section">
<h3>14.3 Contributors</h3>
<p>(non-exhaustive, in alphabetical order; see <a href="https://github.com/PointedEars/faq-cljs/commits/master">changelog</a> for details)</p>
      <ul>
<li>Andrew Poulos &lt;<a href="mailto:ap_prog@hotmail.com">ap_prog@hotmail.com</a>&gt;</li>
<li>
<a href="http://3-magi.net/">Christoph Michael Becker</a> &lt;<a href="mailto:cmbecker69@arcor.de">cmbecker69@arcor.de</a>&gt;</li>
<li>
<a href="http://weppipakki.com/">Osmo Saarikumpu</a> &lt;<a href="mailto:osmo@weppipakki.com">osmo@weppipakki.com</a>&gt;</li>
<li>
<a href="http://personx.tumblr.com/">Garrett Smith</a> &lt;<a href="mailto:dhtmlkitchen@gmail.com">dhtmlkitchen@gmail.com</a>&gt;</li>
      </ul>
</div>
</div>
</body>
</html>
