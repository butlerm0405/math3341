#! /bin/sh
#
# update_lab_exercise_style.sh - 2021-01-26 21:36
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
# Distributed under terms of the MIT license.
#

for i in `seq 2 14`;
do
    if (( $i < 10 )); then
        number="0$i"
    else
        number=$i
    fi
    cp ./Math.3341.Lab.01/exercise/lab-exercise.cls ./Math.3341.Lab.$number/exercise/
done
