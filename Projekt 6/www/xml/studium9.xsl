<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template match="/">
        <xsl:variable name="maxCreditsSemester">
            <xsl:for-each select="//semestr">
                <xsl:sort select="sum(predmet/kredity)" data-type="number" order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="@nazev"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="selectedSubjects" select="//semestr[@nazev = $maxCreditsSemester]/predmet"/>

        <html>
            <head>
                <style>
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
                <h2>Seznam předmětů pro semestr s nejvyšším celkovým počtem kreditů (semestr: <xsl:value-of select="$maxCreditsSemester"/>
)</h2>
                <table>
                    <tr>
                        <th>Kód</th>
                        <th>Název</th>
                        <th>Vyučující</th>
                        <th>Katedra</th>
                        <th>Kredity</th>
                        <th>Status</th>
                        <th>Zakončení</th>
                    </tr>
                    <xsl:apply-templates select="$selectedSubjects"/>
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
