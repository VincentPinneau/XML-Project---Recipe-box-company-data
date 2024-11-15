<?xml version="1.0" encoding="UTF-8"?>

<!-- Scenario 4: The delivery department head want to know in how many delivery each delivery person is involve to see how to balance the load.-->

<!-- Declares an XSLT stylesheet and declares XSL namespace -->
<!-- XSLT stylesheet version 1.0 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Define the output method as HTML and specify indentation -->
    <xsl:output method="html" indent="yes"/>
    
    <!-- Main template, matches the root node -->
    <xsl:template match="/">
        <html>
            <head>
                <!-- Set the title of the HTML page -->
                <title>Number of orders by each delivery person</title>
                <!-- Define some CSS styles -->
                <style>
                    table {
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid black;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #738bE7;
                    }
                </style>
            </head>
            <body>
                <!-- Heading of the HTML page -->
                <h2>Number of orders by each delivery person</h2>
                <!-- Start of the table -->
                <table>
                    <tr>
                        <!-- Table header -->
                        <th>Delivery Person</th>
                        <th>Number of Orders</th>
                    </tr>
                    <!-- Loop through each delivery person -->
                    <xsl:for-each select="/RECIPE_BOX_DATABASE/DELIVERY_EMPLOYEES/DELIVERY_EMPLOYEE">
                        <!-- Get the ID and name of the delivery person -->
                        <xsl:variable name="personId" select="@idd"/>
                        <xsl:variable name="personName" select="concat(FULL_NAME/FORENAME, ' ', FULL_NAME/NAME)"/>
                        <!-- Calculate the number of deliveries made by this person -->
                        <xsl:variable name="personCount">
                            <xsl:value-of select="count(/RECIPE_BOX_DATABASE/ORDERS/ORDER[@iddref = $personId])"/>
                        </xsl:variable>
                        <!-- Output the result as a table row -->
                        <tr>
                            <td><xsl:value-of select="$personName"/></td>
                            <td><xsl:value-of select="$personCount"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
