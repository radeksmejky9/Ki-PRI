document.addEventListener('DOMContentLoaded', () => {
    getBooks();
});

function getBooks() {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == XMLHttpRequest.DONE && this.status == 200)
            displayBooks(this.responseXML);
    };

    xhr.open("GET", './xml/knihy.xml');
    xhr.send();
}

function displayBooks(xmlDoc) {
    let divBooks = document.getElementById('books');
    let xmlBooks = xmlDoc.getElementsByTagName('kniha');

    let table = document.createElement('table');
    table.classList.add('books-table');
    let thead = document.createElement('thead');
    let headerRow = document.createElement('tr');
    let headers = ['Nazev', 'Autor', 'Popis'];

    headers.forEach(headerText => {
        let header = document.createElement('th');
        header.appendChild(document.createTextNode(headerText));
        headerRow.appendChild(header);
    });

    thead.appendChild(headerRow);
    table.appendChild(thead);
    let tbody = document.createElement('tbody');

    for (let xmlBook of xmlBooks) {
        let title = xmlBook.getElementsByTagName('nazev')[0].innerHTML;
        let author = xmlBook.getElementsByTagName('autor')[0].innerHTML;
        let description = xmlBook.getElementsByTagName('popis')[0]?.innerHTML || '';

        let row = document.createElement('tr');
        let titleCell = document.createElement('td');
        let authorCell = document.createElement('td');
        let descriptionCell = document.createElement('td');

        titleCell.appendChild(document.createTextNode(title));
        authorCell.appendChild(document.createTextNode(author));
        descriptionCell.appendChild(document.createTextNode(description));

        row.appendChild(titleCell);
        row.appendChild(authorCell);
        row.appendChild(descriptionCell);

        tbody.appendChild(row);
    }

    table.appendChild(tbody);
    divBooks.appendChild(table);

    // označení řádku kliknutím
    tbody.addEventListener('click', (event) => {
        let row = event.target.closest('tr');
        if (!row) return;
        let selectedRow = tbody.querySelector('.selected');
        if (selectedRow) selectedRow.classList.remove('selected');
        row.classList.add('selected');
    });

    // smazání řádku dvojklikem
    tbody.addEventListener('dblclick', (event) => {
        let row = event.target.closest('tr');
        if (!row) return;
        row.remove();
    });

    // projíždění řádků šipkami
    document.addEventListener('keydown', (event) => {
        let selectedRow = tbody.querySelector('.selected');
        if (!selectedRow) return;
        let rows = Array.from(tbody.querySelectorAll('tr'));
        let currentIndex = rows.indexOf(selectedRow);

        switch (event.key) {
            case 'ArrowUp':
                if (currentIndex > 0) {
                    selectedRow.classList.remove('selected');
                    rows[currentIndex - 1].classList.add('selected');
                }
                break;
            case 'ArrowDown':
                if (currentIndex < rows.length - 1) {
                    selectedRow.classList.remove('selected');
                    rows[currentIndex + 1].classList.add('selected');
                }
                break;
        }
    });
}
