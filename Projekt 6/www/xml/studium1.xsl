<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Studium</title>
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
            <ul>
                <xsl:apply-templates/>
            </ul>
        </section>
    </xsl:template>

    <xsl:template match="predmet">
        <li>
            <xsl:value-of select="@kod"/>
 -            <xsl:value-of select="nazev"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
