<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Stahování</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="../scripts.js"></script>
</head>

<body class="bg-yellow-400">
    <?php include('../assets/navbar.php'); ?>
    <h1 class="text-center text-3xl font-bold bg-yellow-400 my-8">Stahování</h1>
    <div class="max-w-xl bg-black mt-10 pt-4 mx-auto rounded-lg shadow-md">
        <div class="bg-black px-4">
            <h2 class="text-lg font-semibold text-yellow-400">Vyber kryptoměnu pro stahování</h2>
        </div>
        <div class="bg-black p-4">
            <form id="cryptoSelectForm" class="space-y-4 custom-form">
                <div>
                    <label for="cryptocurrency" class="block text-md font-medium text-yellow-400">Kryptoměna:</label>
                    <select id="cryptocurrency" name="cryptocurrency" class="mt-1 block font-semibold w-full bg-yellow-400 border-yellow-400 p-1 rounded-md text-xl">
                    </select>
                </div>
                <div class="flex justify-end">
                    <button type="button" onclick="download_all_files()" class="items-center px-4 py-2 mr-6 text-sm bg-yellow-400 rounded-md font-semibold text-black uppercase tracking-widest">Stáhnout vše</button>
                    <button type="button" onclick="download_file()" class="items-center px-4 py-2 text-sm bg-yellow-400 rounded-md font-semibold text-black uppercase tracking-widest">Stáhnout vybraný</button>
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