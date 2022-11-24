# How to write a digital grammar based on a FLEx database

The goal of this tutorial is to document a workflow that starts with a glossed corpus in [FLEx](https://software.sil.org/fieldworks/) and ends at a web app serving an interactive digital grammar.

* Knowledge prerequisites: command line literacy ([this tutorial](https://github.com/dictionaria/pydictionaria/blob/master/docs/intro-commandline.md) by Johannes Englisch may help)
* Software prerequisites:
    * a working [python](https://www.python.org/) 3.7+ installation
    * [git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
    * optional (if you want to compile other output formats, too): [Pandoc](https://pandoc.org/installing.html)

Breakdown of the workflow:
1. convert FLEx exports to CLDF corpus dataset with `cldflex`
2. create `pylingdocs` project
3. create `clld` app

## Preliminaries
1. It is highly recommended that you create a [virtual environment](https://docs.python.org/3/library/venv.html) and then run all parts of this tutorial in that environment.

## Workflow

**TLDR**: `make`

### Setting up for the project
* Install the requirements: `pip install -r requirements.txt` (`make install`)

### Creating the CLDF dataset
1. export your FLEx text database to the `flex` directory (Makefile looks for `.flextext` in the `flex` folder)
2. export your FLEx lexicon as `.lift` to the `flex` directory (Makefile looks for `.lift` in the `flex` folder)
3. `cldflex flex2csv flex/texts.flextext --lexicon flex/lexicon.lift --cldf` (`make cldflex`)

### Creating a pylingdocs project
1. create a pylingdocs project (`pylingdocs new`) and write stuff (Makefile assumes something ending in "grammar")
2. `pylingdocs cldf`

### Set up a CLLD app
1. fork, clone or download [https://github.com/fmatter/indicogram/](https://github.com/fmatter/indicogram/) into this folder (`make indicogram`)
2. build the `clld` database and serve it (`make clld`)