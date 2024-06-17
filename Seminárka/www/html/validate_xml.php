<?php

$xmlString = $_POST['xml'];
$xsdString = file_get_contents('cryptocurrency.xsd');

$doc = new DOMDocument();
$doc->loadXML($xmlString);

$xsd = new DOMDocument();
$xsd->loadXML($xsdString);

if ($doc->schemaValidate($xsd)) {
    echo 'valid';
} else {
    echo 'invalid';
}
