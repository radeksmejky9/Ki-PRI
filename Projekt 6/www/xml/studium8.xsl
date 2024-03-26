<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <style>
                    .KMA {background-color: #ffd700;}
                    .CJP {background-color: #00ff00;}
                    .KI {background-color: #ff69b4;}
                    table {
                        border-collapse: collapse;
                        width: 100%;
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
                <table border="1">
                    <tr>
                        <th>Kód</th>
                        <th>Název</th>
                        <th>Vyučující</th>
                        <th>Katedra</th>
                        <th>Kredity</th>
                        <th>Status</th>
                        <th>Zakončení</th>
                    </tr>
                    <xsl:apply-templates select="//rocnik[@cislo='1']/semestr[@nazev='zimni']/predmet"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="predmet">
        <tr>
            <xsl:attribute name="class">
                <xsl:value-of select="@katedra"/>
            </xsl:attribute>
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
                <xsl:value-of select="@katedra"/>
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
