#! /bin/sh
#
# generate.sh
# Copyright (C) 2019 Libao Jin <jinlibao@outlook.com>
#
# Distributed under terms of the MIT license.
#

if [ -z $FILENAME ]
then
    FILENAME="Math.3341.Lab.14"
fi
cd exercise
make
cp main.pdf "../$FILENAME/$FILENAME.pdf"
cd ../slides
if [ ! -d uw ]; then
    cp -r ../../template/uw .
fi
make basic
cp slides.pdf "../$FILENAME/$FILENAME.Slides.pdf"
cp slides_transition.pdf "../$FILENAME.Lecture.pdf"
cd ..
rm *.zip
zip -r "$FILENAME.zip" $FILENAME/* -x "*.DS_Store"

cp $FILENAME.ans/*.pdf $FILENAME.Report/src
cp $FILENAME.ans/*.png $FILENAME.Report/src
cp $FILENAME.ans/*.txt $FILENAME.Report/src
cp $FILENAME.ans/*.m   $FILENAME.Report/src
cd $FILENAME.Report/LaTeX
latexmk --xelatex -quiet main.tex
latexmk -c
rm *xdv
cp main.pdf ../../$FILENAME.Report.pdf
