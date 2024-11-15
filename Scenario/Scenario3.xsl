<?xml version="1.0" encoding="UTF-8"?>

<!-- Scenario 3: The marketing team would like to know if some clients have given 5 stars to recipes, to be able to put these -->
<!-- recipes forward, the next time they do a promotion campaign. Also, link the recipes to the client that gave the 5 stars so -->
<!-- that the marketing team can taylor the promotion campaign to each client. -->

<!-- Declares an XSLT stylesheet and declares XSL namespace -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Asks the output to be in the HTML format -->
    <xsl:output method="html" encoding="UTF-8"/>
    <!-- Matches the root element of the XML file we want to transform -->
    <xsl:template match="/">
        <html>
            <body>
				<!-- Text giving some context about the information that is given -->
                <h1>Voici une liste montrant les coups de coeurs de nos clients:</h1>
				<p><em>Uniquement les recettes ayant reçu la note maximale de 5 sont affichées.</em></p>
				<!-- We loop inside de CUSTOMER element that is in RECIPE_BOX_DATABASE/CUSTOMERS -->
                <xsl:for-each select="RECIPE_BOX_DATABASE/CUSTOMERS/CUSTOMER">
					<!-- We take the attribute of the CUSTOMER element that is currently in the loop and make it a variable named customerId -->
                    <xsl:variable name="customerId" select="@idc"/>
					<!-- If the customer has left a review where he gives 5 stars, we give his name -->
                    <xsl:if test="//REVIEW[@idccref=$customerId]/STARS = 5">
                        <p>
                            <xsl:value-of select="FULL_NAME/FORENAME"/>
							<xsl:value-of select="FULL_NAME/NAME"/> : 
                            <ul>
								<!-- We loop inside the REVIEWS that a client has given and that have 5 stars -->
                                <xsl:for-each select="//REVIEW[@idccref=$customerId and STARS = 5]">
									<!-- We take the attribute of the REVIEW element that is currently in the loop and make it a variable named ref_recipeId -->
                                    <xsl:variable name="ref_recipeId" select="@idrrref"/>
									<!-- If the attribute of a RECIPE matches the variable we just created, give the recipe name underneath the clients name -->
                                    <li><xsl:value-of select="//RECIPE[@idr=$ref_recipeId]/RECIPE_NAME"/></li>
                                </xsl:for-each>
                            </ul>
                        </p>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>