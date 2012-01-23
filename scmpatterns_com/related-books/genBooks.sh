#!/bin/sh


which java

set SITE=/Users/berczuk/coding/website
java org.apache.xalan.xslt.Process -IN "/Users/berczuk/coding/website/bookstore/books.xml" -XSL scmbooklist.xsl -out index.html
#saxon -o index-new.html -a books.xml
