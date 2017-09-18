RELEASE=0.0
VERSION=0.0.0
LANG=hun
BASENAME=apertium-$(LANG)

TARGETS_COMMON = $(LANG).automorf.bin $(LANG).autogen.bin \
        $(LANG).rlx.bin


# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

###############################################################################
## Transducers, disambiguation rules, transfer
###############################################################################


$(LANG).autogen.bin: $(BASENAME).$(LANG).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@ $(BASENAME).$(LANG).acx

$(LANG).automorf.bin: $(BASENAME).$(LANG).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@ $(BASENAME).$(LANG).acx

$(LANG).autogen.att.gz: $(LANG).autogen.bin
	lt-print $< | gzip -9 -c -n > $@

$(LANG).automorf.att.gz: $(LANG).automorf.bin
	lt-print $< | gzip -9 -c -n > $@


$(LANG).rlx.bin: $(BASENAME).$(LANG).rlx
	cg-comp $< $@

###############################################################################
## Distribution
###############################################################################

EXTRA_DIST=$(BASENAME).$(LANG).dix \
	   $(BASENAME).post-$(LANG).dix \
	   $(BASENAME).$(LANG).acx \
	   $(BASENAME).$(LANG).rlx \
	   $(LANG).prob \
	   spellrelax.xsl \
	   modes.xml

###############################################################################
## Installation
###############################################################################

apertium_hundir=$(prefix)/share/apertium/$(BASENAME)/
apertium_hun_srcdir=$(prefix)/share/apertium/$(BASENAME)/

apertium_hun_DATA=$(TARGETS_COMMON)

pkgconfigdir = $(prefix)/share/pkgconfig
pkgconfig_DATA = $(BASENAME).pc

noinst_DATA=modes/$(LANG)-morph.mode

install-data-local: install-modes
	test -d $(DESTDIR)$(apertium_hun_srcdir) || mkdir -p $(DESTDIR)$(apertium_fin_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG).dix $(DESTDIR)$(apertium_hun_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG).rlx $(DESTDIR)$(apertium_hun_srcdir)

###############################################################################
## Cleanup
###############################################################################

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

