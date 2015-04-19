PDF := cocktails rezepte

PARTS_rezepte := eingemachtes gebackenes
PARTS_cocktails := cocktails

all: $(patsubst %,%.pdf,$(PDF))

define _pdf_tmpl =
$(1).pdf: $(1).tex $$(patsubst %,.%.tex,$$(PARTS_$(1)))
	context $$< || rm -f $$@
	context --purge
endef

define _part_tmpl =
.$(1).tex: $$(wildcard $(1)/*.tex)
	cat $$(sort $$?) > .$(1).tex
endef

$(foreach pdf,$(PDF),$(eval $(call _pdf_tmpl,$(pdf))))
$(foreach pdf,$(PDF),$(foreach part,$(PARTS_$(pdf)),$(eval $(call _part_tmpl,$(part)))))
# $(foreach part,$(PARTS_rezepte),$(eval $(call _part_tmpl,$(part))))
