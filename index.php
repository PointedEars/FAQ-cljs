<?php

error_reporting(E_ALL);
ini_set('display_errors', true);

$encoding = 'UTF-8';
header("Content-Type: text/html" . ($encoding ? "; charset=$encoding" : ""));

$modi = max(
  array_map('filemtime',
    array_diff(
      array_merge(
        scandir(__DIR__),
        array_map(
          function ($e) {
            return 'sections' . DIRECTORY_SEPARATOR . $e;
          },
          scandir('sections')
        )
      ),
      array('.', '..')
    )
  )
);

header('Last-Modified: ' . gmdate('D, d M Y H:i:s', $modi) . ' GMT');

/* Cached resource expires in HTTP/1.1 caches 0 (-24-) h after last retrieval */
header('Cache-Control: max-age=0, s-maxage=0, must-revalidate, proxy-revalidate');

/* Cached resource expires in HTTP/1.0 caches 0 (-24-) h after last retrieval */
header('Expires: ' . gmdate('D, d M Y H:i:s', time() /*+ 86400*/) . ' GMT');

$doc = new DOMDocument();
$doc->substituteEntities = true;
$xsl = new XSLTProcessor();

$format = isset($_GET['format'])
        ? $_GET['format']
        : (isset($argv[1]) ? $argv[1] : 'html');
$doc->load("$format.xsl");
$xsl->importStyleSheet($doc);

$doc->load('index.xml');
if ($format === 'markdown') {
    /* Retrieve parsed document */
    $xml = $doc->saveXML();
    
    /* Trim indentation */
    $xml = preg_replace(
        '#^\s+(</?(?:content|li(?:st)?|moreinfo|p))#im',
        '$1',
        $xml
    );
    
    /* Trim leading/trailing whitespace after/before start/end tag */
    $xml = preg_replace(
        '#(<CODE>(?:<!\[CDATA\[)?)\s+|\s+((?:\]\]>)?</CODE>)#',
        '$1$2',
        $xml
    );
    file_put_contents('index-trimmed.xml', $xml);
    
    $xml = $doc->loadXML($xml);
}

$result = $xsl->transformToXML($doc);

echo $result;
