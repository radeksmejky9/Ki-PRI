<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Studium</title>
                <style>
                    table {
                        width: 50%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid black;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <header>
                    <h1>Studium</h1>
                </header>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="rocnik">
        <section>
            <h2>Rocnik <xsl:value-of select="@cislo"/>
            </h2>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="semestr">
        <section>
            <h3>
                <xsl:value-of select="@nazev"/>
 semestr</h3>
            <table border="1">
                <thead>
                    <tr>
                        <th>Kód</th>
                        <th>Název</th>
                        <th>Vyučující</th>
                        <th>Telefon</th>
                        <th>Email</th>
                        <th>Kredity</th>
                        <th>Status</th>
                        <th>Zakončení</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates/>
                </tbody>
            </table>
        </section>
    </xsl:template>

    <xsl:template match="predmet">
        <tr>
            <td>
                <xsl:value-of select="@kod"/>
            </td>
            <td>
                <xsl:value-of select="nazev"/>
            </td>
            <td>
                <xsl:value-of select="vyucujici/jmeno"/>
            </td>
            <td>
                <xsl:value-of select="vyucujici/telefon"/>
            </td>
            <td>
                <xsl:value-of select="vyucujici/email"/>
            </td>
            <td>
                <xsl:value-of select="kredity"/>
            </td>
            <td>
                <xsl:value-of select="status"/>
            </td>
            <td>
                <xsl:value-of select="zakonceni"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
