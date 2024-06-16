<?php
if (isset($_GET['cryptocurrencies']) && !empty($_GET['cryptocurrencies'])) {
    $cryptocurrencies = explode(',', $_GET['cryptocurrencies']);
    $xmlDirectory = '../xml_files/';
    $combinedXml = new SimpleXMLElement('<cryptocurrencies/>');
    foreach ($cryptocurrencies as $cryptocurrency) {
        $filePath = $xmlDirectory . $cryptocurrency;
        if (file_exists($filePath)) {
            $xml = simplexml_load_file($filePath);
            $cryptocurrencyNode = $combinedXml->addChild('cryptocurrency');
            foreach ($xml->children() as $child) {
                $cryptocurrencyNode->addChild($child->getName(), (string)$child);
            }
        }
    }
    header('Content-Type: application/xml');
    header('Content-Disposition: attachment; filename="combined_cryptocurrencies.xml"');
    echo $combinedXml->asXML();
    exit;
} else {
    echo "Invalid request!";
}
