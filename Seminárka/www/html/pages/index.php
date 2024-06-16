<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Kryptoměny</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="../scripts.js"></script>
    <style>
        .crypto-image {
            width: 100px;
            height: 100px;
            margin: 0 auto;
            display: block;
        }
    </style>
</head>

<body class="bg-yellow-400">
    <?php include('../assets/navbar.php'); ?>
    <h1 class="text-center text-3xl font-bold my-8">Seznam Kryptoměn</h1>
    <div class="flex justify-center">
        <button class="bg-black text-yellow-400 px-4 py-2 rounded-md" onclick="fetchData()">Nahrát data z Gecko API</button>
    </div>
    <div id="crypto-list" class="container mx-auto mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"></div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            fetchXMLFiles();
        });
    </script>
</body>

</html>