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
        <input style="display: none;" type="file" id="cryptocurrency" accept=".xml">
        <label class="file:bg-black file:text-yellow-400 file:border-yellow-400 file:rounded-md text-center bg-black text-yellow-400 mx-2 px-4 py-2 rounded-md" for="cryptocurrency">Vybrat a nahrát XML</label>
    </div>
    <div id="crypto-list" class="container mx-auto mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"></div>

    <script>
        function addFile() {
            const fileInput = document.getElementById('cryptocurrency');
            const file = fileInput.files[0];

            if (!file) {
                alert('Je potřeba vybrat soubor.');
                return;
            }

            const reader = new FileReader();
            reader.onload = (event) => {
                const xml = event.target.result;
                const parser = new DOMParser();
                const xmlDoc = parser.parseFromString(xml, 'text/xml');
                const symbol = xmlDoc.querySelector('symbol').textContent;
                uploadXMLFile(xml, symbol)
            };
            reader.readAsText(file);
        }
        var input = document.getElementById('cryptocurrency');
        input.addEventListener('input', function() {
            addFile();
        });
        document.addEventListener('DOMContentLoaded', function() {
            fetchXMLFiles();
            displayData();
        });
    </script>
</body>

</html>