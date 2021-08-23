#! /bin/sh
#
# update_course.sh - 2021-08-02 13:40
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
# Distributed under terms of the MIT license.
#

MD_FILE=2021-08-23-math-3341-fall-2021.md
SEMESTER=2021f
COURSE_DIR=../$SEMESTER
TEMPLATE_DIR=.
TARGET_DIR=$COURSE_DIR/MATH3340
SOURCE_DIR=$TEMPLATE_DIR/MATH3340
POST_DIR=../../_posts
LAST_LAB_NUMBER=$1
LAST_MATH3340_HW_NUMBER=$2

if [ ! -d $COURSE_DIR ]; then
    mkdir $COURSE_DIR
fi

if [ -d $TARGET_DIR ]; then
    rm -rf $TARGET_DIR
fi
cp -r $SOURCE_DIR $TARGET_DIR

./generate_md.py --generate_md $LAST_LAB_NUMBER $LAST_MATH3340_HW_NUMBER $MD_FILE

if [ `git branch | egrep "^[[:space:]]+courses-${SEMESTER}"` ]
then
    git checkout courses-$SEMESTER
else
    git checkout -b courses-$SEMESTER
fi

for MATH3340_HW_NUMBER in `seq 1 $LAST_MATH3340_HW_NUMBER`;
do
    if [ $MATH3340_HW_NUMBER -gt 8 ]
    then
        git add $TARGET_DIR/Assignment/$MATH3340_HW_NUMBER
        git add $TARGET_DIR/Homework/$MATH3340_HW_NUMBER
        git add $TARGET_DIR/Homework/Final.Project
        git add $TARGET_DIR/MATH.3340.Final.Project.pdf
        git add $TARGET_DIR/final.zip
    else
        git add $TARGET_DIR/Homework/$MATH3340_HW_NUMBER
        git add $TARGET_DIR/Assignment/$MATH3340_HW_NUMBER
    fi
done
git commit -m "Add MATH 3340 Homework $MATH3340_HW_NUMBER"
git checkout main

if [ ! -d $POST_DIR ]; then
    mkdir $POST_DIR
fi

if [ `git branch | egrep "^[[:space:]]+post"` ]
then
    git checkout post
    cp $TEMPLATE_DIR/$MD_FILE $POST_DIR/$MD_FILE
    git add $POST_DIR/$MD_FILE
    git commit -am "Add MATH 3340 Lab $LAST_MATH3340_HW_NUMBER to post"
else
    git checkout -b post
    cp $TEMPLATE_DIR/$MD_FILE $POST_DIR/$MD_FILE
    git add $POST_DIR/$MD_FILE
    git commit -m "Add MATH 3340 Lab $LAST_MATH3340_HW_NUMBER to post"
fi

if [ `git branch | egrep "^[[:space:]]+gh-pages"` ]
then
    git checkout gh-pages
else
    git checkout -b gh-pages
fi

git merge post courses-$SEMESTER -m "Merge branch 'post' and 'courses-$SEMESTER' into gh-pages"
git checkout main
git push origin main post gh-pages courses-$SEMESTER
