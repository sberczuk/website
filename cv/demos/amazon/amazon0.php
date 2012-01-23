<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd ">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<!-- Time-stamp: "2003-03-06 15:30:40 default@OZCHECK" -->
<!--#set var="page_path" value="HOME-RESUME-DEMOS"-->
<!--#set var="pagetitle" value="Amazon Web Services Demo"-->
<?php apache_setenv("page_path", "HOME-RESUME-DEMOS");
  apache_setenv("pagetitle", "Amazon Web Services Demo");
?>
<title>Amazon Web Services Demo</title>

<link rel="stylesheet" type="text/css"  href="/spb_site.css"     title="Steve B Style Sheet"/>
<meta name="keywords" content="Keywords"/>
<meta name="description" content="Technologies that I have worked with"/>
</head>

<!--#include virtual="/berczuk_navbar.html"-->
<body>
<?php
$categoriesConfigFile = "/bookstore/categories.xml";
$inCategory = FALSE;
$inCode = FALSE;
$inDescription = FALSE;
$currentCode ="";
$currentDescr="";
$categoryOptions="";

$errorMessage = "ERROR: ";

function startElement($parser, $name, $attribs ){
	global $inCategory, $inCode, $inDescription, $currentCode, $currentDescription;
	//	echo "starting [" . $name ."]<br/>";
	if($name == "category"){
		$inCategory = TRUE;
		$currentCode = "";
		$currentDescription = "";
	} elseif($name == "code"){
		$inCode = TRUE;
		
	} elseif($name == "description"){
		$inDescription = TRUE;
	}
	//  echo "StartEl>>inCat [" . $inCategory ." ]inCode [" . $inCode . "] inDescription [" . $inDescription ."]<br/>";
}

function endElement($parser, $name ){
  global $inCategory, $inCode, $inDescription;
  global $currentCode, $currentDescription, $currentOptions;
	if($name == "category"){
		$inCategory = FALSE;
		$currentCode = trim($currentCode);
		$currentDescription = trim($currentDescription);
		//		echo "currCode [" .  $currentCode ."]";
		$currentOptions .= "\n<option value='$currentCode'>$currentDescription</option>";
		//		echo "<b>end  $currentOptions </b><br/>";
	} elseif($name == "code"){
		$inCode = FALSE;
	
	}elseif($name == "description"){
		$inDescription = FALSE;

	}
	//  echo "EndEL >>inCat [" . $inCategory ." ]inCode [" . $inCode . "] inDescription [" . $inDescription ."]<br/>";
}

function characters ( $parser, $data){

  global $inCategory, $inCode, $inDescription;
  global $currentCode, $currentDescription;
  //  echo "===Characters >>inCat [" . $inCategory ." ]inCode [" . $inCode . "] inDescription [" . $inDescription ."]<br/>";	
  //		echo "inCode " . $inCode ." II data is " . $data . "<br/>";
	if($inCategory){

	} 
	if ($inCode){
		$currentCode .= $data;
		//	echo "current code is " . $currentCode . " inCode = ".$inCode . "<br/>";
	}elseif ($inDescription){
		$currentDescription .= $data;
	}

	
}

// set up the XML parser to read the category file
$parser = xml_parser_create ("UTF-8");
xml_parser_set_option ($parser, XML_OPTION_CASE_FOLDING, FALSE);
xml_set_element_handler ($parser, startElement, endElement);
xml_set_character_data_handler($parser, characters);


$handle = fopen("http://www.berczuk.com/bookstore/categories.xml", "r");
$contents = "";
while ($data =fgets($handle,1024)){

 $contents .= $data;
}
//xml_parse($parser, $contents);
// parse characters.xml file!!
xml_parse($parser, $contents);
xml_parser_free($parser);

?>




<?php 
 
  virtual("/berczuk_navbar.html") ?>
<div class="bodytext">
<h1><!--#echo var="pagetitle"--></h1>
<p>This page is an example of using the Amazon.com web services API
(XML over HTTP) to get information about a book to add it to my
<a href="/bookstore/">Book Recommendations Page</a>. To try it, type
in an ISBN in the form. (There is a valid ISBN in the form by-default.)</p>
<form action="amazon.php" method="POST">
 ISBN To Find: <input type="text" name="isbn" value="0201741172" />
<br/>
Categories to set for book:
<select name="category[]" size="8" multiple>
<?php echo $currentOptions ?>
</select>

 <input type="submit">
</form>
 <hr/>
<p>This page works as follows:</p>

<ul>
<li>The page is an HTML form.</li>
<li>Submitting the form activates a PHP Script.</li>

<li>The PHP script parses the form input and execs a Java process that
makes the request from amazon and returns an XML response containing
the an the URL of the image file for the book cover and a snippet of
XML that I can use to add an entry to the book recommedations page.</li>
<li>The PHP script parses the XML, checks for error messages, and
creates the final page.</li>


</ul>

<p>Note that there are a few other ways to do this:</p>
<ul>
<li>Entirely in PHP.</li>
<li>Using the Amazon.com SOAP API.</li>
</ul>
</body>
</html>
