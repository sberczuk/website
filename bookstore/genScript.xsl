<?xml version="1.0"?>
<!-- stylesheet to create shell script for book subpages -->

	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	 <xsl:output  method="text" encoding="UTF-8"
	    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
	       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"

		  indent="yes"/>
		  <!-- stylesheet for creating books page -->

<xsl:template match="/">
<xsl:apply-templates select="/categories/category/"/>
</xsl:template>

<xsl:template match="category">
java org.apache.xalan.xslt.Process -IN books.xml -XSL book-std.xsl -out <xsl:value-of select="code"/>.html -param whichCategory <xsl:value-of select="code"/>

</xsl:template>
</xsl:stylesheet>

