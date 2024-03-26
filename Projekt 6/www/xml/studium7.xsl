<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <!-- Identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <html>
            <head>
                <title>Seznam semestrů podle celkového počtu kreditních bodů</title>
            </head>
            <body>
                <h1>Seznam semestrů podle celkového počtu kreditních bodů</h1>
                <xsl:apply-templates select="//semestr">
                    <xsl:sort select="sum(predmet/kredity)" data-type="number" order="descending"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="semestr">
        <div>
            <h2>
                <xsl:value-of select="@nazev"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select="sum(predmet/kredity)"/>
                <xsl:text> kreditů</xsl:text>
            </h2>
            <ul>
                <xsl:apply-templates select="predmet"/>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="predmet">
        <li>
            <xsl:value-of select="nazev"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
