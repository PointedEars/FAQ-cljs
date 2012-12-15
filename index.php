<?php

$doc = new DOMDocument();
$xsl = new XSLTProcessor();

$doc->load('index.xsl');
$xsl->importStyleSheet($doc);

$doc->load('index.xml');
echo $xsl->transformToXML($doc);