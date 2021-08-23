#! /bin/sh
#
# generate_files.sh - 2021-01-26 21:36
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
# Distributed under terms of the MIT license.
#


if [ ! -d zip ]; then
    mkdir zip
fi
if [ ! -d lecture ]; then
    mkdir lecture
fi
if [ ! -d exercise ]; then
    mkdir exercise
fi
if [ ! -d slides ]; then
    mkdir slides
fi
if [ ! -d solution ]; then
    mkdir solution
fi

for i in `seq 1 14`;
do
    if (( $i < 10 ))
    then
        number="0$i"
    else
        number=$i
    fi
    echo $number
    export FILENAME="Math.3341.Lab.$number"

    # cp Math.3341.Lab.01/generate.sh $FILENAME/generate.sh
    # cp Math.3341.Lab.02/slides/template.tex $FILENAME/slides/template.tex
    # chmod -R 644 $FILENAME
    # chmod 755 $FILENAME
    # chmod -R 755 $FILENAME/generate.sh

    cd $FILENAME
    ./generate.sh
    cd ..
    cp $FILENAME/$FILENAME.zip zip/
    cp $FILENAME/$FILENAME.Report.pdf solution/
    cp $FILENAME/$FILENAME.Lecture.pdf lecture/
    cp $FILENAME/$FILENAME/$FILENAME.pdf exercise/
    cp $FILENAME/$FILENAME/$FILENAME.Slides.pdf slides/
done
