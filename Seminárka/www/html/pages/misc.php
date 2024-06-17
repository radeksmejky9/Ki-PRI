<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Ostatní operace</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="../scripts.js"></script>
</head>

<body class="bg-yellow-400">
    <?php include('../assets/navbar.php'); ?>
    <h1 class="text-center text-3xl font-bold bg-yellow-400 my-8">Ostatní operace</h1>
    <div class="max-w-xl bg-black mt-10 pt-4 mx-auto rounded-lg shadow-md">
        <div class="bg-black px-4">
            <h2 class="text-lg font-semibold text-yellow-400">Vyber kryptoměnu</h2>
        </div>
        <div class="bg-black p-4">
            <form id="cryptoSelectForm" class="space-y-4 custom-form">
                <div>
                    <label for="cryptocurrency" class="block text-md font-medium text-yellow-400">Kryptoměna:</label>
                    <select id="cryptocurrency" name="cryptocurrency" class="mt-1 block font-semibold w-full bg-yellow-400 border-yellow-400 p-1 rounded-md text-xl">
                    </select>
                </div>
                <div class="flex flex-col items-center">
                    <button type="button" onclick="download_all_files()" class="w-1/3 mb-2 px-4 py-2 my-2 text-sm bg-yellow-400 rounded-md font-semibold text-black uppercase tracking-widest">Stáhnout vše</button>
                    <button type="button" onclick="download_file()" class="w-1/3 mb-2 px-4 py-2 my-2 text-sm bg-yellow-400 rounded-md font-semibold text-black uppercase tracking-widest">Stáhnout vybraný</button>
                    <button type="button" onclick="loadCryptocurrencyDetails()" class="w-1/3 mb-2 px-4 py-2 my-2 text-sm bg-yellow-400 rounded-md font-semibold text-black uppercase tracking-widest">Přejít na úpravu</button>
                    <button type="button" onclick="deleteFile()" class="w-1/3 mb-2 px-4 py-2 my-2 text-sm bg-red-500 rounded-md font-semibold text-black uppercase tracking-widest">Smazat</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            fetchXMLFiles();
        });
    </script>
</body>

</html>