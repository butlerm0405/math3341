#! /usr/bin/env python3
# -*- coding: utf-8 -*-
#
# update_file_info.py - 2021-08-16 17:51
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
# Distributed under terms of the MIT license.
#
'''
Update_File_Info
'''

import os
import re
import datetime
import json
import requests
from bs4 import BeautifulSoup

from generate_md import format_date, format_semester, generate_lab_dates, determine_semester


def list_files(directory, extensions, depth=2):
    files = []
    folders = []
    if not (os.path.exists(directory) and os.path.isdir(directory)) or depth == 0:
        return files
    items = os.listdir(directory)
    for item in items:
        item_fullpath = directory + '/' + item
        if os.path.isfile(item_fullpath):
            for ext in extensions:
                if item_fullpath.endswith(ext):
                    files.append(item_fullpath)
        files.extend(list_files(item_fullpath, extensions, depth - 1))
    return files

def update_latex_info(file, lab_info, author_short="fname lname", author='firstName lastName', teacher='Libao Jin'):
    if not (os.path.exists(file) and os.path.isfile(file)):
        return
    print(file)
    with open(file, 'r') as f:
        content = f.read()
        # print(content)
        # update semester
        content = re.sub(r'(semester}{)\w{4,6} \d{4,4}', r'\1{:s}'.format(format_semester(lab_info["date"], 1)), content)
        # update \date{}
        if 'Syllabus' not in file:
            content = re.sub(r'\\date{.*?}', r'\\date{{{:s}}}'.format(format_date(lab_info['date'], 2)), content)
            # update \author[]{}
            content = re.sub(r'\\author\[.*?\]{.*?}', r'\\author[{:s}]{{{:s}}}'.format(author_short, author_long), content)
            # update \author{}
            content = re.sub(r'\\author{.*?}', r'\\author{{{:s}}}'.format(author), content)
            if 'slides' not in file:
                # update \title[]{}
                content = re.sub(r'\\title\[.*?\]{.*}', r'\\title[{:s}]{{{:s}}}'.format(lab_info['title_short'], lab_info['title_latex']), content)
                # update \title{}
                content = re.sub(r'\\title{.*}', r'\\title{{Lab {:s}: {:s}}}'.format(lab_info['lab'], lab_info['title_latex']), content)

        if 'Report' in file:
            content = re.sub(r'\\author{.*?}', r'\\author{{{:s}}}'.format(teacher), content)
        # update link
        content = re.sub(r'(courses)/\d{4,4}[a-z]{1,1}/([A-Z]{4,4}\d{4,4})', r'\1/{:s}/\2'.format(format_semester(lab_info["date"], 8)), content)
        content = re.sub(r'(math-334[01]-)\w{4,6}-\d{4,4}', r'\1{:s}'.format(format_semester(lab_info["date"], 3)), content)
        content = re.sub(r'\d{4,4}[a-z]', r'{:s}'.format(format_semester(lab_info["date"], 8)), content)
        # print('-------------- NEW ----------------')
        # print(content)
    with open(file, 'w') as f:
        f.write(content)

def update_pandoc_info(file, lab_info, author='firstName lastName', teacher='Libao Jin'):
    if not (os.path.exists(file) and os.path.isfile(file)):
        return
    print(file)
    with open(file, 'r') as f:
        content = f.read()
        # print(content)
        # update date
        content = re.sub(r'% \w{4,9} \d{2,2}, \d{4,4}', '% {:s}'.format(format_date(lab_info['date'], 2)), content)
        content = re.sub(r'% \\today', '% {:s}'.format(format_date(lab_info['date'], 2)), content)
        # update title
        content = re.sub(r'# Lab \d{2,2}: .*', '# Lab {:s}: {:s}'.format(lab_info['lab'], lab_info['title_latex']), content)
        # update name
        content = re.sub(r'^% \w{5,7} \w{3,6}', '% {:s}'.format(teacher), content)
        # print('-------------- NEW ----------------')
        # print(content[:200])
    with open(file, 'w') as f:
        f.write(content)

def update_matlab_info(file, lab_info, author='first_name last_name', teacher='Libao Jin'):
    if not (os.path.exists(file) and os.path.isfile(file)):
        return
    print(file)
    with open(file, 'r') as f:
        content = f.read()
        # print(content)
        # update title
        content = re.sub('% \w{4,4} \d{4,4}, \w{4,8} \w{4,4}', f'% Math 3341, {format_semester(lab_info["date"], 1)}', content)
        content = re.sub(r'% Lab \d{2,2}: .*', '% Lab {:s}: {:s}'.format(lab_info['lab'], lab_info['title']), content)
        content = re.sub(r'% Author: \w+ \w+', '% Author: {:s}'.format(author), content)
        if 'ans' in file or 'Report' in file:
            content = re.sub(r'% Author: \w+ \w+', '% Author: {:s}'.format(teacher), content)
        content = re.sub(r'% Date: \w{2,2}/\w{2,2}/\w{4,4}', '% Date: {:s}'.format(format_date(lab_info['date'], 1)), content)

        # print('-------------- NEW ----------------')
        # print(content[:200])
    with open(file, 'w') as f:
        f.write(content)

def update_shell_info(file, lab_info, author='first_name last_name', teacher='Libao Jin'):
    if not (os.path.exists(file) and os.path.isfile(file)):
        return
    print(file)
    with open(file, 'r') as f:
        content = f.read()
        # print(content)
        content = re.sub(r'Lab\.\d{2,2}', 'Lab.{:s}'.format(lab_info['lab']), content)
        # print('-------------- NEW ----------------')
        # print(content)
    with open(file, 'w') as f:
        f.write(content)

def update_makefile_info(file, lab_info, author='first_name last_name', teacher='Libao Jin'):
    if not (os.path.exists(file) and os.path.isfile(file)):
        return
    print(file)
    with open(file, 'r') as f:
        content = f.read()
        # print(content)
        content = re.sub(r'(shortauthor:)[\w\s.]+"', r'\1{:s}"'.format(teacher), content)
        content = re.sub(r'(shorttitle:)[\w\s]+"', r'\1MATH 3341 Lab {:s}"'.format(lab_info['lab']), content)
        # print('-------------- NEW ----------------')
        # print(content)
    with open(file, 'w') as f:
        f.write(content)


if __name__ == '__main__':
    base = 'MATH3341'
    start_date = '2021-08-23'
    author_short = 'Firstname Lastname'
    author_long = 'Firstname Lastname'
    teacher = 'Libao Jin'
    skip_week = 10
    total_labs = 14
    target_extensions =  ['.m', '.tex', '.pdc', '.sh']
    lab_info_file = 'lab_info.json'

    lab_info = dict()
    with open(lab_info_file, 'r') as f:
        lab_info = json.load(f)

    files = list_files('.', target_extensions, 10)
    files.sort()
    files.reverse()

    for lab_no in range(1, 15):
        file_type = 'Lab'
        lab_files = [f for f in files if file_type in f and str(lab_no).zfill(2) in f]
        for i in range(len(lab_files)):
            print(i, lab_files[i])
        for i in range(len(lab_files)):
            if lab_files[i].endswith('.tex'):
                update_latex_info(lab_files[i], lab_info[str(lab_no)], author_short, author_long, teacher)
            elif lab_files[i].endswith('.m'):
                update_matlab_info(lab_files[i], lab_info[str(lab_no)], author='first_name last_name', teacher=teacher)
            elif lab_files[i].endswith('.pdc'):
                update_pandoc_info(lab_files[i], lab_info[str(lab_no)], author='first_name last_name', teacher=teacher)
            elif lab_files[i].endswith('.sh'):
                update_shell_info(lab_files[i], lab_info[str(lab_no)], author='first_name last_name', teacher=teacher)
            elif lab_files[i].endswith('Makefile'):
                update_makefile_info(lab_files[i], lab_info[str(lab_no)], author='first_name last_name', teacher=teacher)

    file_type = 'Syllabus'
    lab_files = [f for f in files if file_type in f]
    for i in range(len(lab_files)):
        print(i, lab_files[i])
    for i in range(len(lab_files)):
        if lab_files[i].endswith('.tex'):
            update_latex_info(lab_files[i], lab_info[str(lab_no)], author_short, author_long)
