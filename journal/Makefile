impress := ../tools/impress
amalgam := ../tools/amalgam

index := index.html
template_card := .gen/template/card.html
template_page := .gen/template/page.html

articles := $(wildcard .gen/article/*)
pages := $(articles:.gen/article/%.md=%.html)
cards := $(articles:.gen/article/%.md=.gen/card/%.card.html)

$(index): $(cards) $(pages)
	$(amalgam) -o $@

$(cards): .gen/card/%.card.html: .gen/article/%.md
	$(impress) -t $(template_card) -i $< -o $@ -D page $*.html

$(pages): %.html: .gen/article/%.md
	$(impress) -t $(template_page) -i $< -o $@

clean:
	rm -rf $(index)
	rm -rf $(pages)
	rm -rf $(cards)

pages: $(pages)

cards: $(cards)

.PHONY: clean pages cards
