#! /bin/zsh
#
# clear_all.sh - 2021-01-26 21:31
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
# Distributed under terms of the MIT license.
#

rm -rf lecture
rm -rf exercise
rm -rf slides
rm -rf solution
rm -rf zip
rm -rf Math.3341

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

    pwd
    cd $FILENAME
    pwd
    rm -f *.zip
    rm -f *.pdf
    rm -f $FILENAME/*.pdf
    cd $FILENAME.Report/LaTeX
    latexmk -C
    pwd
    cd ../../slides
    pwd
    latexmk -C
    rm -f *.pdf
    rm -f *.log
    rm -rf uw
    pwd
    cd ../exercise
    pwd
    latexmk -C
    rm -f *.pdf
    rm -f *.log
    cd ../..
    pwd
done
