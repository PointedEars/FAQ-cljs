<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
            "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">

<link rel="schema.DC" href="http://www.purl.org/dc/elements/1.1/">

<meta name="DC.title" lang="en" content="Automatic Semicolon Insertion - Unrestricted Productions">
<meta name="DC.date" scheme="W3CDTF" content="2010-05-29">

<meta name="DC.source" content="http://www.ecma-international.org/publications/standards/Ecma-262.htm">
<meta name="DC.publisher" content="Garrett Smith">
<meta name="DC.Publisher.Address" content="dhtmlkitchen&#64;&#103;&#109;&#97;&#105;&#108;&#46;&#99;&#111;&#109;">
<meta name="DCTERMS.audience" content="Programmers, web developers">
<meta name="DC.description" content="How Automatic Semicolon Insertion affects an ECMAScript program.">
<meta name="DC.source" content="http://www.ecma-international.org/publications/standards/Ecma-262.htm">
<meta name="DCTERMS.language" scheme="RFC1766" content="en">
<link rel="DCTERMS.isReferencedBy" href="./#asi" >

<meta name="DC.source" content="news:comp.lang.javascript">

<link href="../../faq.css" rel="stylesheet" type="text/css">
<link href="../notes.css" rel="stylesheet" type="text/css">
<title>Automatic Semicolon Insertion - Unrestricted Productions</title>
</head>
<body>
<h1>Automatic Semicolon Insertion</h1>
<p>
    Article by Garrett Smith
</p>
<p>
    This document is an addendum to <a href="./#asi"
    >Code Guidelines for Rich Internet Application Development</a>.
</p>
<h2>Unrestricted Productions</h2>
<p>
    Productions that are not <dfn>restricted</dfn> can be created accidentally where 
    <abbr title="automatic semicolon insertion">ASI</abbr> has been used. This is often 
    the result of where the developer forgot to use a 
    semicolon. Regardless, the problems it creates can occur when the order of <dfn>Statements</dfn> 
    changes or when line terminators are added or removed, including those that appear in comments. 
    Where semicolons are needed, it is recommended that they appear explicitly.
</p> 
<ul>
    <li>
        <dfn>Arguments</dfn> and property access operations can be created accidentally when the 
        program relies on <abbr title="automatic semicolon insertion">ASI</abbr>.
    </li>
    <li>
        Line terminators in comments affect <abbr title="automatic semicolon insertion">ASI</abbr>  but behavior in implementations, 
        notably JScript, vary. 
    </li>
 </ul>
 <h3>Grouping Operator or Arguments?</h3>
 <p>
     The parentheses following an <dfn>Expression</dfn> 
     interpreted as <dfn>Arguments</dfn>, implicating the <dfn>Expression</dfn> in 
     a <dfn>CallExpression</dfn>: 
 </p>
<pre>var MyWidget = function(){
 this.name = "mike";
}
/**
  * Initialize Widget
  */
(function() {
  /*...*/
});</pre>
  <p>

     The <dfn>FunctionExpression</dfn> that appears on the right hand side of the assignment  
     to the identifier <code>MyWidget</code> would be called because the parentheses, 
     which were intended to be a <dfn>Grouping Operator</dfn>, are interpreted as <dfn>Arguments</dfn> 
     in a <dfn>CallExpression</dfn>, resulting in <code>MyWidget</code> having the value 
     <code>undefined</code> and <code>window.name</code> getting the value <code>"mike"</code>.
 </p>

 <p>
     This can be explained by the fact that a program is scanned from left to right, 
     repeatedly taking the longest possible sequence of characters as the next input element.
     Since a <dfn>CallExpression</dfn> is not a <dfn>restricted production</dfn>, the program 
     would be interpreted as:
 </p>
 <pre>
var MyWidget = function(){
 this.name = "mike";
}(function() {});
</pre>
<h3>ArrayLiteral or Property Accessor?</h3>
<p>
An <dfn>ArrayLiteral</dfn> can be interpreted as property accessor after the 
removal of a <dfn>restricted production</dfn>. In this case, <dfn>Expression</dfn> <code>g--</code>.
</p>
<pre>
var g = 12
g--
[].slice.call([1,2,3])</pre>
<p>
The program is interpreted as:
</p>
<pre>
var g = 12<kbd>;</kbd>
g--<kbd>;</kbd>
[].slice.call([1,2,3])
</pre>
<p>
When the postfix operator is removed, a <dfn>SyntaxError</dfn> results. Given the input:
</p>
<pre>
var g = 12
--g
[].slice.call([1,2,3])
</pre>
<p>The program is interpreted as:-</p>
<pre>
var g = 12;
--g[].slice.call([1,2,3])
</pre>
<p>
- and that program is not valid syntax so it results in a <dfn>SyntaxError</dfn>.
</p>
<h3>Line Terminators in Comments</h3>
<p>
    A LineTerminator in any <dfn>MultilineComment</dfn> affects 
    <abbr title="automatic semicolon insertion">ASI</abbr>. From ECMAScript Edition 5 specification, 5.1.2:
</p>
<blockquote>
<p>
 A <dfn>MultiLineComment</dfn> (that is, a comment of the form /*...*/
 regardless of whether it spans more than one line) is likewise simply
 discarded if it contains no line terminator; but if a <dfn>MultiLineComment</dfn>
 contains one or more line terminators, then it is replaced by a single
 line terminator, which becomes part of the stream of input elements
 for the syntactic grammar. 
</p>
</blockquote>

<p>
    Not all implementations follow rules of whitespace in MultiLineComment. JScript is one 
    such implementation that does not process a <dfn>MultiLineComment</dfn> that contains 
    a <dfn>LineTerminator</dfn> as a <dfn>LineTerminator</dfn>.
</p>
<p>
    A program that uses semicolons explicitly avoids such problems and is less 
    susceptible to behavior changes (including script errors) caused by inadvertent changes in 
    line terminators and expressions, including those introduced 
    by build tools (e.g. minficication).
</p>

</body>
</html>
