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
    const downloadUrl = `../merge_all.php`;
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


function renderCryptoCards() {
    fetch('../crypto.xsl')
        .then(response => response.text())
        .then(xmlText => {
            let parser = new DOMParser();
            let xsl = parser.parseFromString(xmlText, 'text/xml');
            let divCryptoList = document.getElementById('crypto-list');
            xsltProcessor = new XSLTProcessor();
            xsltProcessor.importStylesheet(xsl);
            fetch('../merge_all.php').then(response => response.text()).then(xmlCrypto => {
                const parser = new DOMParser();
                xmlCrypto = parser.parseFromString(xmlCrypto, 'application/xml')
                resultDocument = xsltProcessor.transformToFragment(xmlCrypto, document);
                divCryptoList.appendChild(resultDocument);
            })


        })

}