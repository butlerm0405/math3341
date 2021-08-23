#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 Libao Jin <jinlibao@outlook.com>
#
# Distributed under terms of the MIT license.

"""
generate_md
"""
import html
import json
import datetime
import requests
from bs4 import BeautifulSoup
import sys


def format_date(date, date_type=1):
    date_obj = datetime.datetime.strptime(date, '%Y-%m-%d')
    if date_type == 1:
        return date_obj.strftime('%m/%d/%Y')   # '08/23/2021'
    elif date_type == 2:
        return date_obj.strftime("%B %d, %Y")  # 'August 23, 2021'
    else:
        return date                            # '2021-08-23'

def format_semester(date, semester_type=1):
    semester = determine_semester(datetime.datetime.strptime(date, '%Y-%m-%d'))
    semester_array = semester.split(' ')
    if semester_type == 1:
        return semester                                          # Fall 2021
    elif semester_type == 2:
        return semester.replace(' ', '-')                        # Fall-2021
    elif semester_type == 3:
        return semester.replace(' ', '-').lower()                # fall-2021
    elif semester_type == 4:
        return ' '.join(reversed(semester_array))                # 2021 Fall
    elif semester_type == 5:
        return '-'.join(reversed(semester_array))                # 2021-Fall
    elif semester_type == 6:
        return '-'.join(reversed(semester_array)).lower()        # 2021-fall
    elif semester_type == 7:
        return semester_array[1] + semester_array[0][0]          # 2021F
    elif semester_type == 8:
        return semester_array[1] + semester_array[0][0].lower()  # 2021f

def get_hrefs(url, prefix):
    req = requests.request('GET', url)
    soup = BeautifulSoup(req.content.decode('utf-8'), 'html.parser')
    anchors = soup.find_all('a')
    overleaf_hrefs = []
    for a in anchors:
        href = a.get('href')
        if href and href.startswith(prefix):
            overleaf_hrefs.append(href)
    return overleaf_hrefs

def update_lab_info(start_date, skip_week, total_labs, lab_info_file):
    lab_dates = generate_lab_dates(start_date, skip_week, total_labs)
    lab_info = dict()
    url = 'https://libaoj.in/math-3341-fall-2020/'
    prefix = 'https://www.overleaf.com'
    overleaf_hrefs = get_hrefs(url, prefix)
    titles = [
        'Introduction to MATLAB and LaTeX',
        'Variables, Arrays and Scripts',
        'Functions and Control Flows',
        'Plotting Data',
        'Formatting Output and LaTeX',
        'LU Decomposition',
        'Debugging & Good Coding Practices',
        'MATLAB Interpolation Routines and Their Derivatives',
        'Ill-conditioned Matrices and Finite Precision Arithmetic',
        'MATLAB 3D Plots',
        'MATLAB Integration Routines & Gauss Quadrature',
        'Romberg Integration',
        'Random Numbers, Histogram & Monte Carlo Integration',
        'Built-in ODE Solvers in MATLAB'
    ]

    wyocourses_link = [
        "courses/546700/files/57574275",
        "courses/546700/files/57574340",
        "courses/546700/files/57574341",
        "courses/546700/files/57574342",
        "courses/546700/files/57574347",
        "courses/546700/files/57574271",
        "courses/546700/files/57691428",
        "courses/546700/files/57690957",
        "courses/546700/files/57691141",
        "courses/546700/files/57691283",
        "courses/546700/files/57692047",
        "courses/546700/files/57692133",
        "courses/546700/files/58866211",
        "courses/546700/files/58866157",
    ]

    for i in range(14):
        lab_info[str(i + 1)] = {
            'title_short': 'MATH 3341 Lab {:s}'.format(str(i + 1) .zfill(2)),
            'title': titles[i],
            'title_latex': titles[i].replace('LaTeX', r'\\LaTeX{}').replace('&', r'\&'),
            'title_html': html.escape(titles[i].replace('LaTeX', r'$\rm\LaTeX$')),
            'title_html_literal': html.escape(titles[i]),
            'latex': overleaf_hrefs[i],
            'date': lab_dates[i]['date'].strftime('%Y-%m-%d'),
            'due': lab_dates[i]['due'].strftime('%Y-%m-%d'),
            'lab': '{:s}'.format(str(i + 1).zfill(2)),
            'wyocourses_link': wyocourses_link[i],
        }

    with open(lab_info_file, 'w') as f:
        json.dump(lab_info, f)

    return lab_info

def update_hw_info(start_date, hw_info_file):
    hw_info = {
        '1':  'https://www.overleaf.com/read/qhfsxjjmrpcs',
        '2':  'https://www.overleaf.com/read/sbnbyyfwbbxj',
        '3':  'https://www.overleaf.com/read/xrrjwybjwtfd',
        '4':  'https://www.overleaf.com/read/pwrnzgmjjrvx',
        '5':  'https://www.overleaf.com/read/dhsncztzrkmb',
        '6':  'https://www.overleaf.com/read/kdszqdqqgzhk',
        '7':  'https://www.overleaf.com/read/qdhpbrnwntzq',
        '8':  'https://www.overleaf.com/read/qhrgbjbspgvn',
        '9':  'https://www.overleaf.com/read/jkcmttjccbdc',
        'date': start_date
    }

    with open (hw_info_file, 'w') as f:
        json.dump(hw_info, f)

    return hw_info

def generate_lab_dates(start, skip_week, total_labs=14):
    start_date = datetime.datetime.strptime(start, '%Y-%m-%d')
    lab_dates = []
    lab_no = 0
    for i in range(0, total_labs + 1):
        if i == skip_week - 1:
            continue
        lab_no += 1
        lab_dates.append({
            'lab': lab_no,
            'date': start_date + datetime.timedelta(weeks=i),
            'due': start_date + datetime.timedelta(days=i * 7 + 6)})
    return lab_dates

def determine_semester(date):
    year = date.year
    seasons = {
        'Spring': (datetime.datetime(year, 1, 20), datetime.datetime(year, 5, 20)),
        'Summer': (datetime.datetime(year, 5, 20), datetime.datetime(year, 8, 20)),
        'Fall': (datetime.datetime(year, 8, 20), datetime.datetime(year, 12, 23))
    }
    if date >= seasons['Spring'][0] and date < seasons['Spring'][1]:
        return 'Spring {:d}'.format(year)
    elif date >= seasons['Summer'][0] and date < seasons['Summer'][1]:
        return 'Summer {:d}'.format(year)
    else:
        return 'Fall {:d}'.format(year)

def generate_header_md():
    body = '''---
layout: post
title: "MATH 3341 Fall 2021"
date: 2021-08-23 10:28:29
image: '/assets/img/'
description: Introduction to Scientific Computing Lab
tags:
- course
categories:
- MATH 3341
twitter_text:
---

<div class="article-navigation">
    <nav id="navigationBar">
        <ul>
            <li><a data-scroll="" href="#course-description">Course Description</a></li>
            <li><a data-scroll="" href="#labs">Labs</a></li>
            <li><a data-scroll="" href="#instructions">Instructions</a></li>
            <li><a data-scroll="" href="#math-3340-homework-templates">MATH 3340 Homework Template</a></li>
        </ul>
    </nav>
    <br />
</div>

## Course Description

* [Syllabus]({{ site.baseurl }}/courses/2021f/MATH3341/Syllabus/MATH.3341.Syllabus.Fall.2021.Online.pdf){:target="_blank"}
* Instructor: Libao Jin
<!--* [Schedule for Appointment]({{ site.baseurl }}/files/Schedule.2021f.pdf){:target="_blank"}-->
* Email: [ljin1@uwyo.edu](mailto:ljin1@uwyo.edu?subject=[MATH-3341])
* Virtual Office: Discord (Invite link: [https://discord.gg/Zhm3WfKTJg](https://discord.gg/Zhm3WfKTJg))
* Class:
  - Section 01: 02:30 PM - 03:20 PM Wednesday, Zoom: [uwyo.zoom.us/j/97308546048](https://uwyo.zoom.us/j/97308546048)
  - Section 02: 02:55 PM - 03:45 PM Thursday, Zoom: [uwyo.zoom.us/j/97308546048](https://uwyo.zoom.us/j/97308546048)
  - Office Hours: 04:05 PM - 04:55 PM Tuesday & Thursday on Discord
* Remote Lab: [vdesktop.uwyo.edu](https://vdesktop.uwyo.edu/)
  <div>
      <video width="720" height="450" poster="https://video.libaoj.in/Login.Into.Student.Remote.Lab.png" preload="none" controls>
          <source src="https://students.uwyo.edu/ljin1/Login.Into.Student.Remote.Lab.mp4" type="video/mp4">
          <source src="https://video.libaoj.in/Login.Into.Student.Remote.Lab.mp4" type="video/mp4">
          <p>This browser does not support the video element, please change a browser.</p>
      </video>
  </div>
'''
    return body

def generate_instruction_md():
    body = '''
## Instructions

### Windows Instructions
1. Go to "This PC", create a folder named "Math.3341" under "HomeDrive-UserFiles(H:).
2. Drag the folder icon of "Math.3341" to "Quick access".
3. Go to "Quick Access", click the folder "Math.3341".
4. Download the above labs to "Download".
5. Unzip the downloaded file: right click on the icon -> "Extract All" -> "Browse..." -> "Math.3341" at "Quick access" -> "Select Folder" -> "Extract".
6. Open MATLAB, locate the current working directory to the current lab folder, e.g., type "cd H:\\Math.3341\Math.3341.Lab.01" in the Command Window to change the working directory.

### Overleaf Instructions
1. Go to [Overleaf](https://www.overleaf.com){:target="_blank"} and create an account.
2. Click to the overleaf template link.
3. "Menu" (up left corner) - "Copy Project".
4. Go to "LaTeX/meta.tex" to change section you are in and your name, e.g., change "Math 3341-00" to "Math 3341-01".
5. Once you finish the exercises, please upload output files "lab_01_output.txt" to the folder "src" on Overleaf. Double check the name are identical to the given above. Otherwise, Overleaf/LaTeX cannot compile the .tex file.
6. [LaTeX.Mathematical.Symbols.pdf]({{ site.baseurl }}/files/LaTeX.Mathematical.Symbols.pdf){:target="_blank"}

### Submission Requirements

Submit the generated .pdf file on WyoCourses.
'''
    return body

def generate_lab_md(lab_info, current_lab=5):
    base = '{{ site.baseurl }}'
    target = '{:target="_blank"}'
    body = '''
## Labs
- All script/functions files: [Math.3341.zip]({:s}/courses/{:s}/MATH3341/zip/Math.3341.zip){:s}
'''.format(base, format_semester(lab_info['1']['date'], 8), target)

    for i in range(len(lab_info)):
        key = str(i + 1)
        lab_no = lab_info[key]['lab']
        lab_title = lab_info[key]['title_html']
        lab_due = format_date(lab_info[key]['due'], 1)
        latex_template = lab_info[key]['latex']
        semester_3 = format_semester(lab_info['1']['date'], 3)
        semester_8 = format_semester(lab_info['1']['date'], 8)
        body += '''
### Lab {:s}: {:s}
- Assignment due at 11:59 PM on {:s}'''.format(lab_no, lab_title,
                  lab_due)
        if i < current_lab:
            body += '''
- [zip]({:s}/courses/{:s}/MATH3341/zip/Math.3341.Lab.{:2s}.zip){:s},
  [slides]({:s}/courses/{:s}/MATH3341/slides/Math.3341.Lab.{:2s}.Slides.pdf){:s},
  [exercise]({:s}/courses/{:s}/MATH3341/exercise/Math.3341.Lab.{:2s}.pdf){:s},
  [overleaf template]({:s}){:s}
  <div>
    <video width="720" height="450" poster="https://video.libaoj.in/math-3341-{:2s}/MATH.3341.Lab.{:2s}.png" preload="none" controls>
      <source src="https://students.uwyo.edu/ljin1/MATH.3341.Lab.{:2s}.mp4" type="video/mp4">
      <source src="https://video.libaoj.in/math-3341-{:2s}/MATH.3341.Lab.{:2s}.mp4" type="video/mp4">
      <p>This browser does not support the video element, please change a browser.</p>
    </video>
  </div>
'''.format(base, semester_8, lab_no, target,
                     base, semester_8, lab_no, target,
                     base, semester_8, lab_no, target,
                     latex_template, target,
                     semester_3, lab_no,
                     lab_no,
                     semester_3, lab_no)
        else:
            body += '\n- zip, slides, exercise, overleaf template\n'

    return body

def generate_hw_md(hw_info, current_hw=2):
    body = '## MATH 3340 Homework Templates\n'
    base = '{{ site.baseurl }}'
    prefix = '{:s}/courses/{:s}/MATH3340'.format(base, format_semester(hw_info['date'], 8))
    target = '{:target="_blank"}'
    for i in range(1, 10):
        if i < 9:
            hw_type = 'Homework {:d}'.format(i)
            hw_file = 'Homework/{:d}/MATH.3340.Homework.{:d}.pdf'.format(i, i)
            zip_type = 'hw{:d}.zip'.format(i)
            zip_file = 'Homework/{:d}/hw{:d}.zip'.format(i, i)
        else:
            hw_type = 'Final Project'
            hw_file = 'MATH.3340.Final.Project.pdf'
            zip_type = 'final.zip'
            zip_file = 'final.zip'
        if i <= current_hw:
            body += '- [{:s}]({:s}/{:s}){:s}, [Overleaf Template]({:s}){:s}, [MATLAB Code Template: {:s}]({:s}/{:s}){:s}\n'.format(
                hw_type, prefix, hw_file, target, hw_info[str(i)], target, zip_type, prefix, zip_file, target)
        else:
            body += '- {:s}, Overleaf Template, MATLAB Code Template: {:s}\n'.format(hw_type, zip_type)

    return body

def generate_md(current_lab, current_hw, md_file):
    lab_info_file = './lab_info.json'
    hw_info_file = './hw_info.json'

    lab_info = dict()
    hw_info = dict()

    with open(lab_info_file, 'r') as f:
        lab_info = json.load(f)

    with open(hw_info_file, 'r') as f:
        hw_info = json.load(f)

    body = generate_header_md()
    body += '\n---\n'
    body += generate_lab_md(lab_info, current_lab)
    body += '\n---\n'
    body += generate_instruction_md()
    body += '\n---\n\n'
    body += generate_hw_md(hw_info, current_hw)

    with open(md_file, 'w') as f:
        f.write(body)

    return body

def generate_html():
    url_syllabus = 'courses/546700/files/57557116'
    url_remote_lab = 'courses/546700/files/57574273'
    url_latex_symbol = 'courses/546700/files/57557116'

    with open('lab_info.json', 'r') as f:
        lab_info = json.load(f)

    wyocourses_html = ''

    for i in range(1, 15):
        lab_no = title = lab_info[str(i)]['lab']
        title = 'Lab {:s}: {:s}'.format(lab_no, lab_info[str(i)]['title_html_literal'])

        url_lab_video = lab_info[str(i)]['wyocourses_link']
        url_overleaf = lab_info[str(i)]['latex']

        semester = format_semester(lab_info[str(i)]['date'], 8)
        semester_address = format_semester(lab_info[str(i)]['date'], 3)
        semester_cap = format_semester(lab_info[str(i)]['date'], 1).replace(' ', '.')

        template_file = 'lab_01_template.html' if i == 1 else 'lab_02_template.html'

        with open(template_file, 'r') as f:
            content = f.read()

        if i == 1:
            content_full = content.format(
                title,
                url_remote_lab,
                url_remote_lab, url_remote_lab,
                lab_no, semester, lab_no,
                semester, lab_no,
                semester,
                semester_address, lab_no,
                url_lab_video,
                url_lab_video, url_lab_video,
                url_overleaf,
                lab_no,
                url_latex_symbol,
                url_syllabus, url_syllabus, semester_cap
            )
        else:
            content_full = content.format(
                title,
                url_remote_lab,
                url_remote_lab, url_remote_lab,
                lab_no, semester, lab_no,
                semester, lab_no,
                semester,
                semester_address, lab_no,
                url_lab_video,
                url_lab_video, url_lab_video,
                url_overleaf,
                semester, lab_no, lab_no,
                url_latex_symbol,
                url_syllabus, url_syllabus, semester_cap
            )

        with open('wyocourses_lab_{:s}.html'.format(lab_no), 'w') as f:
            f.write(content_full)

        wyocourses_html += content_full + '\n\n'

    with open('wyocourses_lab.html', 'w') as f:
        f.write(wyocourses_html)

if __name__ == '__main__':
    start_date = '2021-08-23'
    if sys.argv[1] == '--update_lab_info':
        update_lab_info(start_date=start_date, skip_week=10, total_labs=14, lab_info_file='lab_info.json')
    elif sys.argv[1] == '--update_hw_info':
        update_hw_info(start_date=start_date, hw_info_file='hw_info.json')
    elif sys.argv[1] == '--generate_md':
        lab_no = int(sys.argv[2]) if len(sys.argv) >= 3 else 14
        math3340_hw_no = int(sys.argv[3]) if len(sys.argv) >= 4 else 9
        md_file = sys.argv[4] if len(sys.argv) >= 5 else './2021-08-23-math-3341-fall-2021.md'
        generate_md(lab_no, math3340_hw_no, md_file)
    elif sys.argv[1] == '--generate_html':
        generate_html()
    else:
        print('Syntax: ./generate_md.py arg1 [arg2] [arg3]')
        print('arg1:')
        print('    --update_lab_info: Update lab_info.json')
        print('    --update_hw_info:  Update hw_info.json')
        print('    --generate_html:   Generate HTML for WyoCourses')
        print('    --generate_md lab_no math3340_hw_no:     Generate Markdown for Course Page')
