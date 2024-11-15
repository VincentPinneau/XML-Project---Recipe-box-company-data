<?xml version="1.0" encoding="UTF-8"?>
<!-- XML declaration specifying the version and encoding of the document -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- XSLT stylesheet declaration with version and namespace -->

  <xsl:output method="text" />
  <!-- Specifies that the output method for the transformation result will be text -->

  <xsl:template match="/">
    <!-- Start of the template that matches the root node of the XML document -->
    
    <xsl:text>&lt;svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 600"&gt;&#10;</xsl:text>
    <!-- Outputs the opening SVG tag with the specified namespace and viewBox -->

    <!-- Start of the for-each loop iterating over each "DELIVERY_ADDRESS" element -->
    <xsl:for-each select="//DELIVERY_ADDRESS">
      
      <!-- Outputs the opening tag for a rectangle with attributes for positioning and styling -->
      <xsl:text>&lt;rect x="50" y="</xsl:text>
      <xsl:value-of select="number(position()) * 100" />
      <xsl:text>" width="500" height="50" fill="lightblue" /&gt;&#10;</xsl:text>

      <!-- Outputs the opening tag for a text element with attributes for positioning and styling -->
      <xsl:text>&lt;text x="60" y="</xsl:text>
      <xsl:value-of select="number(position()) * 100 + 30" />
      <xsl:text>" font-family="Arial" font-size="14" fill="black"&gt;Delivery address order </xsl:text>
      <xsl:value-of select="position()" />
      <!-- Outputs the details of the delivery address -->
      <xsl:text>: </xsl:text>
      <xsl:value-of select="ADDRESS_NUMBER" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="ROAD" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="CITY" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="POSTAL_CODE" />
      <!-- Outputs the closing tag for the text element -->
      <xsl:text>&lt;/text&gt;&#10;</xsl:text>

    </xsl:for-each>
    <!-- End of the for-each loop -->

    <!-- Outputs the closing SVG tag -->
    <xsl:text>&lt;/svg&gt;&#10;</xsl:text>

  </xsl:template>
  <!-- End of the template -->

</xsl:stylesheet>
<!-- End of the XSLT stylesheet -->
