<?php
if (isset($_GET['cryptocurrency']) && !empty($_GET['cryptocurrency'])) {
    $filename = $_GET['cryptocurrency'];
    $xmlDirectory = 'data/';
    $filePath = $xmlDirectory . $filename;
    if (file_exists($filePath)) {
        header('Content-Type: application/xml');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        header('Content-Length: ' . filesize($filePath));
        readfile($filePath);
        exit;
    } else {
        echo "Soubor neexistuje!";
    }
} else {
    echo "Chyba!";
}
