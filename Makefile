NIUP_NIMBLE_VERSION:=$(shell sed -n '/^version/{s/.*= "//;s/".*//;p}' niup.nimble | tr -d '\n')

all:
	@echo Change version in niup.nimble: version '...'
	@echo "NIUP_VERSION=3.30.6 make doc && commit"
	@echo "NIUP_VERSION=3.30.6 make tag"

tag: check-env
	git tag -a v$(NIUP_VERSION)

push:
	git push --follow-tags

doc: check-env
	rm -rf docs/niup/inc/c
	mkdir -p docs/niup/inc/c
	nim doc --hints:off -d:gendoc --outdir:docs/niup/inc/c src/niup/inc/c/libcd.nim
	nim doc --hints:off -d:gendoc --outdir:docs/niup/inc/c src/niup/inc/c/libim.nim
	nim doc --hints:off -d:gendoc --outdir:docs/niup/inc/c src/niup/inc/c/libiup.nim
	nim --hints:off rst2html index.rst && mv -v htmldocs/index.html htmldocs/*.css docs/
	nim --hints:off rst2html niup.rst && mv -v htmldocs/niup.html docs/
	nim --hints:off rst2html niupc.rst && mv -v htmldocs/niupc.html docs/niup/
	rm -rf htmldocs
	cat src/niup/inc/types.nim | sed 's/\*//g' > src/niup/inc/doctypes.nim
	for i in `ls src/niup/inc/*.nim | grep -v sonames | grep -v doctypes`; do \
		echo $$i; \
		nim doc --hints:off --warning:UnusedImport:off  -d:gendocniup --outdir:docs/niup/inc/ $$i; \
	done
	rm src/niup/inc/doctypes.nim
	sed -i 's/href="niupc.html">/href="..\/niupc.html"\>/g' docs/niup/inc/*.html

check-env:
	@echo niup.nimble version: $(NIUP_NIMBLE_VERSION)
ifndef NIUP_VERSION
	$(error NIUP_VERSION is undefined)
endif
ifneq ($(NIUP_VERSION), $(NIUP_NIMBLE_VERSION))
	$(error Version mismatch:  $(NIUP_VERSION), $(NIUP_NIMBLE_VERSION))
endif
