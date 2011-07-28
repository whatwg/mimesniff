all: origin.txt sniff.txt

push:
	scp sniff.xml adambarth@mimesniff.spec.whatwg.org:~/mimesniff.spec.whatwg.org

origin.txt: origin.xml
	../tools/xml2rfc-1.35pre1/xml2rfc.tcl origin.xml

sniff.txt: sniff.xml
	../tools/xml2rfc-1.35pre1/xml2rfc.tcl sniff.xml
