<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Specifies the output method as HTML with indentation -->
  <xsl:output method="html" indent="yes"/>

  <!-- Template for matching the root node -->
  <xsl:template match="/">
    <!-- HTML document starts here -->
    <html>
      <head>
        <!-- Meta tags -->
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <!-- Title of the HTML document -->
        <title>Recipes for Lazy People</title>
        <!-- Internal CSS styles -->
        <style>
          body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 20px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
          }

          p {
            color: #666;
          }

          table {
            width: 100%;
            border-collapse: collapse;
          }

          th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
          }

          th {
            background-color: #9acd32;
          }
        </style>
      </head>
      <body>
        <!-- Title of the page -->
        <h2>Recipes for Lazy People!</h2>

        <!-- Loop through each "RECIPE" element under "RECIPES" -->
        <xsl:for-each select="RECIPE_BOX_DATABASE/RECIPES/RECIPE">
          <!-- Check if the difficulty is ' Facile ' -->
          <xsl:if test="DIFFICULTY=' Facile '">
            <!-- Start of a table row -->
            <tr>
              <!-- Table cell for recipe name -->
              <td>
                <p><xsl:value-of select="RECIPE_NAME"/></p>
              </td>
              <!-- Table cell for description -->
              <td>
                <p><xsl:value-of select="DESCRIPTION"/></p>
              </td>
              <!-- Table cell for total time required -->
              <td>
                <p>Time Required:<xsl:value-of select="TOTAL_TIME"/></p>
              </td>
              <!-- Table cell for cooking instructions -->
              <td>
                <p><xsl:value-of select="COOKING_INSTRUCTIONS"/></p>
              </td>
            </tr>
          </xsl:if>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

<!-- The following xslt shows recipes with an easy difficulty level -->