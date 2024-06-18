<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Tvorba</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="../scripts.js"></script>
</head>

<body class="bg-yellow-400">
    <?php include('../assets/navbar.php'); ?>
    <h1 class="text-center text-3xl font-bold bg-yellow-400 my-8">Tvorba</h1>
    <div class="max-w-xl bg-black mt-10 pt-4 mx-auto rounded-lg shadow-md">
        <div class="bg-black px-4">
            <h2 class="text-lg font-semibold text-yellow-400">Vytvoř/Uprav kryptoměnu</h2>
        </div>
        <div class="bg-black p-4">
            <form id="cryptoForm" class="space-y-4 custom-form">
                <div>
                    <label for="id" class="block text-md font-medium text-yellow-400">ID:</label>
                    <input type="text" id="id" name="id" class="mt-1 block font-semibold w-full bg-yellow-400 border-black p-1 rounded-md text-xl" value="<?php echo isset($_GET['id']) ? htmlspecialchars($_GET['id']) : ''; ?>">
                </div>
                <div>
                    <label for="name" class="block text-md font-medium text-yellow-400">Name:</label>
                    <input type="text" id="name" name="name" class="mt-1 block font-semibold w-full bg-yellow-400 border-yellow-400 p-1 rounded-md text-xl" value="<?php echo isset($_GET['name']) ? htmlspecialchars($_GET['name']) : ''; ?>">
                </div>
                <div>
                    <label for="symbol" class="block text-md font-medium text-yellow-400">Symbol:</label>
                    <input type="text" id="symbol" name="symbol" class="mt-1 block font-semibold w-full bg-yellow-400 border-yellow-400 p-1 rounded-md text-xl" value="<?php echo isset($_GET['symbol']) ? htmlspecialchars($_GET['symbol']) : ''; ?>">
                </div>
                <div>
                    <label for="image" class="block text-md font-medium text-yellow-400">Image URL:</label>
                    <input type="url" id="image" name="image" class="mt-1 block font-semibold w-full bg-yellow-400 border-yellow-400 p-1 rounded-md text-xl" value="<?php echo isset($_GET['image']) ? htmlspecialchars($_GET['image']) : ''; ?>">
                </div>
                <div>
                    <label for="price_usd" class="block text-md font-medium text-yellow-400">Price (USD):</label>
                    <input type="number" id="price_usd" name="price_usd" class="mt-1 block font-semibold w-full bg-yellow-400 border-yellow-400 p-1 rounded-md text-xl" value="<?php echo isset($_GET['price_usd']) ? htmlspecialchars($_GET['price_usd']) : ''; ?>">
                </div>
                <div class="flex justify-end">
                    <button type="button" onclick="generateAndUploadXML()" class="inline-flex items-center px-4 py-2 text-sm bg-yellow-400 rounded-md font-semibold text-black uppercase tracking-widest">Vygeneruj a nahraj xml</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        function generateAndUploadXML() {
            const id = document.getElementById('id').value;
            const name = document.getElementById('name').value;
            const symbol = document.getElementById('symbol').value;
            const image = document.getElementById('image').value;
            const price_usd = document.getElementById('price_usd').value;

            const xml = `
            <cryptocurrencies>
                <cryptocurrency>
                    <id>${id}</id>
                    <name>${name}</name>
                    <symbol>${symbol}</symbol>
                    <image>${image}</image>
                    <price_usd>${price_usd}</price_usd>
                </cryptocurrency>
            </cryptocurrencies>`;
            uploadXMLFile(xml, symbol)
        }


        document.addEventListener('DOMContentLoaded', function() {
            loadCryptocurrencyDetails();
        });
    </script>
</body>

</html>