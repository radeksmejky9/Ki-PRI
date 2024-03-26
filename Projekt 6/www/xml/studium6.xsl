<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Tabulka předmětů podle zimního a letního semestru (počet kreditů &gt; 2)</title>
                <style>
                    table {
                        width: 100%;
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
                <h1>Tabulka předmětů podle zimního a letního semestru (počet kreditů &gt; 2)</h1>
                <h2>Zimní semestr</h2>
                <table>
                    <tr>
                        <th>Kód</th>
                        <th>Název</th>
                        <th>Katedra</th>
                        <th>Vyučující</th>
                        <th>Telefon</th>
                        <th>Email</th>
                        <th>Kredity</th>
                        <th>Status</th>
                        <th>Zakončení</th>
                    </tr>
                    <xsl:apply-templates select="//semestr[@nazev='zimni']/predmet[kredity > 2]"/>
                </table>
                <h2>Letní semestr</h2>
                <table>
                    <tr>
                        <th>Kód</th>
                        <th>Název</th>
                        <th>Katedra</th>
                        <th>Vyučující</th>
                        <th>Telefon</th>
                        <th>Email</th>
                        <th>Kredity</th>
                        <th>Status</th>
                        <th>Zakončení</th>
                    </tr>
                    <xsl:apply-templates select="//semestr[@nazev='letni']/predmet[kredity > 2]"/>
                </table>
            </body>
        </html>
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
                <xsl:value-of select="@katedra"/>
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
