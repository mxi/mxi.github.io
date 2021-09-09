impress := ../tools/impress
amalgam := ../tools/amalgam

articles := $(wildcard .gen/article/*)
cards := $(articles:.gen/article/%.md=.gen/card/%.card.html)

index.html: $(cards)


$(cards): .gen/card/%.card.html: .gen/article/%.md
	$(impress) -c $@ $<
