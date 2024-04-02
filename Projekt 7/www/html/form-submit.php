<?php
if (isset($_GET['get-input'])) {
    echo 'GET: ' . $_GET['get-input'] . '<br>';
}
if (isset($_POST['post-input'])) {
    echo 'POST: ' . $_POST['post-input'] . '<br>';
}
?>
<a href="form.php">Back</a>