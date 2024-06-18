<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:for-each select="cryptocurrencies/cryptocurrency">
            <div class="flex items-center bg-black p-4 mb-4 rounded-lg shadow-lg">
                <img class="crypto-image rounded-full mr-4" src="{image}" alt="{name}" />
                <div class="flex flex-col flex-grow">
                    <h2 class="text-yellow-400 text-lg font-bold mb-1">
                        <xsl:value-of select="name" />
                    </h2>
                    <p class="ml-1 text-white text-sm mb-1">
                        <xsl:value-of select="symbol" />
                    </p>
                </div>
                <p class="text-white text-lg font-bold w-1/4 text-right">
                    <xsl:text>$</xsl:text>
                    <xsl:value-of select="price_usd" />
                </p>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
