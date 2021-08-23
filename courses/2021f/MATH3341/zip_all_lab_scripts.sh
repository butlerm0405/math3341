#! /bin/sh
#
# zip_all_lab_scripts.sh - 2021-01-26 14:01
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
# Distributed under terms of the MIT license.
#

root=Math.3341
if [ -d $root ]; then
    rm -rf $root
fi

mkdir $root

for i in `seq 1 14`;
# for i in `seq 1 14`;
do
    if (( $i < 10 ))
    then
        number="0$i"
    else
        number=$i
    fi
    echo $number
    export FILENAME="Math.3341.Lab.$number"

    cp -r $FILENAME/$FILENAME $root/
    rm -rf $root/$FILENAME/.DS_Store
    rm $root/$FILENAME/*pdf
done

zip -r $root.zip $root/*
if [ ! -d zip ]; then
    mkdir zip
fi
mv $root.zip zip/
rm -rf $root
