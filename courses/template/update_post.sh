#! /bin/sh
#
# update_post.sh - 2021-08-02 13:40
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
# Distributed under terms of the MIT license.
#

MD_FILE=2021-08-23-math-3341-fall-2021.md
POST_DIR=../../_posts
SEMESTER=2021f
COURSE_DIR=../$SEMESTER
TEMPLATE_DIR=.
SOURCE_DIR=./MATH3341
TARGET_DIR=$COURSE_DIR/MATH3341
LAST_LAB_NUMBER=$1
LAST_MATH3340_HW_NUMBER=$2

./generate_md.py --generate_md $LAST_LAB_NUMBER $LAST_MATH3340_HW_NUMBER $MD_FILE

if [ ! -d $POST_DIR ]; then
    mkdir $POST_DIR
fi

if [ `git branch | egrep "^[[:space:]]+post"` ]
then
    git checkout post
    cp $TEMPLATE_DIR/$MD_FILE $POST_DIR/$MD_FILE
    git add $POST_DIR/$MD_FILE
    git commit -am "Update post"
else
    git checkout -b post
    cp $TEMPLATE_DIR/$MD_FILE $POST_DIR/$MD_FILE
    git add $POST_DIR/$MD_FILE
    git commit -m "Add MATH 3341 Lab $LAB_NUMBER to post"
fi

if [ `git branch | egrep "^[[:space:]]+gh-pages"` ]
then
    git checkout gh-pages
else
    git checkout -b gh-pages
fi

git merge post -m "Merge branch 'post' into gh-pages"
git checkout main
git push origin main post gh-pages courses-$SEMESTER
