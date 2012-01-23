#!/bin/sh
## Script to create a script to use xslt to generate sub pages for books page
which java
java org.apache.xalan.xslt.Process -IN categories.xml -XSL genScript.xsl -out makeCategoryPages.sh

#saxon -o index-new.html -a books.xml
