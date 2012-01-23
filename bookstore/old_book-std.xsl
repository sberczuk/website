<?xml version="1.0"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	 <xsl:output  method="xhtml" encoding="UTF-8"
	    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
	       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"

		  indent="yes"/>
		  <!-- stylesheet for creating books page -->
		     <xsl:template match="/">
		     <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
		     <head>
		     <xsl:text disable-output-escaping="yes">
		     &lt;!--#set var="pagetitle" value="Recommended Books"--&gt;
		     &lt;!--#set var="page_path" value="HOME"--&gt;
		     </xsl:text>
		     <link rel="stylesheet" type="text/css" 
			   href="../spb_site.css"
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
				 &lt;!--#include virtual="/berczuk_navbar.html"--&gt;
				 </xsl:text>

				 <div class="bodytext">
				 <h1>Some of my favorite books.</h1>
				 <table>
				 <tr>
<td>

<ul>
<li>People &amp; Organizations</li>
<ul>
<li><a href="#CREATE">Creativity</a></li>
<li><a href="#SOLVE">Problem Solving</a></li>
<li><a href="#ORGS">Organizations, Teams, and Management</a></li>
<li><a href="#METHODS">Development Methods and Techniques</a></li>
<li><a href="#TECHSOC">Technology &amp; Society</a></li>
</ul>
<li>Technology</li>
<ul>
<li><a href="#WEB">Web &amp; Internet Development</a></li>
<li><a href="#UML">Unified Modeling Language</a></li>
<li><a href="#SYSTEMS">Building Software Systems</a></li>
<li><a href="#PROG">General Programming</a></li>
</ul>
<li>Patterns</li>
<ul>
<li><a href="#ARCH_PATTERNS">Patterns in Architecture</a></li>
<li><a href="#SW_PATTERNS">Patterns in Software</a></li>
</ul>

</ul>
<center>
 <xsl:text disable-output-escaping="yes">
&lt;!--#include file="AmazonHarryPotter.html"--&gt;
				 </xsl:text>
</center>

 </td>
				 <td>
				 <xsl:text disable-output-escaping="yes">
				 &lt;!--#include file="amazon-1.html"--&gt;
				 </xsl:text>

				 </td>
				 </tr>

				 <tr><td colspan="2" align="center">
				 <xsl:text disable-output-escaping="yes">
				  &lt;!--#config timefmt="%D" --&gt;
				  Last modified on &lt;!--#echo var="LAST_MODIFIED" --&gt;
				  </xsl:text>
 <xsl:text disable-output-escaping="yes">
&amp;nbsp;
</xsl:text>
<a href="about.html" title="about the books page">About this page</a>
				  </td>
				  </tr>
				  </table>
  <h2 id="SOLVE">Solving Problems</h2>
	<dl>	 
<xsl:apply-templates
	select="books/book[categories/category='SOLVE']"/> 
</dl>

<h2 id="METHODS">Developing Software</h2>
<dl>
<xsl:apply-templates select="books/book[categories/category='METHODS']"/>
</dl>
<h2 id="ORGS">Organizations &amp; Management</h2>
<dl>
<xsl:apply-templates select="books/book[categories/category='ORGS']"/>
</dl>

<h2 id="WEB">Web Development</h2>
<dl>						  
     <xsl:apply-templates select="books/book[categories/category='WEB']"/>
</dl>
<h2 id="TECHSOC">Technology &amp; Society</h2>
   <dl>	 <xsl:apply-templates
   select="books/book[categories/category='TECHSOC']"/>
</dl>
<h2 id="CREATE">Creativity</h2>
<dl>	     
<xsl:apply-templates
select="books/book[categories/category='CREATE']"/>
</dl>
<h2 id="SYSTEMS">Software Design</h2>
<dl>	    
<xsl:apply-templates
select="books/book[categories/category='SYSTEMS']"/>
</dl>
 <h2 id="ARCH_PATTERNS">Patterns &amp; Architecture</h2>
<dl>
<xsl:apply-templates
select="books/book[categories/category='ARCH_PATTERNS']"/></dl>

<h2 id="SW_PATTERNS">Patterns &amp; Software</h2>
<dl>										   <xsl:apply-templates select="books/book[categories/category='SW_PATTERNS']"/></dl>


 <h2 id="UML">Unified Modeling Language</h2>
<dl>								  
<xsl:apply-templates select="books/book[categories/category='UML']"/>
</dl>

 <h2 id="PROG">Programming -- General</h2>
<dl>								  
<xsl:apply-templates select="books/book[categories/category='PROG']"/>
</dl>


											  </div>
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


<xsl:template match="title" mode="CrossRef">
 <a href="#{../isbn}" title="Cross Ref to {.}">
 <xsl:apply-templates />
</a>	
</xsl:template>


<xsl:template match="comments">
 <dd>
<!-- put the image link in only if there is a non-empty image URL -->
<xsl:if test="string-length(../imageURL)">
<a href="http://www.amazon.com/exec/obidos/ASIN/{../isbn}/steveberczuk">
										   

<img src="{../imageURL}" border="0" alt="cover" hspace="3" vspace="3" align="left" />
     </a>
</xsl:if>

     <xsl:apply-templates  />
<br clear="left"/><xsl:apply-templates select="../seeAlso" /> 
</dd>
	  <br clear="left" />
	     </xsl:template>



<xsl:template match="seeAlso">
<b>Related books</b>
  <xsl:for-each select="isbn">

<!-- need to do the for each so that we can select current() -->
<ul>
 <xsl:for-each select="//books/book[isbn=current()]">
  <xsl:apply-templates select="current()" mode="CrossRef"/>

 </xsl:for-each>
</ul>
 </xsl:for-each>


</xsl:template>

<xsl:template match="book" mode="CrossRef">

<li>
    <xsl:apply-templates select="title" mode="CrossRef" /> 
</li>

</xsl:template>

     </xsl:stylesheet>

