DOCUMENT_NAME = Bewerbung
COMPILER = latexmk -pdf --output-directory=out

default | help:
	@echo 'make | Zeigt die Hilfe'
	@echo 'make build | Erstelle das komplette Dokument mit latexmk'
	@echo 'make clean | Säubere das Arbeitsverzeichnis von temporären Dateien und Verzeichnissen.'
	@echo 'make help | Zeigt die Hilfe'

build:
	$(COMPILER) $(DOCUMENT_NAME)

clean:
	rm -rf out/
