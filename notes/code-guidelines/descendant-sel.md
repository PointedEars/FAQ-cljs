 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
            "http://www.w3.org/TR/html4/strict.dtd">

<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<link rel="Index" href="../">
<title>Toggle Class To Trigger Descendant Selector Rules</title>

<style type="text/css">
/* Make table pretty */
table {
  border: 1px solid #8893af;
  background: #dfe3ff;
  width: 33em;
  font-family: verdana, sans-serif;
  margin: 12px;
}
tr {
  background: #eef6ff;
}

td {
  padding: 4px;
}

/* The descendant selector trick */
.even .odd-row, .odd tr {
  display: none;
}

.odd .odd-row {
  display: block;
  display: table-row;
} 

.odd-row { 
  background: #fdfeff;
}
</style>

<script type="text/javascript">
function showEven() {
   var testTable = document.getElementById("testTable");
   testTable.className = "even";
}

function showOdd() {
   var testTable = document.getElementById("testTable");
   testTable.className = "odd";
}

function showAll() {
   var testTable = document.getElementById("testTable");
   testTable.className = "";
}
</script>  
</head>

<body>
<h1>Toggle Class To Trigger Descendant Selector Rules</h1>
<h2>Description</h2>
<p>
 By toggling a class name on the table, the descendant selector is applied and certain rows are shown 
 and hidden.
</p>
<h2>Demonstration</h2>
<div>
    <button onclick="showEven()">showEven()</button>
    <button onclick="showOdd()">showOdd()</button>
    <button onclick="showAll()">showAll()</button>
</div>

<table id="testTable">
    <tr>
      <td>even row, even row, even row, even row, even row, even row</td>
    </tr>
    <tr class="odd-row">
      <td>odd row, odd row, odd row, odd row, odd row, odd row</td>
    </tr>
    <tr>
      <td>even row, even row, even row, even row, even row, even row</td>
    </tr>
    <tr class="odd-row">
      <td>odd row, odd row, odd row, odd row, odd row, odd row</td>
    </tr>
    <tr>
      <td>even row, even row, even row, even row, even row, even row</td>
    </tr>
    <tr class="odd-row">
      <td>odd row, odd row, odd row, odd row, odd row, odd row</td>
    </tr>
    <tr>
      <td>even row, even row, even row, even row, even row, even row</td>
    </tr>
    <tr class="odd-row">
      <td>odd row, odd row, odd row, odd row, odd row, odd row</td>
    </tr>
</table>
</body>

</html>
