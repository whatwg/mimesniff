all: origin.txt

push:
	scp sniff.html adambarth@mimesniff.spec.whatwg.org:~/mimesniff.spec.whatwg.org

origin.txt: origin.xml
	../tools/xml2rfc-1.35pre1/xml2rfc.tcl origin.xml
