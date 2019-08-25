<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
            "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head><title>Referencing Forms and Form Controls</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../faq.css" rel="stylesheet" type="text/css">
<link href="../notes.css" rel="stylesheet" type="text/css">
<style type="text/css">
.commentJS {
	background-color: #FFFFCC;
	color: #004800;
}
P CODE {
	background-color: #FFFFDD;
	color: #000000;
	padding: 0ex;
	margin: 0ex;
}
</style>
</head>
<body>

<h1 id="faHead">Referencing Forms and Form Controls</h1>
<div id="faqNav">
  <a href="../../">FAQ</a> &gt; <a href="../">FAQ Notes</a>
</div>

<ul>
	<li><a href="#faInt">Introduction</a>
		<ul>
			<li><a href="#faInF">Forms</a></li>
			<li><a href="#faInC">Form Controls</a></li>
		</ul>
	</li>
	<li><a href="#faShrt">Shortcut Accessors</a></li>
	<li><a href="#faComMis">The Most Common Mistake</a></li>
	<li><a href="#faAnon">Anonymous Form References</a></li>
	<li><a href="#faBut">Radio Button and Other Control Collections</a></li>
	<li><a href="#faEff">Efficient use of Form Accessors</a></li>
</ul>

<h2 id="faInt">Introduction</h2>
<h3 id="faInF">Forms</h3>
<p id="faInF_1">
When the W3C defined the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOM specification much of what they included
represented a formalisation of existing browser behaviour. In particular they
defined &quot;convenience&quot; properties on the <code>HTMLDocument</code>
interface that reproduce document level collections common in preceding
browsers. Of specific interest here is the <code>document.forms</code>
collection, which makes all of the <code>FORM</code> elements on a page
available as (zero based) indexed members of the collection. Allowing,
for example, the second <code>FORM</code> element on a page to be
referenced as:-
</p>

<pre id="faInF_ex1">
var formElement = document.forms[1];
</pre>

<p id="faInF_2">
<span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> (but not necessarily XHTML) <code>FORM</code> elements are allowed
<code>NAME</code> attributes and the <code>document.forms</code> collection
also makes <code>FORM</code> elements with <code>NAME</code> attributes
available as named members, under a property name that corresponds with
value of the <code>NAME</code> attribute. So given a form with the
attribute <code>name=&quot;myForm&quot;</code> the form can be referenced
as:-
</p>

<pre id="faInF_ex2">
var formElement = document.forms.myForm;

<span class="commentJS">/* - or - */</span>

var formElement = document.forms[&quot;myForm&quot;];

<span class="commentJS">/* The latter, bracket notation, does not impose the same restrictions
   on the character sequence used for the name as is imposed by the
   preceding dot notation, which is restricted to only using character
   sequences that would fulfill the ECMAScript definition of an
   identifier.

   Bracket notation is often preferred when accessing form elements as
   it helps to document itself by making it clear in the source code
   which property names originate in the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> rather than the DOM.
*/</span>
</pre>

<p id="faInF_3">
The <code>document.forms</code> collection had exhibited this behaviour
in all of the preceding browsers that implemented it (which included
all the browsers that understood what a form was) and as a result
represents the most cross-browser method of accessing <code>FORM</code>
elements. It is both W3C <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOM standard compliant and
back-compatible with pre-existing browsers.
</p>

<p id="faInF_4">
The W3C went on to require <code>FORM</code> elements with
<code>ID</code> attributes to also be made available as named properties
of the <code>document.forms</code> collection. That represented a
formalisation of behaviour already exhibited in IE 4 but not by
Netscape 4 (and earlier). Referencing <code>ID</code>ed <code>FORM</code>
elements as named properties of the <code>document.forms</code> collection
should work reliably in all W3C <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOM compliant browsers but some
back-compatibility will be sacrificed if <code>ID</code>s are used instead
of <code>NAME</code>s (though not nearly as much as would be lost if
<code>ID</code>ed form elements were referenced using the
<code>document.getElementById</code> method). 
</p>

<p id="faInF_5">
When writing <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> that conforms to a DTD that allows <code>FORM</code>
elements to have <code>NAME</code> attributes it is possible to also give
the <code>FORM</code> element an <code>ID</code> attribute that corresponds
with its <code>NAME</code> attribute (so long as the <code>ID</code> is
unique on the page).  The form will appear as a member of the
<code>document.forms</code> collection under a property name that
corresponds with the value of the <code>NAME</code> and <code>ID</code>
attributes (as they are identical).
</p>

<h3 id="faInC">Form Controls</h3>

<p id="faInC_1">
Traditionally browsers that implemented the <code>document.forms</code>
collection also made the controls within a form available as a
collection accessible as a property of the <code>FORM</code> element
under the name <code>elements</code>. The W3C <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOM also formalised
this collection in the <code>HTMLFormElement</code> interface.
Controls within a form can be referenced as integer indexed members of
that collection:-
</p>

<pre id="faInC_ex1">
var formElement = document.forms[&quot;myForm&quot;];
var controlElement = formElement.elements[2]; <span class="commentJS">//Third control in the form.</span>
</pre>

<p id="faInC_2">
Controlls with <code>NAME</code> attributes are again made available as
named properties of the collection. So a control with
<code>name=&quot;myControl&quot;</code> can be referenced as:-
</p>

<pre id="faInC_ex2">
var controlElement = formElement.elements[&quot;myControl&quot;];
</pre>

<p id="faInC_3">
Again the W3C also specified that controls with <code>ID</code>
attributes should be made available as named members of the
elements collection under their <code>ID</code>s (with the same
implications for back-compatibility with really ancient browsers).
All official (x)<span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DTDs allow form controls to have
<code>NAME</code> attributes because without a <code>NAME</code>
attribute the value of the control cannot be sent as a
name/value pair when the form is submitted.
</p>

<h2 id="faShrt">Shortcut Accessors</h2>

<p id="faShrt_1">
In addition to making named <code>FORM</code> elements available
as named properties of the <code>document.forms</code> collection
web browsers also make them available as named properties of the
<code>document</code> object. So:-
</p>

<pre id="faShrt_ex1">
var formElement =  document.myForm;
</pre>

<p id="faShrt_2">
-will reference the same FORM element as:-
</p>

<pre id="faShrt_ex2">
var formElement = document.forms.myForm;
</pre>

<p id="faShrt_3">
And the same is true using bracket notation:-
</p>

<pre id="faShrt_ex3">
var formElement =  document[&quot;myForm&quot;];

<span class="commentJS">/* instead of:- */ </span>

var formElement = document.forms[&quot;myForm&quot;];
</pre>

<p id="faShrt_4">
The W3C did not include this shortcut in the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOM specifications
so code that uses it cannot be described as standards compliant and,
while nobody has been able to name an <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> browser where the shortcut
accessors do not work when referencing named <code>FORM</code>
elements, it would still be possible for a future standards compliant
browser not to support the shortcut accessors.
</p>

<p id="faShrt_5">
<code>FORM</code> elements that only have <code>ID</code> attributes
cannot be accessed as properties of the <code>document</code> object
under a property name that corresponds with their <code>ID</code>
attributes. While by W3C <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOM specification (but not necessarily
on older browsers) <code>ID</code>ed forms are made available as named
properties of the <code>document.forms</code> collections under a
property name that corresponds with the <code>ID</code>.
</p>

<p id="faShrt_6">
Form controls can be referenced as named properties of the
<code>FORM</code> element that contains them with a shortcut accessor:-
</p>

<pre id="faShrt_ex4">
var formControl = formElement.myControl;

<span class="commentJS">/* instead of :- */</span>

var formControl = fromElement.elements.myControl;
</pre>

<p id="faShrt_7">
But in the case of form controls, elements with <code>ID</code>
attributes may be available as properties of the <code>FORM</code>
element under a property name that corresponds with their
<code>ID</code> (at least on more recent browsers).
</p>

<p id="faShrt_8">
The main argument in favour of using shortcut accessors (apart from the
reduced amount of typing) is that they are resolved fractionally quicker
than accessors that employ the <code>forms</code> and
<code>elements</code> collections. That follows from the fact that fewer
object references need to be resolved before the reference to the element
of interest is returned.
</p>

<p id="faShrt_9">
While arguments against the shortcut accessors point out that named image,
embed and other elements are also made available as named properties of
the <code>document</code> object, making it ambiguous when reading the
source code whether the shortcut accessor is referring to a form or some
other named property of the <code>document</code> object. When a
<code>FORM</code> element is referenced as a member of the
<code>document.forms</code> collection, or a control as a member of the
<code>elements</code> collection, there can be no doubt while reading
the source code as to the type of element that is the subject of the
reference.
</p>

<h2 id="faComMis">The Most Common Mistake</h2>

<p id="faComMis_1">
The most common mistake made when defining the form <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> that a script
will interact with follows from the existence of the shortcut accessors
for form controls. It is to give the control a <code>NAME</code> (or
possibly <code>ID</code>) that corresponds with an existing property of
<code>FORM</code> elements. And the most common example of that is an
<code>INPUT</code> element of <code>type=&quot;submit&quot;</code> with
the <code>NAME</code> &quot;submit&quot;. Because the named controls are
made available as named properties of the <code>FORM</code> element this
<code>INPUT</code> element is made available under the property name
<code>&quot;submit&quot;</code>. Unfortunately <code>FORM</code> elements
already have a property with the name <code>&quot;submit&quot;</code>, it
is the <code>submit</code> method that can be used to submit the form
with a script. The misguided choice of name for the <code>INPUT</code>
element effectively renders the form's <code>submit</code> method
unscriptable. And the same is true for all controls with names that
correspond any with existing <code>FORM</code> element properties.
</p>

<p id="faComMis_2">
Because ECMAScript is case sensitive it may only be necessary to
capitalise the name of the <code>INPUT</code> element to avoid the
conflict. However, it would probably be safest to adopt a naming
convention for form controls that ensured that they do not
correspond with existing properties of the <code>FORM</code> elements
regardless of case.  Especially as theW3C <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> specification implies
that referring to named properties of collections can be case
insensitive in <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span> DOMs. In reality I don't know of any
implementations in which it is but it would be better to err on the side
of caution.
</p>

<p id="faComMis_3">
Another naming conflict that should be avoided would arise if named form
controls had names that correspond with the string representations of
integers, such as <code>name=&quot;1&quot;</code> as they will almost
certainly result in inconsistent results (across browsers) when being
referenced because the controls are already available by integer index
and it would become unclear which control was being referenced by
accessors such as <code>formElement.elements[1]</code> or
<code>formElement.elements[&quot;1&quot;]</code> (by the ECMAScript
specification the preceding two property accessors are equivalent).
Unless the control with the name <code>&quot;1&quot;</code> also 
happened to be the control with the index 1. This problem would also
apply to <code>FORM</code> elements within the <code>document.forms</code>
collection.
</p>

<p id="faComMis_4">
Generally it is best to only give form controls names that cannot
conflict with existing properties of <code>FORM</code> elements
and <code>FORM</code> elements names that cannot conflict with
existing properties of the <code>document.forms</code> collection
or the <code>document</code> object.
</p>

<h2 id="faAnon">Anonymous Form References</h2>

<p id="faAnon_1">
Because <code>FORM</code> elements are available as integer indexed
member of the <code>document.forms</code> collection it is not
necessary to know the name of a form (or for the form to have a
name) to acquire a reference to it. While being able to refer to a
form anonymously with its index might seem like a good approach
towards making more general/flexible functions for form validation
and the like, in practice referring to forms by their index actually
makes code less flexible and harder to maintain. As soon as the
number or layout of forms on a page is changed their indexes also
change, requiring that all of the references by index be located
and altered.
</p>

<p id="faAnon_2">
One method of avoiding having to know the name of a <code>FORM</code>
element within a function that is to act upon a form is to pass a
reference to the form object as an argument in the function call.
This is easiest achieved from the code provided as the value for
an event handling attribute because that code is used by the browser
to create an event handling function that is assigned as a method of
the element to which it is attached. And in any function executed as
a method of an object the <code>this</code> keyword is a reference to
the object with which the execution of the method is associated. The
most common need to anonymously pass a reference to a <code>FORM</code>
element is as an argument to a form validation function in the
onsubmit handler of the form. In that case the event handling function
is a method of the <code>FORM</code> element so the <code>this</code>
keyword refers to the form directly:-
</p>

<pre id="faAnon_ex1">
function validateForm(formRef){
    <span class="commentJS">/* Use the reference to the form passed as the formal
       parameter - formRef - to acquire a reference to the form
       control with the name &quot;textField&quot;:
    */</span>
    var el = formRef &amp;&amp; formRef.elements[&quot;textField&quot;];
    <span class="commentJS">/* If the control reference exists return its value property
       converted to a boolean value (false if empty, true otherwise)
       else return true so the form is submitted and the server can
       do the validation:
    */</span>
    return !el || Boolean(el.value);
}
...
&lt;form action=&quot;http://example.com/somePage.asp&quot;
 onsubmit=&quot;return validateForm(this);&quot;&gt;
    &lt;input type=&quot;text&quot; name=&quot;textField&quot; value=&quot;&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;Submit_Button&quot; value=&quot;Submit&quot;&gt;
&lt;/form&gt;
</pre>

<p id="faAnon_3">
Because the above function receives the reference to the form that it
is to validate as an argument when it is called it can also be used
with any number of other forms.  Although in the case of the above
function each of those forms would need to contain a field called
<code>&quot;textField&quot;</code>, but that string name could also be
passed as an argument, making the function more general.
</p>

<p id="faAnon_4">
Form control objects all have a property named
<code>&quot;form&quot;</code> that holds a reference to the
<code>FORM</code> element that contains them. As a result the event
handling functions attached to form controls can pass an anonymous
reference to the form that contains them as <code>this.form</code>.
Obviously a function called from an event handler on a control can
be passes an anonymous reference to the control itself as
<code>this</code>.
</p>

<h2 id="faBut">Radio Button and Other Control Collections</h2>

<p id="faBut_1">
Radio button controls work to provide a selection of one item of many
when each of the radio button alternatives has the same
<code>NAME</code> attribute. But it is also possible to give other types
of control the same <code>NAME</code> attribute.
</p>

<p id="faBut_2">
When controls that share the same <code>NAME</code> attribute they can
still be accessed as integer indexed members of the <code>FORM</code>
element's <code>elements</code> collection but when the member of the
<code>elements</code> collection is accessed using the <code>NAME</code>
attribute value as a property name browsers return a collection all of
the elements with the corresponding NAME attributes. So given the <span class="initialism" title="HyperText Mark-up Language"><abbr title="HyperText Mark-up Language">HTML</abbr></span>:-
</p>

<pre id="faBut_ex1">
&lt;form name=&quot;testForm&quot; action=&quot;http://example.com/somePage.jsp&quot;&gt;
  &lt;ul style=&quot;list-style-type:none;&quot;&gt;
    &lt;li&gt;&lt;input type=&quot;radio&quot; name=&quot;radioSet&quot; value=&quot;R1&quot;&gt;option 1&lt;/li&gt;
    &lt;li&gt;&lt;input type=&quot;radio&quot; name=&quot;radioSet&quot; value=&quot;R2&quot;&gt;option 2&lt;/li&gt;
    &lt;li&gt;&lt;input type=&quot;radio&quot; name=&quot;radioSet&quot; value=&quot;R3&quot;&gt;option 3&lt;/li&gt;
    &lt;li&gt;&lt;input type=&quot;radio&quot; name=&quot;radioSet&quot; value=&quot;R4&quot;&gt;option 4&lt;/li&gt;
  &lt;/ul&gt;
  &lt;input type=&quot;submit&quot name=&quot;Submit_Button&quot; value=&quot;Send&quot;&gt;
&lt;/form&gt;
</pre>

<p id="faBut_3">
A property accessor referring to the member of the <code>FORM</code>'s
<code>elements</code> collection by the property name 
<code>&quot;radioSet&quot;</code> will not return a reference to any one
of the named radio buttons but instead returns a collection of all of the
like-named radio controls.
</p>

<p id="faBut_4">
The individual radio buttons within that collection are referred to as
integer indexed members of that collection. So to find the button that
is checked one might loop through all of the members of the collection
of like-named radio buttons and copy a reference to the button with its
<code>checked</code> property set to boolean <code>true</code>.
</p>


<pre id="faBut_ex2">
var radioCollection, checkedButton;
var frm = document.forms[&quot;testForm&quot;];
if(frm){
    radioCollection = frm.elements[&quot;radioSet&quot;];
    if(radioCollection){
        <span class="commentJS">/* The collection of like-named radio buttons has a length
           property and that is used to limit a for loop:-
        */</span>
        for(var c = 0;c &lt; radioCollection.length;c++){
            <span class="commentJS">/* The individual radio buttons are accessed as indexed
               members of the collection using the loop counter - c
               - from the for loop:
            */</span>
            if(radioCollection[c].checked){
                <span class="commentJS">/* When a radio button element is found with its
                   checked property set to boolean true a reference
                   to that element is assigned to the local variable
                   - checkedButton - and the loop is terminated with
                   the - break - statement as only one button in a set
                   of like-named radio buttons will be checked at a
                   time, so any remaining buttons in the collection
                   must have checked properties set to false:
                */</span>
                checkedButton = radioCollection[c];
                break;
            }
        }
        if(checkedButton){
            <span class="commentJS">/* Do something with the reference to the checked radio
               button (if any).
            */</span>
            ...
        }
    }
}
</pre>

<p id="faBut_5">
It is not unusual when a form is generated by a server-side script that
some forms may have one or more like-named controls. If there is only
one control inserted in the form then accessing a member of the
<code>elements</code> collection with its name will return a reference
to that one control, but if there are multiple elements the returned
reference will be to a collection of such controls. While it may be 
possible to branch client-side code that wants to interact with those
controls to handle the two alternatives it adds an unnecessary
maintenance burden to do so.
</p>

<p id="faBut_6">
As handling a returned collection usually involves looping through that
collection the simplest way of implementing the client-side code to
deal with both collections and individual controls being returned by
named properties of the <code>elements</code> collection is to
normalise the references to individual controls so that they can be
handled as if they were a collection.  Looping through a collection
involves using the <code>length</code> property of the collection to
limit the loop statement and accessing the controls within the
collection by integer index. This is exactly the way in which code
would loop through the elements of an <code>Array</code>. To allow a
script to handle both possibilities with the same code the return of
a reference to an individual control could be detected and then that
reference used to create a one-element <code>Array</code>. Subsequent
code would then treat the <code>Array</code> as if it was a collection and
loop through it, but as there is only one element the loop body would
only be executed once.
</p>

<pre id="faBut_ex3">
var radioCollection, checkedButton;
var frm = document.forms[&quot;testForm&quot;];
if(frm){
    radioCollection = frm.elements[&quot;radioSet&quot;];
    if(radioCollection){
        <span class="commentJS">/* But the returned reference might not be a collection in this
           case. Instead it may be a reference to just one control if
           there is only one in this form with the name &quot;radioSet&quot;.
           If it is a reference to an individual control it is going to
           be necessary to normalise it. Because radio button controls
           do not have - length - properties and collections do that is
           the property that is going to be tested:
        */</span>
        if(typeof radioCollection.length != &quot;number&quot;){
            <span class="commentJS">/* The length property is not a number so this cannot be a
               collection and must be normalised so that the following
               loop statement can handle it correctly. Normalisation is
               done by making  a reference to the control currently
               referred to by the - radioCollection - local variable
               into the first (and only) element of a new Array object
               and then assigning a reference to that array to the - 
               radioCollection - local variable:
            */</span>
            radioCollection = [radioCollection];
        }
        <span class="commentJS">/* The execution of the body of the - for - loop is limited by
           the - length - property of the collection/Array.
        */</span>
        for(var c = 0;c &lt; radioCollection.length;c++){
            <span class="commentJS">/* The individual radio buttons are accessed as indexed
               members of the collection/Array using the loop counter
               - c - from the for loop:
            */</span>
            if(radioCollection[c].cheked){
                checkedButton = radioCollection[c];
                break;
            }
        }
        if(checkedButton){
            <span class="commentJS">/* do something with the reference to the checked radio
               button (if any).
            */</span>
            ...
        }
    }
}
</pre>

<p id="faBut_7">
While it is normal for radio button controls to be like-named it is
also possible for all other controls to be included in a form with
multiple controls of the same type and like names. The same
referencing techniques can be used with any type of control (even
mixed types with like-names, though that is almost never done). But
deciding whether a reference needs to be normalised by making it into
the only element of an <code>Array</code> by testing the 
<code>length</code> property of that reference to see if it doesn't
exist will not work with <code>SELECT</code> elements as they have
a <code>length</code> property of their own. It also would not help
to be testing some other characteristic of a collection, such as their
<code>item</code> method, as <code>SELECT</code> elements usually have
all of the methods and properties of a collection as they are
implemented as collections of <code>OPTION</code> elements.
</p>

<p id="faBut_8">
Turning the problem around and testing a returned reference to see if
it has the characteristics of a <code>SELECT</code> element (such as
an <code>options</code> property) would be better but some collection
implementations have all of the properties and methods of the first
element within that collection as well as the properties and methods
of a collection (e.g. on IceBrowser 5). That means that it would not be
easy to distinguish a collection of <code>SELECT</code> controls
from an individual <code>SELECT</code> control. However, a more
elaborate test might go:-
</p>

<pre id="faBut_ex4">
<span class="commentJS">/* Normalise a reference that may be an individual from control
   (including SELECT elements) or may be a collection of controls
   into a form that can be handled in a - for - loop controlled with
   its - length - property and accessed by integer index.
*/</span>
if((typeof contrlCollection.length != &quot;number&quot;)|| <span class="commentJS">//no length propety:</span>
   <span class="commentJS">/*  or:-  */</span>
   ((contrlCollection.options)&amp;&amp;    <span class="commentJS">//it has an options colleciton and:</span>
    ((!contrlCollection[0])|| <span class="commentJS">//no object at index 0 - not a collection</span>
     <span class="commentJS">/*  or:-  */</span>
     (contrlCollection[0] == contrlCollection.options[0])))){
     <span class="commentJS">/* The object at index 0 in contrlCollection is the same object
        as is at index 0 in contrlCollection.options so this must be
        an individual SELECT element not a collection of them because a
        collection of SELECT elements would not have an OPTION element
        at index zero.
     */</span>
       contrlCollection = [contrlCollection];
}
</pre>

<h2 id="faEff">Efficient use of Form Accessors</h2>

<p id="faEff_1">
Code that interacts with <code>FORM</code> elements and controls
through the <code>document.forms</code> collection and the form's
<code>elements</code> collection usually does not do enough work to
make the efficiency of the code significant. But with large forms with
many controls an inefficiently coded validation function (or some other
interaction, like keeping running totals) can negatively impact on the
user's experience. It can also be argued that considering the
efficiency of implementation is a worthwhile habit even when it would
make no perceivable difference.
</p>

<p id="faEff_2">
A significant aspect of the efficient coding of form interacting code
is the re-resolving of references to various objects. This trivial
example code copies the values of 5 <code>INPUT</code> elements to
local variables:-
</p>

<pre id="faEff_ex1">
var txt1 = document.forms[&quot;formName&quot;].elements[&quot;field1&quot;].value;
var txt2 = document.forms[&quot;formName&quot;].elements[&quot;field2&quot;].value;
var txt3 = document.forms[&quot;formName&quot;].elements[&quot;field3&quot;].value;
var txt4 = document.forms[&quot;formName&quot;].elements[&quot;field4&quot;].value;
var txt5 = document.forms[&quot;formName&quot;].elements[&quot;field5&quot;].value;
</pre>

<p id="faEff_3">
The shortcut accessors require the resolution of fewer object
references:-
</p>

<pre id="faEff_ex2">
var txt1 = document[&quot;formName&quot;][&quot;field1&quot;].value;
var txt2 = document[&quot;formName&quot;][&quot;field2&quot;].value;
var txt3 = document[&quot;formName&quot;][&quot;field3&quot;].value;
var txt4 = document[&quot;formName&quot;][&quot;field4&quot;].value;
var txt5 = document[&quot;formName&quot;][&quot;field5&quot;].value;
</pre>

<p id="faEff_4">
But their use still involves re-resolving the form object each time a
form control is accessed. It would be unnecessary to re-resolve this
reference if a reference to the form was assigned to a local variable:-
</p>

<pre id="faEff_ex3">
<span class="commentJS">/* Assign a reference to the form object to the local variable - frm -
   and then make subsequent control references relative to that local
   variable:
*/</span>
var frm = document.forms[&quot;formName&quot;];
var txt1 = frm.elements[&quot;field1&quot;].value;
var txt2 = frm.elements[&quot;field2&quot;].value;
var txt3 = frm.elements[&quot;field3&quot;].value;
var txt4 = frm.elements[&quot;field4&quot;].value;
var txt5 = frm.elements[&quot;field5&quot;].value;
</pre>

<p id="faEff_5">
The effect would be much the same as when a reference to the form
object has been passed to a function and control references are
accessed relative to the parameter holding the form reference.
</p>

<p id="faEff_6">
It is still not optimum to be re-resolving the <code>elements</code>
collection, and it is practical to assign a reference to that object
to a local variable instead of a reference to the form object:-
</p>

<pre id="faEff_ex4">
<span class="commentJS">/* Assign a reference to the form's elements collection to the local
   variable - frmEls - and then make subsequent control references
   relative to that local variable:
*/</span>
var frmEls = document.forms[&quot;formName&quot;].elements;
var txt1 = frmEls[&quot;field1&quot;].value;
var txt2 = frmEls[&quot;field2&quot;].value;
var txt3 = frmEls[&quot;field3&quot;].value;
var txt4 = frmEls[&quot;field4&quot;].value;
var txt5 = frmEls[&quot;field5&quot;].value;
</pre>

<p id="faEff_7">
With the original long form accessor the resolution starts with
resolving the <code>&quot;document&quot;</code> identifier. The
identifier is first looked for among the local variables of the
function (as a named property of the internal 
&quot;Variable&quot; object, by ECMA specification),
when it is not found the scope chain is searched, object by object
down the chain, for a property with the corresponding name. When the
scope resolution for <code>&quot;document&quot;</code> gets to the
global object (at the end of the scope chain) it will find a property
called <code>&quot;document&quot;</code>, a reference to the
<code>document</code> object, and the first identifier in the accessor
will have been resolved. The next identifier is
<code>&quot;forms&quot;</code> and that is located as a property of the
<code>document</code>. Then the <code>&quot;formName&quot;</code>
property is identified in the <code>forms</code> collection. Next the
<code>&quot;elements&quot;</code> property of the form is located,
followed by the control name in that object and finally the
<code>&quot;value&quot;</code> property of the control is returned.
</p>

<p id="faEff_8">
When a reference to the <code>elements</code> collection is assigned to
a local variable the first identifier in the property accessor is
identified as that local variable, the control name is identified as a
property of the <code>elements</code> collection referenced and the
<code>&quot;value&quot;</code> property of the control is returned.
</p>

<p id="faEff_9">
Obviously there is a big difference in the amount of work involved in
acquiring the <code>value</code> of the control in each case. That
difference will not be that significant if only a couple of values are
accessed, but even with as few as half a dozen control property
accesses the second approach will obviously be much more efficient,
and with increasing numbers of controls the difference could easily
become apparent to the user.
</p> 
</body>
</html>
