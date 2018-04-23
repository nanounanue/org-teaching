FROM debian:testing

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y --no-install-recommends install emacs
RUN apt-get -y --no-install-recommends install texlive-latex-base texlive-fonts-recommended texlive-latex-extra

# Some Emacs packages installation
ADD install.el /emacs/install.el
WORKDIR /emacs
ENV HOME /emacs
RUN emacs --batch --load install.el

# The script is the exporter
ADD export.el /emacs/export.el

ENV LANG en_US.UTF-8
