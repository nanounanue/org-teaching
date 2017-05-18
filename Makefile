DECKTAPESHCMD=bin/decktape.sh
# DECKTAPESHOPTS="-s 1280x960"
DECKTAPESHOPTS=


all: slides.pdf

slides.pdf: slides.html
	$(DECKTAPESHCMD) $(DECKTAPESHOPTS) slides.html slides.pdf
