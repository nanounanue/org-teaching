DECKTAPESHCMD=bin/decktape.sh
# DECKTAPESHOPTS="-s 1280x960"
DECKTAPESHOPTS=


all: slides.html slides.pdf handbook.pdf teacher-handbook.pdf

slides.html:	slides.org lesson.org
	./docker/docker-org-export org-reveal-export-to-html slides.org

handbook.pdf:	handbook.org lesson.org
	./docker/docker-org-export org-latex-export-to-pdf handbook.org

teacher-handbook.pdf: teacher-handbook.org lesson.org
	./docker/docker-org-export org-latex-export-to-pdf teacher-handbook.org

slides.pdf: slides.html
	$(DECKTAPESHCMD) $(DECKTAPESHOPTS) slides.html slides.pdf
