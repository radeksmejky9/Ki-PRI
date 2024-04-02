<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="kodPredmetu"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Výběr předmětu</title>
        <style type="text/css">
          table {
            border-collapse: collapse;
            margin-bottom: 20px;
            width: 100%;
          }
          th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
          }
          .float-right {
            float: right;
          }
          .btn {
            display: inline-block;
            background-color: #f2f2f2;
            padding: 8px 20px;
            text-align: center;
          }
        </style>
      </head>
      <body>
        <div style="width: 45%; margin: 0 auto;">
          <table>
            <tr>
              <th>ročník</th> 
              <th>semestr</th>
              <th>kód</th>
              <th>předmět</th> 
              <th>kredity</th> 
              <th>vyučující</th>
            </tr>
            <xsl:apply-templates select="//predmet"/>
          </table>
          <a class="btn float-right" href="form-predmet.php">Zpět</a>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="predmet">
    <xsl:if test="@kod = $kodPredmetu">
      <tr>
        <td>
          <xsl:value-of select="../../@cislo"/>
        </td>
        <td>
          <xsl:value-of select="../@nazev"/>
        </td>
        <td>
          <xsl:value-of select="@katedra"/>/<xsl:value-of select="@kod"/>
        </td>
        <td>
          <xsl:value-of select="nazev"/>
        </td>
        <td>
          <xsl:value-of select="kredity"/>
        </td>
        <td>
          <xsl:value-of select="vyucujici"/>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
