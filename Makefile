DOCUMENT_NAME = Application
BIB = biber -output-directory=out # BibLaTeX
GLOS = makeglossaries -d out # Glossaries
LUALATEX = lualatex --shell-escape --output-directory=out

default:
	@echo 'make all    | Erstelle das komplette Dokument inklusive bib-Datei für das Literaturverzeichnis'
	@echo 'make bib    | Erstelle bib-Datei für Literaturverzeichnis'
	@echo 'make clean  | Säubere das Arbeitsverzeichnis von temporären Dateien und Verzeichnissen.'
	@echo 'make doc    | Erstelle komplettes Dokument und lese die Ausgabe. Falls Fehler auftreten führe make bib oder make doc erneut aus.'
	@echo 'make gloss   | Erstelle Dateien für Inhaltsverzeichnisse'

all: doc bib doc_twice copy_example

bib:
	$(BIB) $(DOCUMENT_NAME)

clean:
	rm -f .log quit.tex *.acn *gdf *.glg *. glo *. gls *.ist *.lol *.nlo *.nls *.ps *.out *.dvi *.log *.aux *.blg *.toc *.log *.bbl *.lof *.lot *.idx *.brf *.ilg *.ind abschnitte/*.aux bilder/*.aux

copy_example:
	cp -f out/Application.pdf example/

doc:
	$(LUALATEX) $(DOCUMENT_NAME)

doc_twice:
	$(LUALATEX) $(DOCUMENT_NAME)
	$(LUALATEX) $(DOCUMENT_NAME)
