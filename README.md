# How to use your FLEx database to create a digital grammar

The goal of this tutorial is to document a workflow that starts with a glossed corpus in [FLEx](https://software.sil.org/fieldworks/) and results in a web app serving an interactive digital grammar.
It can be divided into three distinct steps:

1. convert FLEx exports to a CLDF corpus dataset with [`cldflex`](https://cldflex.readthedocs.io)
2. write linguistic description in [`pylingdocs`](https://pylingdocs.readthedocs.io) project
3. set up and serve a [`clld`](clld.org/) database using [this template](https://github.com/fmatter/indicogram/)

**Requirements**

* knowledge prerequisites: command line literacy ([this tutorial](https://github.com/dictionaria/pydictionaria/blob/master/docs/intro-commandline.md) by Johannes Englisch or [this LaunchSchool book](https://launchschool.com/books/command_line/read/introduction) may help)
* software prerequisites:
    * a working [python](https://www.python.org/) 3.7+ installation
    * [git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
    * optional: [Pandoc](https://pandoc.org/installing.html) (for output formats other than a CLLD app)

**Running into problems?**

1. please check first if your case is covered in [common problems](#common-problems). If this does not solve your problem, continue.
2. if it's evident that the error comes from one of the used python packages ([cldflex](https://github.com/fmatter/cldflex/issues), [pylingdocs](https://github.com/fmatter/pylingdocs/issues), [indicogram](https://github.com/fmatter/indicogram/issues)): click the respective link and open an issue. Otherwise, continue.
3. open an issue [here](https://github.com/fmatter/flex-grammar-tutorial/issues).

## Preliminaries
It is highly recommended that you create a [virtual environment](https://docs.python.org/3/library/venv.html) and then run all parts of this tutorial in that environment.

## Workflow
Note: Quick instructions are given in parentheses, making use of [this Makefile](Makefile).

### Export your FLEx data
1. export your FLEx text database as `.flextext` (into this folder)
2. export your FLEx lexicon as `.lift` (into this folder)

**If you just want to see the demo 🔥right now🔥**: `make` and then visit `localhost:6543` in your webbrowser.

### Set up software dependencies
First, install the python packages needed for the next two steps:
* `pip install -r requirements.txt` (`make install`)

### Create a CLDF version of your corpus
* `cldflex flex2csv texts.flextext --lexicon lexicon.lift --cldf` (`make cldflex`) [^1]

### Create a pylingdocs project based on that CLDF dataset
1. create a pylingdocs project (`pylingdocs new`, Makefile assumes something ending in "grammar")
2. (optional) write stuff! ([how to use pylingdocs](https://pylingdocs.readthedocs.io/en/latest/usage.html#quick-start))
3. create another CLDF dataset combining data and description (`pylingdocs cldf`)

### Set up a CLLD app
1. fork, clone or download [https://github.com/fmatter/indicogram/](https://github.com/fmatter/indicogram/) into this folder (`make indicogram` -- this also takes care of the next step)
2. `pip install -e indicogram` (`make indicogram` already took care of this)
3. build the `clld` database and serve it (`make clld`)
4. view the app in your webbroser at `localhost:6543`

## FAQ

## Common problems
Problems will be listed here.

[^1]: Depending on the setup of your FLEx database, this will throw all sorts of warnings at you and complain about inconsistencies. You can fix them in your database, but things should largely work even if you ignore them. If you think a particular warning is inaccurate, open an issue [here](https://github.com/fmatter/cldflex/issues).