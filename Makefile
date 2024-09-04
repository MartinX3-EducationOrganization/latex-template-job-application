DOCUMENT_NAME_APPLICATION = Anschreiben Lebenslauf
DOCUMENT_NAME_QUESTIONS = Fragen_Headhunter Fragen_Vorstellungsgespraech
COMPILER = latexmk -lualatex --output-directory=out

default | help:
	@echo 'make | Zeigt die Hilfe'
	@echo 'make build | Erstelle alle Dokumente mit latexmk'
	@echo 'make build_application | Erstelle die Bewerbung mit latexmk'
	@echo 'make build_questions | Erstelle die Interviewfragen mit latexmk'
	@echo 'make clean | Säubere das Arbeitsverzeichnis von temporären Dateien und Verzeichnissen.'
	@echo 'make help | Zeigt die Hilfe'

build: build_application build_questions

build_application:
	$(COMPILER) $(DOCUMENT_NAME_APPLICATION)

build_questions:
	$(COMPILER) $(DOCUMENT_NAME_QUESTIONS)

clean:
	rm -rf out/
