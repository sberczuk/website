#!/bin/sh
which java
java org.apache.xalan.xslt.Process -IN books.xml -XSL book-index.xsl -out index.html
java org.apache.xalan.xslt.Process -IN books.xml -XSL book-std.xsl -out all.html
./makeCategoryPages.sh
#saxon -o index-new.html -a books.xml
