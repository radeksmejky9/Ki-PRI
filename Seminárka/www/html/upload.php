<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['symbol'])) {
    $xmlData = file_get_contents('php://input');
    $symbol = $_GET['symbol'];
    $filename = 'data/' . $symbol . '.xml';
    file_put_contents($filename, $xmlData);
    http_response_code(200);
    echo "XML data uploaded successfully.";
} else {
    http_response_code(405);
    echo "Method Not Allowed";
}
