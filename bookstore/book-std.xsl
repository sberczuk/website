<?xml version="1.0"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml">

<xsl:include href="book-lib.xsl"/>

	 <xsl:output  method="html" encoding="UTF-8"
	    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
	       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"

		  indent="yes"/>
		  <!-- stylesheet for creating books page -->



<!-- param for selecting which categories to process -->
<xsl:param name="whichCategory"></xsl:param>



<!-- This stylesheet uses categories.xml to get the titles for all of -->
<!--  the category sections -->

		     <xsl:template match="/">
		     <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

	<xsl:call-template name="page_head"/>

				 <body>
	<xsl:call-template name="apache_ssi">
		<xsl:with-param name="directive">#include virtual="/berczuk_navbar.html"</xsl:with-param>
</xsl:call-template>

<script language="JavaScript">
<xsl:text disable-output-escaping="yes">
function popUp(URL,NAME) {
amznwin=window.open(URL,NAME,'location=yes,scrollbars=yes,status=yes,toolbar=yes,resizable=yes,width=380,height=450,screenX=10,screenY=10,top=10,left=10');
amznwin.focus();}

</xsl:text>
</script>

				 <div class="bodytext">


<xsl:choose>
  <xsl:when test="not($whichCategory)">
<h1>Recommended Books</h1>
 </xsl:when>
<xsl:otherwise>
<h1> Recommendations: <xsl:value-of
select="document('categories.xml')/categories/category[code=$whichCategory]/description"/>
</h1>
</xsl:otherwise>
</xsl:choose>
				 <table>
				 <tr>
<td valign="top">
<xsl:call-template name="category_menu"/>


 </td>
				 <td valign="top">

<xsl:call-template name="apache_ssi">
<xsl:with-param name="directive">#include file="amazon-2.html"</xsl:with-param>
</xsl:call-template>
		

				 </td>
				 </tr>

				 <tr><td colspan="2" align="center">
<small><xsl:call-template name="page_timestamp"/>
 <xsl:text disable-output-escaping="yes">
&amp;nbsp;
</xsl:text>
<a href="about.html" title="about the books page">About this page</a>
</small>
				  </td>
				  </tr>
				  </table>

<!-- generate page per category -->
<xsl:choose>
  <xsl:when test="not($whichCategory)">
<h2>All Books</h2>

<dl>
<xsl:apply-templates	select="/books/book"/>
<!-- TO-DO make it so only the FIRST rendering of a book has an ID -->
</dl>

</xsl:when>
<xsl:otherwise>
 <xsl:apply-templates select="document('categories.xml')/categories/category[code=$whichCategory]" 
 mode="heading"/>
<xsl:apply-templates
	select="document('books.xml')/books/book[categories/category=$whichCategory]"/>

</xsl:otherwise>
</xsl:choose>

											  </div>
											  
	<script type="text/javascript" src="http://www.assoc-amazon.com/s/link-enhancer?tag=steveberczuk&amp;o=1">
</script>
<noscript>
    <img src="http://www.assoc-amazon.com/s/noscript?tag=steveberczuk" alt="" />
</noscript>

											  </body>
											  </html>
											     </xsl:template>


	<xsl:template match="book">
												      <dt>

<xsl:apply-templates select="title" /> by <xsl:value-of select="authors" />
														  </dt>
		<xsl:apply-templates select="comments" />
 

</xsl:template>

<xsl:template match="title">
 <a href="http://www.amazon.com/exec/obidos/ASIN/{../isbn}/steveberczuk"
title="{.}" id="{../isbn}">
 <xsl:apply-templates />
</a>	
</xsl:template>



<xsl:template match="comments">
 <dd>
<!-- put the image link in only if there is a non-empty image URL -->
<xsl:if test="string-length(../imageURL)">
<a href="http://www.amazon.com/exec/obidos/ASIN/{../isbn}/steveberczuk">
										   

<img src="{../imageURL}" border="0" alt="{../title}" hspace="4" vspace="3" align="left" />
     </a>
</xsl:if>


     <xsl:apply-templates  /><br/>


<br clear="left"/><xsl:apply-templates select="../seeAlso" /> 
</dd>
	  <br clear="left" />
	     </xsl:template>



<xsl:template match="seeAlso">
<b>Related books</b>
<ul>
  <xsl:for-each select="isbn">
<!-- need to do the for each so that we can select current() -->
 <xsl:for-each select="//books/book[isbn=current()]">
  <xsl:apply-templates select="current()" mode="CrossRef"/>
 </xsl:for-each>
</xsl:for-each>
</ul>
</xsl:template>



</xsl:stylesheet>

