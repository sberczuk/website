<?php 
// text plain is not the best content type, but it works.
// it gives you a default extension of .txt
header("Content-type: text/plain");
header("Content-Disposition: attachment; filename=addresses.csv"); 
?>
<?php

$uploaddir = '/home2/MiniWeb/berczuk/public_html/data/';

$command = "./doJava.sh -jar vcardPalm.jar " . $_FILES['vcfFile']['tmp_name']; 

$handle = popen($command, "r");
$contents = "";
while ($data =fgets($handle,1024)){
 $contents .= $data;
}
?>
<?php echo $contents ?>

