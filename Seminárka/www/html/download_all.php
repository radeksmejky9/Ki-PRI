<?php
header('Content-Type: text/xml');
header('Content-Disposition: attachment; filename="all_cryptocurrencies.xml"');

$combinedXml = new DOMDocument('1.0', 'UTF-8');
$root = $combinedXml->createElement('cryptocurrencies');
$combinedXml->appendChild($root);

$directory = 'data/';

foreach (glob($directory . "*.xml") as $filename) {
    $fileContents = file_get_contents($filename);
    $xml = new DOMDocument();
    $xml->loadXML($fileContents);

    foreach ($xml->getElementsByTagName('cryptocurrency') as $node) {
        $importedNode = $combinedXml->importNode($node, true);
        $root->appendChild($importedNode);
    }
}
echo $combinedXml->saveXML();
exit;
