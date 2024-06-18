function uploadXMLFile(xml, symbol) {
    fetch('../upload.php?symbol=' + symbol, {
        method: 'POST',
        body: xml
    })
        .then(response => {
            if (response.ok) {
                alert('XML soubor se úspěšně nahrál!');
                location.reload();
            } else {
                response.text().then(errorMessage => {
                    alert('XML soubor se nenahrál úspěšně: ' + errorMessage);
                });
            }
        })
        .catch(error => {
            console.error('Error uploading XML file:', error);
            alert('XML soubor se nenahrál úspěšně:');
        });


    reader.readAsText(file);
    location.reload();
}

function deleteFile() {
    const filename = document.getElementById('cryptocurrency').value;
    if (!filename) {
        alert('Vyber soubor ke smazání');
        return;
    }

    fetch('../delete_file.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'filename=' + encodeURIComponent(filename),
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Připojení k síti selhalo');
            }
            return response.text();
        })
        .then(response => {
            if (response === 'success') {
                alert('Soubor byl úspěšně smazán.');
                fetchXMLFiles();
                location.reload();
            } else {
                alert(response);
            }
        })
        .catch(error => console.error('Error deleting file:', error));
    location.reload();
}
function fetchXMLFiles() {
    fetch('../find_xml_files.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Připojení k síti selhalo');
            }
            return response.json();
        })
        .then(data => {
            const selectElement = document.getElementById('cryptocurrency');
            data.files.forEach(filename => {
                const option = document.createElement('option');
                option.value = filename;
                option.textContent = filename;
                selectElement.appendChild(option);
            });
        })
        .catch(error => console.error('Error fetching XML files:', error));
}

function download_all_files() {
    const downloadUrl = `../download_all.php`;
    window.location.href = downloadUrl;
}

function download_file() {
    const selectedCryptocurrency = document.getElementById('cryptocurrency').value;
    const downloadUrl = `../download.php?cryptocurrency=${selectedCryptocurrency}`;
    window.location.href = downloadUrl;
}

function loadCryptocurrencyDetails() {
    const selectedCryptocurrency = document.getElementById('cryptocurrency').value;
    const xmlFilePath = `../data/${selectedCryptocurrency}`;

    fetch(xmlFilePath)
        .then(response => {
            if (!response.ok) {
                throw new Error('Chyba při načítání XML souboru');
            }
            return response.text();
        })
        .then(xmlText => {
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(xmlText, 'text/xml');
            const id = xmlDoc.querySelector('id').textContent;
            const name = xmlDoc.querySelector('name').textContent;
            const symbol = xmlDoc.querySelector('symbol').textContent;
            const image = xmlDoc.querySelector('image').textContent;
            const price_usd = xmlDoc.querySelector('price_usd').textContent;
            const url = `create_file.php?id=${id}&name=${name}&symbol=${symbol}&image=${image}&price_usd=${price_usd}`;
            window.location.href = url;
        })
        .catch(error => console.error('Chyba při načítání XML souboru:', error));
}

function fetchData() {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', '../fetch_crypto_data.php', true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            alert('Data se úspěšně nahrála!');
        }
    };
    xhr.send();
    location.reload();
}

function displayData() {
    fetch('../find_xml_files.php')
        .then(response => response.json())
        .then(data => {
            if (Array.isArray(data.files)) {
                data.files.forEach(fileName => {
                    fetchXML(fileName);
                });
            } else {
                console.error('Files data is not an array:', data.files);
            }
        })
        .catch(error => console.error('Error fetching XML files:', error));
}

function fetchXML(fileName) {
    fetch('../data/' + fileName)
        .then(response => response.text())
        .then(xmlText => {
            let parser = new DOMParser();
            let xmlDoc = parser.parseFromString(xmlText, 'text/xml');
            renderCryptoCards(xmlDoc);
        })
        .catch(error => console.error('Error fetching XML:', error));
}

function renderCryptoCards(xmlDoc) {
    let divCryptoList = document.getElementById('crypto-list');
    let xmlCrypto = xmlDoc.getElementsByTagName('cryptocurrency');

    for (let xmlCurrency of xmlCrypto) {
        let name = xmlCurrency.getElementsByTagName('name')[0].innerHTML;
        let symbol = xmlCurrency.getElementsByTagName('symbol')[0].innerHTML;
        let image = xmlCurrency.getElementsByTagName('image')[0].innerHTML;
        let priceUSD = xmlCurrency.getElementsByTagName('price_usd')[0]?.innerHTML || '';
        let cryptoCard = document.createElement('div');
        cryptoCard.classList.add('flex', 'items-center', 'bg-black', 'p-4', 'mb-4', 'rounded-lg', 'shadow-lg');

        let imageElement = document.createElement('img');
        imageElement.classList.add('crypto-image', 'rounded-full', 'mr-1');
        imageElement.setAttribute('src', image);
        imageElement.setAttribute('alt', name);

        let textContainer = document.createElement('div');
        textContainer.classList.add('flex', 'flex-col', 'justify-center');

        let nameElement = document.createElement('h2');
        nameElement.classList.add('text-yellow-400', 'text-lg', 'font-bold', 'mb-1');
        nameElement.textContent = name;

        let symbolElement = document.createElement('p');
        symbolElement.classList.add('ml-1', 'text-white', 'text-sm', 'mb-1');
        symbolElement.textContent = symbol;

        let priceElement = document.createElement('p');
        priceElement.classList.add('text-white', 'text-lg', 'font-bold', 'w-1/4', 'text-right');
        priceElement.textContent = '$' + priceUSD;

        cryptoCard.appendChild(nameElement);
        cryptoCard.appendChild(symbolElement);
        cryptoCard.appendChild(imageElement);
        cryptoCard.appendChild(priceElement);

        divCryptoList.appendChild(cryptoCard);
    }
}