<?php
if (isset($_POST['filename'])) {
    $filename = $_POST['filename'];
    $file_path = "data/" . $filename;

    if (file_exists($file_path)) {
        if (unlink($file_path)) {
            echo "Soubor $filename byl úspěšně smazán.";
        } else {
            echo "Chyba!";
        }
    } else {
        echo "Soubor $filename neexistuje";
    }
    exit;
}
