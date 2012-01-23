<?xml version="1.0"?>
<!-- stylesheet to create shell script for book subpages -->

	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	 <xsl:output  method="xml" encoding="UTF-8" omit-xml-declaration="yes"
		  indent="yes"/>
		  <!-- stylesheet for creating script to generate books sub pages page -->

<xsl:template match="/">

<project name="buildSubPages"
         default="makeScript" basedir=".">

<target name="makeScript">
    <xsl:apply-templates select="/categories/category"/>
</target>

<!-- make a target that deletes the generated files
<target name="clean">
</target>
-->
</project>
</xsl:template>

<xsl:template match="category">
<style basedir="." destdir="." in="books.xml" out="{code}.html" force="true"
	style="book-std.xsl">
       <param name="whichCategory" expression="{code}"/>
 </style>

</xsl:template>

</xsl:stylesheet>

