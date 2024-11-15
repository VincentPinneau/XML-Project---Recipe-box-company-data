<?xml version="1.0" encoding="UTF-8"?>

<!-- Scenario 2: A client would like to choose an italian recipy, but does not know which one. Therefore we need to create -->
<!-- a synthetic and concise visualization that allows the client to rapidly make an informed decision on which recipe is best suited -->
<!-- for him. -->

<!-- Defines HTML root element and declares XSL namespace -->
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Defines the styling (font-family, font_size, background-color) -->
<body style="font-family:Arial;font-size:12pt;background-color:#EEEEEE">
<!-- We loop inside de RECIPE element that is in RECIPE_BOX_DATABASE/RECIPES -->
<xsl:for-each select="RECIPE_BOX_DATABASE/RECIPES/RECIPE">
  <!-- We filter to only keep italian recipes -->
  <xsl:if test="CATEGORY= ' Recettes italiennes '">
    <!-- We set specific styling conditions for this sub-part -->
	<div style="background-color:#6AB04A;color:white;padding:4px">
		<!-- In this sub-part we give the Recipe Name, the difficulty and the time it takes to prepare the recipe given by the loop -->
		<center>
			<span style="font-weight:bold"><xsl:value-of select="RECIPE_NAME"/></span>
			<p>&#10;</p>
			<xsl:text>Difficulté : </xsl:text>
			<xsl:value-of select="DIFFICULTY"/>
			<p>&#10;</p>
			<!-- For the total time, if it is in hours, present the information in this format: "xx h xx min". Else use this format "xx min" -->
			<xsl:choose>
				<xsl:when test="TOTAL_TIME/HOURS=0">
					<span style="font-style:italic"><xsl:value-of select="TOTAL_TIME/MINUTES"/> min</span>
				</xsl:when>
				<xsl:otherwise>
					<span style="font-style:italic"><xsl:value-of select="TOTAL_TIME/HOURS"/> h <xsl:value-of select="TOTAL_TIME/MINUTES"/> min</span>
				</xsl:otherwise>
			</xsl:choose>
		</center>
    </div>
	<!-- We set specific styling conditions for this sub-part -->
	<div style="margin-left:20px;margin-bottom:1em;font-size:10pt">
		<!-- In this sub-part we give the short description, the calories and the image of the recipe given by the loop -->
		<p>
		<xsl:value-of select="DESCRIPTION"/>
                <p>&#10;</p>
		<span style="font-style:italic"> (<xsl:value-of select="normalize-space(NUTRITIONAL_INFORMATION/CALORIES_kJ)"/> calories par portion)</span>
		</p>
		<center>
		<img src="{IMAGE}" alt="Image" width="506" height="337"/>
		</center>
	</div>
  </xsl:if>
</xsl:for-each>
</body>
</html> 