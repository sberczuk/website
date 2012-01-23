<html>
<head>
<link rel="stylesheet" type="text/css"  href="/spb_site.css"     
	title="Steve B Style Sheet"/>

<title>Result data</title>
</head>
<?php
$inImage = FALSE;
$hasError = FALSE;
$imageURL = "";
$errorMessage = "ERROR: ";

function startElement($parser, $name, $attribs ){
	global $inImage, $imageURL, $hasError;
	if($name == "imageAmazonURL"){
		$inImage = TRUE;
	} elseif ($name == "errorMsg"){
		$hasError = TRUE;
	}
}

function endElement($parser, $name ){
	global $inImage, $imageURL;
	if($name == "imageAmazonURL"){
		$inImage = FALSE;
	}

}

function characters ( $parser, $data){

	global $inImage, $imageURL, $hasError, $errorMessage;
      if($inImage == TRUE) {
		$imageURL .= $data;
	} elseif($hasError){
		$errorMessage .= $data;
	}

}
?>


<?php
$isbn = $_POST['isbn'];
$categories = $_POST['category'];

$command = "./amazon.sh ". $isbn;
//echo "got" . count($categories) . " categories";
$categoryList = "";
if($categories != ""){
$i = 0;
foreach ($categories as $cat){
  $categoryList .=  $cat;
  if($i < count($categories) - 1){
    $categoryList .= ",";
  }
  $i++; 
}
 $command = "./amazon.sh $isbn $categoryList"; 
}


// we can just use 'system' since we're not communicating with the process
// but popen and read from the pipe worked well.

$handle = popen($command, "r");
$contents = "";
while ($data =fgets($handle,1024)){

 $contents .= $data;
}

//$contents =  system($command);;

$pos = strpos($contents, "<book>");



if ($pos === false) { // note: three equal signs
    // not found...
}
$header = substr($contents, 0, $pos);
$body = substr($contents, $pos );


// set up the XML parser to read the header info with the image URL
// this is sort of overkill, but it does allow for some flexibility
$parser = xml_parser_create ("UTF-8");
xml_parser_set_option ($parser, XML_OPTION_CASE_FOLDING, FALSE);
xml_set_element_handler ($parser, startElement, endElement);
xml_set_character_data_handler($parser, characters);


//xml_parse($parser, $contents);
xml_parse($parser, $header);
xml_parser_free($parser);

$parser2 = xml_parser_create ("UTF-8");
xml_parser_set_option ($parser2, XML_OPTION_CASE_FOLDING, FALSE);
xml_set_element_handler ($parser2, startElement, endElement);
xml_set_character_data_handler($parser2, characters);
xml_parse($parser2, $body);


// check for error message in Body
xml_parser_free($parser2);


?>


<body>
<?php 
  apache_setenv("page_path", "HOME-RESUME-DEMOS");
  apache_setenv("pagetitle", "Amazon Web Services Demo Results");
  virtual("/berczuk_navbar.html") ?>
<div class="bodytext">
<h1>Amazon Web Services Query Result</h1>
<p>You asked for ISBN: 
<?php echo $_POST['isbn'] ?>
</p>

<?php  
if($hasError){
 
?>
 <center><p><b>There was an error from the Amazon Web Service:</b>
<?php echo $errorMessage; ?>
<br/>Please try again.</p>
</center>

<?php } else { ?>


<h2>Cover Image</h2>

<p>Use this link to download the cover image:
<?php
echo "<a href=\"" . $imageURL . "\">".$imageURL ."</a>"
?>
</p>



<h2>Converted XML Data</h2>	

<p>Customize this XML by adding information to the <em>comments</em> and 
<em>category</em>
elements, and adjusting the <em>imageURL</em> to reflect the the
location of where you downloaded the image. (Typically it is
<code>covers/<em>image-file-name</em></code>.) You can then copy/paste the
XML into the source page <a href="/bookstore/books.xml">books.xml</a>. See
<a href="/bookstore/about.html">bookstore/about.html</a> for details.</p>




<center>
<textarea cols="60" rows="20">
<?php echo $body; ?>



</textarea>
</center>

<?php 
   // closes if/else error message above...
} ?>

</div>
</body>
</html>