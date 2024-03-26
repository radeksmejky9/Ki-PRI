<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="selectedSubjectCode" select="'MA2'"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Údaje o předmětu: <xsl:value-of select="$selectedSubjectCode"/></title>
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
                <h1>Údaje o předmětu: <xsl:value-of select="$selectedSubjectCode"/></h1>
                <table>
                    <xsl:apply-templates select="//predmet[@kod = $selectedSubjectCode]"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="predmet">
        <tr>
            <th>Kód předmětu</th>
            <td><xsl:value-of select="@kod"/></td>
        </tr>
        <tr>
            <th>Název předmětu</th>
            <td><xsl:value-of select="nazev"/></td>
        </tr>
        <tr>
            <th>Katedra</th>
            <td><xsl:value-of select="@katedra"/></td>
        </tr>
        <tr>
            <th>Vyučující</th>
            <td><xsl:value-of select="vyucujici/jmeno"/></td>
        </tr>
        <tr>
            <th>Telefon</th>
            <td><xsl:value-of select="vyucujici/telefon"/></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><xsl:value-of select="vyucujici/email"/></td>
        </tr>
        <tr>
            <th>Počet kreditů</th>
            <td><xsl:value-of select="kredity"/></td>
        </tr>
        <tr>
            <th>Status</th>
            <td><xsl:value-of select="status"/></td>
        </tr>
        <tr>
            <th>Zakončení</th>
            <td><xsl:value-of select="zakonceni"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
