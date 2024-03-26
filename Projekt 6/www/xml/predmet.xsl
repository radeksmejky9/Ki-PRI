<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Seznam předmětů s odlišným pozadím pro různé katedry</title>
                <style>
          .KI { background-color: lightblue; }
          .KMA { background-color: lightgreen; }
          .CJP { background-color: red; }
                </style>
            </head>
            <body>
                <h1>Seznam předmětů s odlišným pozadím pro různé katedry</h1>
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
