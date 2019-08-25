<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" 
"http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
<title>Square Bracket Notation</title>
<meta http-equiv="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<link href="../../faq.css" rel="stylesheet" type="text/css">
<link href="../notes.css" rel="stylesheet" type="text/css">
<meta name="ROBOTS" content="NOINDEX NOFOLLOW">
</head>
<body>
<h1>Javascript Square Bracket Notation</h1>
<div id="faqNav">
  <a href="../../">FAQ</a> &gt; <a href="../">FAQ Notes</a>

</div>
<ul>
	<li><a href="#intro">Introduction</a></li>
	<li><a href="#sBs">Square Bracket Syntax</a></li>
	<li><a href="#vId">String Variables as Identifiers</a></li>
	<li><a href="#eId">String Expressions as Identifiers</a></li>
	<li><a href="#aVa">Global Variable access with the Square Bracket Notation</a></li>
	<li><a href="#illc">Illegal characters in Identifier-strings</a></li>
</ul>
<h2 id="intro">Introduction</h2>

<p id="intro_1">To be useful javascript needs to be able to access the properties of
objects. It is impossible to learn javascript without understanding the
dot notation that is normally used to access the properties of objects.
</p>

<p id="intro_2">Javascript also offers an alternative property accessor notation
using square brackets in a way that is similar to the way in which the
indexed members of an Array are accessed, except that a string is used
between the square brackets. This alternative notation is extremely
powerful and useful but gets very little coverage in most books on
javascript and that seems to leave novice javascript programmers
unaware that they even have this option.</p>

<p id="intro_3">The coverage in javascript books can be very poor. Looking back at
some of the books that I first used to learn javascript, one devotes
exactly one paragraph to property accessors and another actually states
that the square bracket notation can only be used with integer indexes
to access Arrays and array-like structures.</p>

<p id="intro_4">With an understanding of dot notation and few clues that an
alternative exists, novice (and a few surprisingly experienced)
javascript programmers often turn to the <code>eval</code> function,
constructing a string that represents a dot notation accessor
(frequently retrieving the property names from javascript variables)
and then passing it to the <code>eval</code> function in order to
access the object property that it refers to. The <code>eval</code>
function is just not needed to perform this type of property access
and it is a relatively inefficient way of doing so (plus, some embedded
browsers lack the resources to implement an <code>eval</code> function).
</p>

<h2 id="sBs">Square Bracket Syntax</h2>
<p id="sBs_1">If you can access the property of an object using dot
notation, such as:-</p>

<pre id="sBs_ex1">document.body</pre>

<p id="sBs_2">- you can also use the square bracket notation:-</p>

<pre id="sBs_ex2">document['body']</pre>

<p id="sBs_3">- in which the dot and the identifier to the right of the dot are
replaced with a set of square brackets containing a string that
represents the identifier that was to the right of the dot.</p>

<p id="sBs_4">The Property Accessors section of javascript language specification
(ECMA 262)  makes it clear that the dot notation and the square bracket
notation are parallel ways of accessing the properties of objects.</p>

<blockquote cite="http://www.ecma-international.org/publications/files/ecma-st/Ecma-262.pdf">
<dl>
	<dt>ECMA 262 3rd Edition. Section 11.2.1 Property Accessors</dt>
	<dd>
		Properties are accessed by name, using either the dot notation:
<pre >
MemberExpression.Identifier
CallExpression.Identifier
</pre>
		or the bracket notation:
<pre>
MemberExpression[ Expression ]
CallExpression[ Expression ]
</pre>
		The dot notation is explained by the following syntactic conversion:
		<pre>MemberExpression.Identifier</pre>
		is identical in its behaviour to
		<pre>MemberExpression[ &lt;identifier-string&gt; ]</pre>
		and similarly
		<pre>CallExpression.Identifier</pre>
		is identical in its behaviour to
		<pre >CallExpression[ &lt;identifier-string&gt; ]</pre>
		where <code>&lt;identifier-string&gt;</code> is a string literal
		containing the same sequence of characters as the Identifier.
	<dd>
</dl>
</blockquote>

<p id="sBs_5">In the following simple <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> page:-</p>

<pre id="sBs_ex3">
&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;form name=&quot;formName&quot; action=&quot;#&quot;&gt;
      &lt;input type=&quot;text&quot; name=&quot;inpName&quot; value=&quot;Example value text&quot;&gt;
    &lt;/form&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

<p id="sBs_6">- which contains a form named <code>&quot;formName&quot;</code> with
one input element named <code>&quot;inpName&quot;</code>. Various forms
of dot notation property accessor can be used to reference the
<code>&quot;value&quot;</code> property of the input element. One of
the simplest is:-</p>

<pre id="sBs_ex4">
var stringOfValue = document.formName.inpName.value;
</pre>

<p id="sBs_7">This dot notation has three dots, so there are three points at which
the square bracket notation could be used in place of the dot notation
(these are all equivalent).</p>

<pre id="sBs_ex5">
var stringOfValue = document[&quot;formName&quot;].inpName.value;

var stringOfValue = document.formName[&quot;inpName&quot;].value;

var stringOfValue = document.formName.inpName[&quot;value&quot;];
</pre>

<p id="sBs_8">The following combinations are also all equivalent to the original
dot notation:-</p>

<pre id="sBs_ex6">
var stringOfValue = document[&quot;formName&quot;].inpName[&quot;value&quot;];

var stringOfValue = document[&quot;formName&quot;][&quot;inpName&quot;].value;

var stringOfValue = document[&quot;formName&quot;][&quot;inpName&quot;][&quot;value&quot;];

var stringOfValue = window[&quot;document&quot;][&quot;formName&quot;][&quot;inpName&quot;][&quot;value&quot;];
</pre>

<p id="sBs_9">Where the dot notation follows the dot with the identifier for the
property that is to be accessed, the square bracket notation replaces
the dot and identifier with square brackets that contain a string that
represents the identifier for the property (the property name).</p>

<h2 id="vId">String Variables as Identifiers</h2>

<p id="vId_1">The string used within the square brackets does not need to be a
string literal. It can be any expression that results in a string.
This is where the square bracket notation becomes most useful as the
expression could be a reference to a string variable that holds the
property name as its value, or a function call that returns a string,
or an expression that concatenates two strings, or any combination of
these.</p>

<p id="vId_2">This means that the identifier needed to access a property does not
need to be coded into a javascript. Consider the following simple
function:-</p>

<pre id="vId_ex1">
function setPropertyToValue(oObj, sPropName, value){
	oObj[sPropName] = value;
}
</pre>

<p id="vId_3">- provided with a reference to an object (<code>oObj</code>), the
name of a property (<code>sPropName</code>) and a value for that
property (<code>value</code>), it will set the value of the property
without needing to know what the name of the property that it is
setting is. Called as
<code>setPropertyToValue(document.formName.inpName, &quot;value&quot;, &quot;new value&quot;)</code>
it will set the value of the field in the example form above to the
string <code>&quot;new value&quot;</code>. However, called as 
<code>setPropertyToValue(window, &quot;location&quot;, &quot;http://www.google.com&quot;)</code>
and the same function will navigate a web browser to the URL provided
as the final parameter. Although this is a forced example you should be
able to see that the square bracket notation offers considerable power
and flexibility.</p>

<p id="vId_4">Any variable that holds a string value can be used between the
square brackets to form a property accessor. Variables that hold
non-strings will have their value internally type converted into a 
string and that string will be used as the property name. This is not very
useful, especially if the variables contain references to objects or
functions, as the returned string is likely to be implementation
dependent.</p>

<h2 id="eId">String Expressions as Identifiers</h2>

<p id="eId_1">The ability to build the string used as the property name can be
very useful in loops and with dynamically generating web pages (server
side) that have variable length content. The strings can be the result
of expressions that concatenate string literals with variables
(particularly loop counters).</p>

<p id="eId_2">Given the form:-</p>

<pre id="eId_ex1">
&lt;form name=&quot;formName&quot; action=&quot;#&quot;&gt;
	&lt;input type=&quot;text&quot; name=&quot;field_1&quot;&gt;
	&lt;input type=&quot;text&quot; name=&quot;field_2&quot;&gt;
	&lt;input type=&quot;text&quot; name=&quot;field_3&quot;&gt;
&lt;/form&gt;
</pre>

<p id="eId_3">- the following loop will clear the value property of each element
it turn:-</p>

<pre id="eId_ex2">
for(var c = 1;c &lt; 4;c++){
	document.forms[&quot;formName&quot;].elements[&quot;field_&quot;+c].value = &quot;&quot;;
}
</pre>

<p id="eId_4">If a server side process had created the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> form with
<code>n</code> elements, named <code>field_1, field_2 ... field_n</code>
, then all the server side process would have to do to have the loop
clear each and every input element would be to change the <code>4</code>
in the example to the value of <code>n+1</code>.</p>

<p id="eId_5">Concatenation is the most common type of expression used with the
square bracket notation but any javascript expression could be used.
A function that returned a string could be used.</p>

<p id="eId_6">In the following (rather contrived) example :-</p>

<pre id="eId_ex3">
function getRootElName(){
	if(document.compatMode &amp;&amp; (document.compatMode == &quot;CSS1Compat&quot;)){
		return &quot;documentElement&quot;;
	}else{
		return &quot;body&quot;;
	}
}

var verticalScroll = document[getRootElName()].scrollTop;
</pre>
<p id="eId_7">- the <code>scrollTop</code> value is read from either the
<code>document.body</code> or <code>document.documentElement</code>
depending on the value of <code>document.compatMode</code>. Passing
strings about is far from the best way of achieving what the code
above does but there will be circumstances when returning a string
from a function call for use in a property accessor is potentially
useful.</p>

<h2 id="aVa">Global Variable access with the Square Bracket Notation</h2>

<p id="aVa_1">The square bracket notation requires that there be some sort of
object reference to the left of the brackets.</p>

<pre id="aVa_ex1">[&quot;document&quot;] <span class="commentJS">//Array literal, not a Property Accessor!</span></pre>

<p id="aVa_2">-will produce an error if an attempt is made to assign a value to it,
as it will be treated as an Array literal, if an attempt to read from
it is made the one element array containing the string within the
brackets is returned. Global variables are normally referenced by their
one identifier alone. This would seem to exclude global variables from
the possibility of being referenced using a string that held their
identifier name or an expression that built, or returned, their name.
However, javascript global variables (and global function names for
that matter) are properties of a global object. Any identifier that
holds a reference to the global object can be used to the left of the
square brackets to form a property accessor that refers to a global
variable.</p>

<p id="aVa_3">In a web browser the global object is the window (or frame) in which
the script is running. Each window (or frame) object contains a number
of properties, at least two of which are references to the window
(global object) itself. These properties are 'window' and 'self'.
These property names can be used as the identifier to the left of the
square brackets when referring to global variables. So given a global
variable defined as:-</p>

<pre id="aVa_ex2">
var anyName = 0;
</pre>

<p id="aVa_4">- that global variable can be referenced as:-</p>

<pre id="aVa_ex3">
window[&quot;anyName&quot;]
</pre>

<p id="aVa_5">As with any other use of the square bracket notation, the string
within the brackets can be held in a variable or constructed/returned
by an expression.</p>

<p id="aVa_6">Code that is executing in the global context, the code within global
functions (except Object constructors invoked with the <code>new</code>
keyword) and inline code outside of any functions, could also use the
<code>this</code> keyword to refer to the global object. The
<code>this</code> keyword refers to an object depending on the
execution context. For code executing in the global context 
<code>this</code> is the global object (on a web browser, the window
object). As a result, the above variable could be referred to as
<code>this[&quot;anyName&quot;]</code>, but only in code that is
executing in the global context.</p>

<p id="aVa_7">However, using the <code>this</code> keyword is very likely to be
confusing, especially in scripts that include custom javascript objects
where the methods (and constructors) of those objects would be using 
<code>this</code> to refer to their own object instances.</p>

<p id="aVa_8">Some javascript implementations do not have a property of the global
object that refers to the global object. Rather than trying to use the
<code>this</code> keyword to access global variables it is possible to
create your own global variable that refers to the global object.</p>

<pre id="aVa_ex4">
var myGlobal = this;
</pre>

<p id="aVa_9">- executed as inline code at the start of a script will assign a
reference to the global object (<code>this</code> in that context).
From then on all global variables can be referenced with square bracket
notation as:-</p>

<pre id="aVa_ex5">
myGlobal[&quot;anyName&quot;];
</pre>

<p id="aVa_10">- and expect <code>myGlobal</code> to refer to the global object
from any execution context.</p>

<h2 id="illc">Illegal characters in Identifier-strings</h2>

<p id="illc_1">One advantage of the square bracket notation over dot notation is
the ability to use characters in identifier-strings that are not legal
identifier characters. It is generally best to avoid giving javascript
properties names and <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> elements names/IDs that are not made up
entirely of characters that are legal in the relevant context. However,
it is not always possible to avoid referencing elements with names that
include characters that would be illegal in a javascript identifier.
PHP offers an example of this, multiple form elements given the same
name followed with empty square brackets, such as
<code>name=&quot;inpEl[]&quot;</code>, are made available on the server
as an array.</p>

<p id="illc_2">The square bracket notation would allow an element with such a name
to be referenced as <code> document&#46;forms[&quot;formName&quot;]&#46;elements[&quot;inpEl[]&quot;][0]</code>
for example (the final <code>[0]</code> reflects the fact that
multiple elements with the same name, when accessed by name, generate
collections of elements and individual elements within that collection
need to be referenced by index).</p>

<ul style="list-style-type:none;margin-top:2.5em;">
	<li>Written by <span class="person">Richard Cornford</span>. March 2003.</li>
	<li>With technical corrections and suggestions by:-<br>
		<ul style="list-style-type:none;">
			<li><span class="person">Yann-Erwan Perio (Yep)</span>. (Also, thanks for testing the use
			    of <code>this</code> to reference the global object in WSH
			    and ASP2.)
			</li>
			<li><span class="person">Lasse Reichstein Nielsen</span>.</li>
			<li><span class="person">Dr John Stockton</span>.</li>
		</ul>
	</li>
</ul>
</body>
</html>
