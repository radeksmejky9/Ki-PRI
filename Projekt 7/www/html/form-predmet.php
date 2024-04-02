<?php
$xml = new DOMDocument;
$xml->load('../xml/studium.xml');
$xsl = new DOMDocument;
if (isset($_GET['predmet'])) {
    $kodPredmetu = $_GET['predmet'];
    $xsl->load("../xml/studium-predmet.xsl");
} else {
    $xsl->load("../xml/studium-predmet-form.xsl");
}
$xslt = new XSLTProcessor();
$xslt->importStylesheet($xsl);
if (isset($kodPredmetu))
    $xslt->setParameter('', 'kodPredmetu', $kodPredmetu);
echo $xslt->transformToXml($xml);
