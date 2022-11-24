# How to write a digital grammar based on a FLEx database

The goal of this tutorial is to document a workflow that starts with a glossed corpus in [FLEx](https://software.sil.org/fieldworks/) and ends at a web app serving an interactive digital grammar.

* knowledge prerequisites: command line literacy ([this tutorial](https://github.com/dictionaria/pydictionaria/blob/master/docs/intro-commandline.md) by Johannes Englisch may help)
* software prerequisites:
    * a working [python](https://www.python.org/) 3.7+ installation
    * [git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
    * optional: [Pandoc](https://pandoc.org/installing.html) (for other output formats)


**Running into problems?**
    * please check first if your case is covered in [common problems](#common-problems)
    * if not: [open an issue](https://github.com/fmatter/flex-grammar-tutorial/issues)

Breakdown of the workflow:
1. convert FLEx exports to CLDF corpus dataset with `cldflex`
2. write content in `pylingdocs` project
3. create `clld` app

## Preliminaries
1. It is highly recommended that you create a [virtual environment](https://docs.python.org/3/library/venv.html) and then run all parts of this tutorial in that environment.

## Workflow

**If you just want to see the demo 🔥right now🔥**: `make` and then visit [localhost:6543](https://localhost:6543).

Note: Quick instructions are given in parentheses.

### Setting up for the project
First, install the python packages needed for the next two steps:
* `pip install -r requirements.txt` (`make install`)

### Creating the CLDF dataset
1. export your FLEx text database as `.flextext` (put in `flex` directory)
2. export your FLEx lexicon as `.lift` (put in `flex` directory)
3. `cldflex flex2csv flex/texts.flextext --lexicon flex/lexicon.lift --cldf` (`make cldflex`)

### Creating a pylingdocs project
1. create a pylingdocs project (`pylingdocs new`, Makefile assumes something ending in "grammar")
2. (optional) and write stuff!
2. create a CLDF dataset that contains your description (`pylingdocs cldf`)

### Set up a CLLD app
1. fork, clone or download [https://github.com/fmatter/indicogram/](https://github.com/fmatter/indicogram/) into this folder (`make indicogram` -- this also takes care of the next step)
2. `pip install -e indicogram` (`make indicogram` already took care of this)
3. build the `clld` database and serve it (`make clld`)
4. view the preview under [localhost:6543](https://localhost:6543)

## FAQ
* what is behind all this?
    * it's-a me fl.mt/

## Common problems
* I don't understand.