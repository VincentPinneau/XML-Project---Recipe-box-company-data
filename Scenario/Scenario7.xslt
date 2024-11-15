<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Specifies the output method as plain text -->
  <xsl:output method="text"/>

  <!-- Template for matching the root element "RECIPE_BOX_DATABASE" -->
  <xsl:template match="RECIPE_BOX_DATABASE">
    {
      "average_prices": {
        <!-- Applies templates to each "RECIPE" element under "RECIPES" -->
        <xsl:apply-templates select="RECIPES/RECIPE"/>
      }
    }
  </xsl:template>

  <!-- Template for matching "RECIPE" elements with a unique category -->
  <xsl:template match="RECIPE[not(CATEGORY = preceding-sibling::RECIPE/CATEGORY)]">
    "<xsl:value-of select="CATEGORY"/>": {
      <!-- Calculates and formats the average price for the category -->
      "average_price": <xsl:value-of select="format-number(avg(../RECIPE[CATEGORY = current()/CATEGORY]/UNIT_PRICE/VALUE), '#.##')"/>,
      <!-- Retrieves the currency for the category -->
      "currency": "<xsl:value-of select="../RECIPE[CATEGORY = current()/CATEGORY][1]/UNIT_PRICE/CURRENCY"/>"
    },
  </xsl:template>

  <!-- Template for matching all other "RECIPE" elements -->
  <xsl:template match="RECIPE"/>

</xsl:stylesheet>

<!-- The following xslt calculates the average price for each recipe category and gives a json file as output -->
