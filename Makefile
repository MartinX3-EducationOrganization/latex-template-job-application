default | help:
	@echo 'make | Zeigt die Hilfe'
	@echo 'make build | Erstelle alle Dokumente mit latexmk'
	@echo 'make build_application | Erstelle die Bewerbung mit latexmk'
	@echo 'make build_job_search | Erstelle die Jobdaten mit latexmk'
	@echo 'make build_questions | Erstelle die Interviewfragen mit latexmk'
	@echo 'make clean | Säubere das Arbeitsverzeichnis von temporären Dateien und Verzeichnissen.'
	@echo 'make help | Zeigt die Hilfe'

build: build_application build_job_search build_questions

build_application:
	$(call compile,Bewerbung)

build_job_search:
	$(call compile,Jobsuche)

build_questions:
	$(call compile,Fragen)

clean:
	rm -rf out/

define compile
	latexmk -lualatex --output-directory=out/${1} abschnitte/${1}/*
endef
