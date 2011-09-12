all: origin.txt

push:
	scp sniff.html adambarth@mimesniff.spec.whatwg.org:~/mimesniff.spec.whatwg.org

origin.txt: origin.xml
	../tools/xml2rfc-1.35pre1/xml2rfc.tcl origin.xml

ttt:
	java -classpath ../tools/saxonhe9-2-0-5j/saxon9he.jar net.sf.saxon.Transform -novw -l origin.xml ../tools/rfc2629xslt/extract-artwork.xslt type="abnf" > syntax.abnf
	echo >> syntax.abnf # Add a newline at EOF to make bap happy.
	../tools/bap/bap syntax.abnf
