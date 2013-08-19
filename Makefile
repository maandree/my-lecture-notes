PROGRAM = matematikens-historia
PKGNAME = matematikens-historia
TEXINFO_DIR = .

PREFIX = /usr
DATA = /share



.PHONY: all
all:


%.gz: %
	gzip -9c < "$<" > "$@"

%.bz2: %
	bzip2 -9c < "$<" > "$@"

%.xz: %
	xz -e9 < "$<" > "$@"


.PHONY: install
install:

.PHONY: uninstall
uninstall:

.PHONY: clean
clean:
	-rn -r -- bin obj

## Texinfo manual section

.PHONY: doc
all: pdf
doc: pdf ps dvi

.PHONY: pdf ps dvi
pdf: $(PROGRAM).pdf.gz
ps: $(PROGRAM).ps.gz
dvi: $(PROGRAM).dvi.gz

%.pdf: $(TEXINFO_DIR)/%.texinfo
	texi2pdf "$<"

%.dvi: $(TEXINFO_DIR)/%.texinfo
	$(TEXI2DVI) "$<"

%.ps: $(TEXINFO_DIR)/%.texinfo
	texi2pdf --ps "$<"

.PHONY: clean-texinfo
clean: clean-texinfo
clean-texinfo:
	-rm -- *.{info,pdf,ps,dvi}{,.gz,.bz2,.xz} 2>/dev/null
	-rm -- *.{aux,cp,cps,fn,ky,log,pg,pgs,toc,tp,vr,vrs} 2>/dev/null

