<?php
$xml = new DOMDocument;
$xml->load('../xml/studium.xml');
$xsl = new DOMDocument;
if (isset($_GET['ukol'])) {
    $ukol = $_GET['ukol'];
    $xsl->load("../xml/studium$ukol.xsl");
} else {
    $xsl->load("../xml/studium3.xsl");
}
$xslt = new XSLTProcessor();
$xslt->importStylesheet($xsl);

echo $xslt->transformToXml($xml);
