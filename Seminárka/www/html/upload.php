<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['symbol'])) {

    $xmlString = file_get_contents('php://input');

    $doc = new DOMDocument();
    $doc->loadXML($xmlString);

    $xsdPath = 'crypto.xsd';

    libxml_use_internal_errors(true);

    if (!$doc->schemaValidate($xsdPath)) {
        $errors = libxml_get_errors();
        libxml_clear_errors();

        http_response_code(400);
        echo "Validace selhala:";

        foreach ($errors as $error) {
            echo $error->message . "\n";
        }
        exit;
    }

    $symbol = $_GET['symbol'];
    $filename = 'data/' . $symbol . '.xml';
    file_put_contents($filename, $xmlString);
    http_response_code(200);
    echo "Data se úspěsne nahrála.";
} else {
    http_response_code(405);
    echo "Něco se pokazilo :)";
}
