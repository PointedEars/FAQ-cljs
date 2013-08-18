<?php

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

$doc->load('index.xsl');
$xsl->importStyleSheet($doc);

$doc->load('index.xml');
echo $xsl->transformToXML($doc);