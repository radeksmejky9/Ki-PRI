<?php
$dir = 'data/';

if (!is_dir($dir)) {
    $response = array(
        'success' => false,
        'message' => 'Cesta neexistuje a nebo není přístupná'
    );
} else {
    $files = array_diff(scandir($dir), array('..', '.'));

    $xmlFiles = array_filter($files, function ($file) {
        return pathinfo($file, PATHINFO_EXTENSION) == 'xml';
    });

    if (empty($xmlFiles)) {
        $response = array(
            'success' => false,
            'message' => 'Na dané cestě se nenachází žádný XML soubor.'
        );
    } else {
        $response = array(
            'success' => true,
            'files' => array_values($xmlFiles)
        );
    }
}

header('Content-Type: application/json');
echo json_encode($response);
