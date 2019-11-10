.PHONY: clean

# range to start at (for all, set to 1)
start = 1

# range to end at (for all, set to 1998)
end = 1998

files = $(shell ./list-files $(start) $(end) pdf pdfs/)
asfaltics_path = https://www.jmcvey.net/asfaltics

HTML_FILES = $(shell ./list-files $(start) $(end) htm html/)
.SECONDARY: $(HTML_FILES)

all: $(files)

html:
	mkdir -p html

pdfs:
	mkdir -p pdfs

html/%.htm: html
	curl $(asfaltics_path)/$(notdir $@) -o $@
	touch $@

html/default.css: html
	curl $(asfaltics_path)/default.css -o $@

pdfs/%.pdf: overrides.css html/default.css pdfs html/%.htm
	wkhtmltopdf --user-style-sheet overrides.css html/$*.htm $@

clean:
	rm -rf html
	rm -rf pdfs
