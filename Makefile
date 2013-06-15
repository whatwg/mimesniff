# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis

all: Overview.html ../xref/refs/network/mime.json ../xref/xrefs/network/mime.json

Overview.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values --xref="../xref" \
	--enable=xspecxref --enable=refs --localtime $< $@

../xref/refs/network/mime.json: Overview.src.html Makefile
	$(ANOLIS) --xref="../xref" --enable=refs --dump-refs=$@ $< /tmp/spec

../xref/xrefs/network/mime.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
