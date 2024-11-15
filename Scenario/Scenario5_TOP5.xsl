<?xml version="1.0" encoding="UTF-8"?>
<!-- Scenario 5 : The business team would like to know the receipe whose are the most demand may be to predict her command , to make promotions campaign.
The customer also would like to know, if they don't know which receipe take. It can help them in their choice-->  
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes"/>

  <!-- Creating a key to index RECIPE_CHOICE elements by their idrref attribute -->
  <xsl:key name="recipe-by-id" match="RECIPE_CHOICE" use="@idrref"/>

  <xsl:template match="/RECIPE_BOX_DATABASE">
    <html>
      <body>
        <h2>Top 5 Recipe Choices</h2>
        <table border="1">
          <tr>
            <th>Rank</th>
            <th>Recipe Name</th>
            <th>Quantity</th>
          </tr>
          <!-- Creating a loop to iterate through unique RECIPE_CHOICE elements -->
          <xsl:for-each select="//RECIPE_CHOICE[generate-id() = generate-id(key('recipe-by-id', @idrref)[1])]">
            <!-- Sorting by the count of occurrences of each recipe choice -->
            <xsl:sort select="count(key('recipe-by-id', @idrref))" order="descending"/>
            <!-- Checking if the current position is less than or equal to 5 -->
            <xsl:if test="position() &lt;= 5">
              <!-- Defining a variable to store the count of occurrences of the current recipe -->
              <xsl:variable name="qty" select="count(key('recipe-by-id', @idrref))"/>
              <!-- Starting a row of the table -->
              <tr>
                <!-- Displaying the current position (rank) in the table -->
                <td>
                  <xsl:value-of select="position()"/>
                </td>
                <!-- Displaying the recipe name corresponding to the current recipe ID -->
                <td>
                  <xsl:value-of select="//RECIPES/RECIPE[@idr=current()/@idrref]/RECIPE_NAME"/>
                </td>
                <!-- Displaying the quantity of this recipe (number of occurrences) -->
                <td>
                  <xsl:value-of select="$qty"/>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
