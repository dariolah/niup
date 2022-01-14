NIUP_NIMBLE_VERSION:=$(shell sed -n '/^version/{s/.*= "//;s/".*//;p}' niup.nimble | tr -d '\n')

all:
	echo Change version in niup.nimble: version '...'
	echo NIUP_VERSION=3.30.6 make doc && commit
	echo NIUP_VERSION=3.30.6 make tag

tag: check-env
	git tag -a v$(NIUP_VERSION)

push:
	git push --follow-tags

doc: check-env
	rm -rf docs/niup/inc/c
	mkdir -p docs/niup/inc/c
	nim doc -d:gendoc --outdir:docs/niup/inc/c src/niup/inc/c/libcd.nim
	nim doc -d:gendoc --outdir:docs/niup/inc/c src/niup/inc/c/libim.nim
	nim doc -d:gendoc --outdir:docs/niup/inc/c src/niup/inc/c/libiup.nim
	nim doc --outdir:docs/ src/niup.nim
	nim rst2html index.rst && mv -v htmldocs/index.html htmldocs/*.css docs/
	nim rst2html niupc.rst && mv -v htmldocs/niupc.html docs/
	rm -rf htmldocs

check-env:
	@echo niup.nimble version: $(NIUP_NIMBLE_VERSION)
ifndef NIUP_VERSION
	$(error NIUP_VERSION is undefined)
endif
ifneq ($(NIUP_VERSION), $(NIUP_NIMBLE_VERSION))
	$(error Version mismatch:  $(NIUP_VERSION), $(NIUP_NIMBLE_VERSION))
endif
