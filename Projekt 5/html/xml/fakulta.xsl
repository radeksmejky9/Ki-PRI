<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tw="http://tailwindcss.com">

  <xsl:template match="/">
    <html>
      <head>
        <title>Fakulty Univerzity</title>
        <script src="https://cdn.tailwindcss.com"></script>
      </head>
      <body class="font-sans bg-gray-900 text-white">
        <h1 class="text-3xl text-center mt-8 mb-4">Fakulty Univerzity</h1>
        <div class="container mx-auto">
          <xsl:apply-templates select="fakulty/fakulta"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="fakulta">
    <div class="mb-8">
      <h2 class="text-2xl font-semibold mb-2 text-blue-400"><xsl:value-of select="nazev"/></h2>
      <h3 class="font-semibold text-blue-300">Děkan</h3>
      <ul class="list-disc ml-4 mb-4">
        <li><xsl:value-of select="dekan/jmeno"/> <xsl:value-of select="dekan/prijmeni"/></li>
        <li>Tel: <xsl:value-of select="dekan/telefon"/></li>
        <li>Email: <xsl:value-of select="dekan/email"/></li>
        <li>Tituly:
          <xsl:for-each select="dekan/tituly/titul">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">, </xsl:if>
          </xsl:for-each>
        </li>
      </ul>
      <h3 class="text-xl font-semibold text-blue-400">Katedry</h3>
      <xsl:apply-templates select="katedry/katedra"/>
      <hr class="my-4 border-gray-400" />
    </div>
  </xsl:template>

  <xsl:template match="katedra">
    <h4 class="font-semibold mb-2 text-blue-300"><xsl:value-of select="nazev"/></h4>
    <ul class="list-disc ml-4 mb-4">
      <li><strong>Vedoucí katedry:</strong> <xsl:value-of select="vedouci/jmeno"/> <xsl:value-of select="vedouci/prijmeni"/></li>
      <li><strong>Telefon vedoucího:</strong> <xsl:value-of select="vedouci/telefon"/></li>
      <li><strong>Email vedoucího:</strong> <xsl:value-of select="vedouci/email"/></li>
      <li><strong>Tituly vedoucího:</strong>
        <xsl:for-each select="vedouci/tituly/titul">
          <xsl:value-of select="."/>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </li>
    </ul>
    <h4 class="font-semibold mb-2 text-blue-300">Zaměstnanci</h4>
    <table class="table-auto border-collapse border border-gray-500 mb-4">
      <tr class="bg-blue-900 text-white">
        <th class="px-4 py-2">Jméno</th>
        <th class="px-4 py-2">Příjmení</th>
        <th class="px-4 py-2">Telefon</th>
        <th class="px-4 py-2">Email</th>
        <th class="px-4 py-2">Pozice</th>
        <th class="px-4 py-2">Tituly</th>
      </tr>
      <xsl:for-each select="zamestnanci/zamestnanec">
        <tr>
          <td class="border px-4 py-2"><xsl:value-of select="jmeno"/></td>
          <td class="border px-4 py-2"><xsl:value-of select="prijmeni"/></td>
          <td class="border px-4 py-2"><xsl:value-of select="telefon"/></td>
          <td class="border px-4 py-2"><xsl:value-of select="email"/></td>
          <td class="border px-4 py-2"><xsl:value-of select="pozice"/></td>
          <td class="border px-4 py-2">
            <xsl:for-each select="tituly/titul">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </xsl:for-each>
    </table>
    <h4 class="font-semibold mb-2 text-blue-300">Předměty</h4>
    <ul class="list-disc ml-4 mb-4">
      <xsl:for-each select="predmety/predmet">
        <li><xsl:value-of select="nazev"/> - <xsl:value-of select="@zkratka"/>
          <ul class="list-disc ml-4">
            <li><xsl:value-of select="popis"/></li>
          </ul>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>
