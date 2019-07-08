#!/bin/bash

#set -x

# Launch decktape 2.8.0 inside docker to create PDF version of reveal.js HTML5+JS slides

# uses the Dockerfile from : https://github.com/astefanutti/decktape

# Creation of docker image from 2.8.0 :
#  git checkout v2.8.0
#  docker build -t obergixlocal/decktape:2.8.x .

#DOCKERIMAGE=obergixlocal/decktape:2.8.x
DOCKERIMAGE=astefanutti/decktape:2.8.0

SCRIPTNAME="$(basename "$0")"
USAGE=`sed "s/__SCRIPTNAME__/$SCRIPTNAME/g" <<"EOF"
__SCRIPTNAME__ [-h] [-s size] [-r range] slides.html slides.pdf -- converts reveal.js slides from file slides.html in current dir to PDF file in current dir

where:
    -h : show this help text
    -s size : Size of the slides deck viewport: <width>x<height>  (ex. 1280x720)
    -r range : Range of slides to be exported, a combination of slide indexes and ranges (e.g. '1-3,5,8')
    slides.html : HTML slides source's filename in current dir (no path absolute or relative)
    slides.pdf : PDF output file's filename in current dir (no path absolute or relative)
EOF
`

SIZEOPT=""
RANGE=""

seed=42
while getopts 'hs:r:' option; do
  case "$option" in
    h) echo "$USAGE"
       exit
       ;;
    s) SIZEOPT="-s $OPTARG"
       ;;
    r) RANGE="--slides $OPTARG"
       ;;
  esac
done
shift $((OPTIND - 1))

if [ $# -lt 2 ]; then
    echo "Error: I need 2 filenames" >&2
    echo >&2
    echo "$USAGE" >&2
    exit 1
fi


# Working directory, typically containg slides.org
CURDIR=`pwd`
# Root of the course (lessons may be under subdirs of it)
COURSEROOT="$( cd "$(dirname $(dirname "${BASH_SOURCE[0]}" ))" && pwd )"
# Dirname of the subfolder, relative to the COURSE ROOT
LESSON="$(realpath --relative-to="$COURSEROOT" "$CURDIR")"

# echo "$COURSEROOT"
# echo "$CURDIR"
# echo "$LESSON"

# All input files which are under $COURSEROOT will be accessible from inside the container, in subdirs of /COURSEROOT
# The output file will be produced in the current dir, bind-mounted to /slides
docker run --rm -v $CURDIR:/slides -v $COURSEROOT:/COURSEROOT $DOCKERIMAGE $SIZEOPT $RANGE "/COURSEROOT/$LESSON/$1" "$2"


