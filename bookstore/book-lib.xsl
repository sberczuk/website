<?xml version="1.0"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="apache_ssi">
<xsl:param name="directive">variable</xsl:param>
<xsl:comment><xsl:value-of select="$directive"/></xsl:comment>
</xsl:template>


<xsl:template name="page_timestamp">
<xsl:call-template name="apache_ssi">
<xsl:with-param name="directive">#config timefmt="%B %e, %Y"</xsl:with-param>
</xsl:call-template>
Last modified on  
<xsl:call-template name="apache_ssi"><xsl:with-param name="directive">#echo var="LAST_MODIFIED"</xsl:with-param>
</xsl:call-template>

</xsl:template>

<xsl:template name="page_head">
		    <head>

<xsl:call-template name="apache_ssi">
		<xsl:with-param name="directive">#set var="page_path" value="HOME-BOOKSTORE"</xsl:with-param>
</xsl:call-template>

		     <link rel="stylesheet" type="text/css" 
			   href="../spb_site.css"
				 title="Steve B Style Sheet"/>

				 <base target="_top"/> 
<!-- insert page title here -->

<xsl:variable name="titleDirective" >
<xsl:text>#set var="pagetitle" value="</xsl:text>
<xsl:if test="not($whichCategory)"><xsl:text>Index to Book Recommendations</xsl:text></xsl:if>
<xsl:if test="$whichCategory">

<xsl:value-of
select="document('categories.xml')/categories/category[code=$whichCategory]/description"/>
</xsl:if>
<xsl:text>"</xsl:text>

</xsl:variable>

<xsl:comment>category info <xsl:value-of select="$whichCategory"/>  <xsl:value-of select="$titleDirective"/></xsl:comment>
<xsl:call-template name="apache_ssi">
		<xsl:with-param name="directive"><xsl:value-of select="$titleDirective"/></xsl:with-param>
</xsl:call-template>

<title><xsl:call-template name="apache_ssi">
		<xsl:with-param name="directive">#echo var="pagetitle"</xsl:with-param>
				</xsl:call-template></title>



				 </head>
</xsl:template>
<xsl:template match="a">
	<xsl:copy-of select="."/>
</xsl:template>

<!-- The following template formats category from the categories.xml file -->
<xsl:template match="category">
	<li><a href="{code}.html"><xsl:value-of select="description" /></a></li>   
</xsl:template>

<xsl:template match="category" mode="title">
	<title>Recommended Books: <xsl:value-of select="description" /></title>	  
</xsl:template>

<xsl:template match="category" mode="heading">
	<h2><xsl:value-of select="description" /></h2>	 
</xsl:template>


<xsl:template name="category_menu">

<!-- build the index using the categories file. Perhaps group them? -->
<small>
<ul>
<li><a href="all.html">All Recommended Books</a></li>
<li>View By Category</li>



<ul>
     <xsl:apply-templates select="document('categories.xml')/categories/category" />
</ul>
</ul>

</small>

</xsl:template>

<xsl:template match="book" mode="CrossRef">
<li>
    <xsl:apply-templates select="title" mode="CrossRef" /> 
</li>
</xsl:template>


<xsl:template match="title" mode="CrossRef">
 <a href="all.html#{../isbn}" title="Cross Ref to {.}">
 <xsl:apply-templates />
</a>	
</xsl:template>


<xsl:template match="book" mode="bookshelf">

 <a href="all.html#{isbn}" title="{title}"><img
 src="{imageURL}" border="0" alt="{title}" hspace="7" vspace="3"
 align="left" /></a>
<!--
<p>
<small>
<xsl:apply-templates select="title" mode="CrossRef"/></small> </p>
-->
</xsl:template>

<xsl:template match="isbnlist">

 <xsl:for-each select="isbn">
<!-- need to do the for each so that we can select current() -->
 <xsl:for-each select="document('books.xml')//books/book[isbn=current()]">
  <xsl:apply-templates select="current()" mode="bookshelf"/>
 </xsl:for-each>
 </xsl:for-each>

</xsl:template>

<xsl:template match="bookshelves">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="bookshelf">
<tr><td colspan="3">
<h3><xsl:value-of select="name"/>: 
<xsl:value-of select="description"/>
</h3>
<xsl:apply-templates select="isbnlist"/>
</td></tr>
</xsl:template>
</xsl:stylesheet>
