<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Seznam předmětů</title>
                <style>
                    .KMA {background-color: #ffd700;}
                    .CJP {background-color: #00ff00;}
                    .KI {background-color: #ff69b4;}
                </style>
            </head>
            <body>
                <h1>Seznam předmětů</h1>
                <ul>
                    <xsl:apply-templates select="//predmet"/>
                </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="predmet">
        <li class="{@katedra}">
            <xsl:value-of select="@kod"/>
 -            <xsl:value-of select="nazev"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
