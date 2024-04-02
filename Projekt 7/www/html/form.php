<!DOCTYPE html>
<html lang="cs">

<head>
    <meta charset="UTF-8">
    <title>Formuláře</title>
</head>

<body>
    <h1>Experiment s formuláři</h1>
    <hr />
    <form action="form-submit.php" method="get">
        <label for="get-input">GET</label><br>
        <input type="text" id="get-input" name="get-input" placeholder="GET"><br>
        <input type="submit" value="GET">
    </form>
    <hr />
    <form action="form-submit.php" method="post">
        <label for="post-input">POST</label><br>
        <input type="number" id="post-input" name="post-input" placeholder="POST"><br>
        <input type="submit" value="POST">
    </form>
    <hr />
</body>

</html>