WCF_FILES = $(shell find files_wcf -type f)

all: be.bastelstu.promiseWrap.tar

be.bastelstu.promiseWrap.tar: files_wcf.tar *.xml
	tar cvf be.bastelstu.promiseWrap.tar --numeric-owner --exclude-vcs -- files_wcf.tar *.xml

files_wcf.tar: $(WCF_FILES)
	tar cvf files_wcf.tar --numeric-owner --exclude-vcs --transform='s,files_wcf/,,' -- $(WCF_FILES)

clean:
	-rm -f files_wcf.tar

distclean: clean
	-rm -f be.bastelstu.promiseWrap.tar

.PHONY: distclean clean
