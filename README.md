# MATH 3341: Introduction to Scientific Computing

## Setup

You need to install Python3, Pandoc, LaTeX, and Make. On macOS, you need to install Homebrew first.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Python3: [Download Python | Python.org](https://www.python.org/downloads/) or you can simply install it using Homebrew: `brew install python`.
- Pandoc: [Pandoc - Installing pandoc](https://pandoc.org/installing.html) or you can simply install it using Homebrew: `brew install pandoc`.
- LaTeX: [Get LaTeX - Mac OS, Windows, Linux (latex-project.org)](https://www.latex-project.org/get/#ctan) or you can simply install it using Homebrew `  brew install --cask mactex`.

* Make: Install it using Homebrew: `brew install make`.

Before proceeding, make sure that you have set up the environment variable `PATH` correctly, which includes the path to `python3`, `pandoc`, `make`. You can run the following to make sure it is set up correctly:

```bash
python3 --version
pandoc --version
make --version
```

## Compiling

Open Terminal and then type the following command to clone the repo and change current directory to `courses/template`
```bash
git clone git@github.com:jinlibao/math-3341.git
cd math-3341
cd courses/template
```

Use an editor to open and update `update_course_info.py` file, for example, the `start_date`, `skip_week`, `teacher`. Once it is done, you can just run the python file to update course info by running the following script:
```
./update_course_info.py
```

Go to `courses/template/MATH3341` and run `generate_files.sh` to generate slides, lab reports, and etc.

You can go back to `courses/template` and run `update_math_3341.sh last_lab_number last_math_3340_number` or `update_math_3341.sh last_lab_number last_math_3340_number` to update the files and update the post. For example,

```bash
./update_math_3340.sh 3 4 # Add MATH 3340 homework 4
./update_math_3341.sh 3 4 # Add MATH 3341 homework 3
./update_post.sh 3 4      # Update post
```

## License

The MIT License
