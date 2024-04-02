<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Výběr předmětu</title>
        <style type="text/css">
          body {
            text-align: center;
          }
          form {
            margin: 20px auto;
            width: 30%;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
          }
          label{
            font-size: 20px;
          }
          select, input[type="submit"] {
            padding: 8px;
            width: 100%;
            margin-bottom: 10px;
            font-size: 15px;
          }
          input {
            background-color: #f2f2f2;
            border: 1px solid;
          }
        </style>
      </head>
      <body>
        <div>
          <form action="form-predmet.php" method="get">
            <label for="predmet">Výběr předmětu</label>
            <select id="predmet" name="predmet">
              <xsl:for-each select="studium/rocnik/semestr/predmet">
                <option value="{@kod}">
                  <xsl:value-of select="nazev"/>
                </option>
              </xsl:for-each>
            </select>
            <input type="submit" value="Vybrat"/>
          </form>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
