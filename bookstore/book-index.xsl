<?xml version="1.0"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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


<!-- Page Title should be category name -->
				 <table>
<tr>
<td><h1>Some Of My Favorite Books</h1></td>
<td align="right"><a>
<xsl:attribute name="href">
<xsl:text disable-output-escaping="yes">
http://www.amazon.com/exec/obidos/redirect?tag=steveberczuk&amp;path=subst/home/home.html
</xsl:text>
</xsl:attribute><img src="a130X60b.gif" border="0"/></a></td>

</tr>
				 <tr><td colspan="3" align="center">
<small>
<xsl:call-template name="page_timestamp"/>
 <xsl:text disable-output-escaping="yes">
&amp;nbsp;
</xsl:text>
<a href="about.html" title="about the books page">About this page</a></small>
				  </td>
				  </tr>
				 <tr>
<td valign="top">
<xsl:call-template name="category_menu"/>

<ul>
<li><a href="#BOOKSHELF">Suggested Collections.</a></li>
</ul>
 </td>
				 <td valign="top" colspan="2">

<xsl:call-template name="apache_ssi">
<xsl:with-param name="directive">#include file="amazon-2.html"</xsl:with-param>
</xsl:call-template>
				

				 </td>
				 </tr>
<tr>
<td><h2>Recent Additions</h2>
<p>Books that I reviewed recently.</p>
 <xsl:apply-templates mode="bookshelf"
	select="document('books.xml')/books/book[@status='new']"/>
</td>
</tr>
<tr><td >
<h2 id="BOOKSHELF">Suggestions</h2>
<p>Suggested collections of 6 or fewer books that fit together.</p>
<xsl:apply-templates select="document('bookshelves.xml')/bookshelves"/>

</td></tr>
  </table>

</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

