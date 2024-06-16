<?php
if (isset($_POST['filename'])) {
    $filename = $_POST['filename'];
    $file_path = "data/" . $filename;

    if (file_exists($file_path)) {
        if (unlink($file_path)) {
            echo "success";
        } else {
            echo "Failed to delete the file.";
        }
    } else {
        echo "File '$filename' does not exist.";
    }
    exit;
}
