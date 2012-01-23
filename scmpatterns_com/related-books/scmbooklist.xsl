<?xml version="1.0"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	 <xsl:output  method="html" encoding="UTF-8"
	    doctype-public= "-//W3C//DTD XHTML 1.0 Transitional//EN"
	       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
	       indent="yes"/>

		  <!-- stylesheet for creating books page -->
<xsl:template name="apache_ssi">
<xsl:param name="directive">variable</xsl:param>
<xsl:comment><xsl:value-of select="$directive"/></xsl:comment>
</xsl:template>

<!-- This stylesheet uses categories.xml to get the titles for all of -->
<!--  the category sections -->

		     <xsl:template match="/">
		     <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
		     <head>
		     <xsl:text disable-output-escaping="yes">
		     &lt;!--#set var="pagetitle" value="Related Books"--&gt;
		     &lt;!--#set var="page_path" value="SCMHOME-BOOKSTORE"--&gt;
		     </xsl:text>
		     <link rel="stylesheet" type="text/css" 
			   href="/scm_site.css"
				 title="Steve B Style Sheet"/>

				 <base target="_top"/> 


				 <title>
				 <xsl:text disable-output-escaping="yes">
				 &lt;!--#echo var="pagetitle"--&gt;
				 </xsl:text>
				 </title>

				 </head>

				 <body>
				 <xsl:text disable-output-escaping="yes">
				 &lt;!--#include virtual="/scm_navbar.html"--&gt;
				 </xsl:text>
<div class="bodytext">
			



<h1>
<xsl:text disable-output-escaping="yes">
				 &lt;!--#echo var="pagetitle"--&gt;
				 </xsl:text>
</h1>

<center>
 <xsl:text disable-output-escaping="yes">
&lt;a
href="http://www.amazon.com/exec/obidos/redirect?tag=steveberczuk&amp;path=subst/home/home.html"
title="Amazon.com Associate" &gt;&lt;img src="images/a150X70b.gif" border="0"&gt;&lt;/a&gt;
</xsl:text>
<p>This page contains a selection of books that we have found useful
in learning about and implementing software configuration management
in an agile environment. You can buy these books from amazon.com
through this page. We think that these books are worth reading and
owning even if you prefer to purchase them from another bookseller.</p>
<p><xsl:call-template name="apache_ssi">
<xsl:with-param name="directive">#config timefmt="%B %e, %Y"</xsl:with-param>
</xsl:call-template>
Last modified on  
<xsl:call-template name="apache_ssi"><xsl:with-param name="directive">#echo var="LAST_MODIFIED"</xsl:with-param>
</xsl:call-template>
</p>
</center>
<table>
<tr>
<td colspan="3">
 You may also be interested in this <a
 href="http://www.berczuk.com/bookstore/">list of books</a> on other
 software development topics.
</td>
</tr>
<tr><td colspan="2"><h2>SCM Techniques</h2></td></tr>
  <xsl:apply-templates
	select="/books/book[categories/category='SCM']"/>

<tr><td colspan="2"><h2>Related Areas (Architecture, Process)</h2></td></tr>
<xsl:apply-templates
	select="/books/book[categories/category='SYSTEMS'][@scmsite='yes']"/>

</table>
</div>
 </body>
</html>
											     </xsl:template>

<xsl:template match="book">

	<tr>
        <td valign="top">

<!-- put the image link in only if there is a non-empty image URL -->
<xsl:if test="string-length(imageURL)">
<a href="http://www.amazon.com/exec/obidos/ASIN/{isbn}/steveberczuk">
<img src="http://www.berczuk.com/bookstore/{imageURL}" border="0" alt="cover" hspace="3" vspace="3" align="left" />
     </a>
</xsl:if>
</td>
		<td valign="top">										      

<xsl:apply-templates select="title" /> by <xsl:value-of
select="authors" />. 
														  
		<xsl:apply-templates select="comments" />
 </td>
<td>

<form method="POST" action="http://buybox.amazon.com/o/dt/assoc/handle-buy-box={isbn}">
<input type="hidden" name="asin.{isbn}" value="1"/>
<input type="hidden" name="tag-value" value="steveberczuk"/>
<input type="hidden" name="tag_value" value="steveberczuk"/>
<input type="image" name="submit.add-to-cart" value="Buy from Amazon.com" border="0" alt="Buy from Amazon.com" src="http://rcm-images.amazon.com/images/G/01/associates/add-to-cart.gif"/>
</form>


</td>
</tr>

</xsl:template>

<xsl:template match="title">
 <a href="http://www.amazon.com/exec/obidos/ASIN/{../isbn}/steveberczuk"
title="{.}" id="{../isbn}">
 <xsl:apply-templates />
</a>	
</xsl:template>


<xsl:template match="seeAlso">
<!-- EMPTY -->
</xsl:template>

<xsl:template match="title" mode="CrossRef">
 <a href="#{../isbn}" title="Cross Ref to {.}">
 <xsl:apply-templates />
</a>	
</xsl:template>


<xsl:template match="comments">


     <xsl:apply-templates  />
<br clear="left"/>

	  <br clear="left" />
	     </xsl:template>






</xsl:stylesheet>

