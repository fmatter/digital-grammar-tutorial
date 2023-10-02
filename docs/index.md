---
hide:
  - navigation
---

# How to use your FLEx database to create a digital grammar
Cite as:

    Matter, Florian. 2022. How to use your FLEx database to create a digital grammar. https://github.com/fmatter/flex-grammar-tutorial/releases/tag/v0.0.2
The goal of this tutorial is to showcase a workflow that starts with a glossed corpus from [FLEx](https://software.sil.org/fieldworks/) and creates a web app serving an interactive digital grammar.
It can be divided into three distinct steps:

1. convert FLEx exports to a CLDF corpus dataset with [`cldflex`](https://cldflex.readthedocs.io)
2. write linguistic description in a [`pylingdocs`](https://pylingdocs.readthedocs.io) project
3. set up and serve a [`clld`](clld.org/) database using [this template](https://github.com/fmatter/indicogram/)

**Requirements**

* knowledge prerequisites: command line literacy ([this tutorial](https://github.com/dictionaria/pydictionaria/blob/master/docs/intro-commandline.md) by Johannes Englisch or [this LaunchSchool book](https://launchschool.com/books/command_line/read/introduction) may help)
* software prerequisites:
    * a working [python](https://www.python.org/) 3.7+ installation
    * [git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
    * system-specific:
        * macOS: [Xcode Command Line Tools](https://www.freecodecamp.org/news/install-xcode-command-line-tools/) (`xcode-select --install`)
        * windows: ?
        * Linux: you should be fine
    * optional: [Pandoc](https://pandoc.org/installing.html) if you want to use `pylingdocs` for output formats other than a CLLD app

**Running into problems?**

1. please check first if your case is covered in [common problems](#3-common-problems). If this does not solve your problem, continue.
2. if it's evident that the error comes from one of the used python packages ([cldflex](https://github.com/fmatter/cldflex/issues), [pylingdocs](https://github.com/fmatter/pylingdocs/issues), [indicogram](https://github.com/fmatter/indicogram/issues)): click the respective link and open an issue. Otherwise, continue.
3. open an issue [here](https://github.com/fmatter/flex-grammar-tutorial/issues).

## 0 Preliminaries
It is highly recommended that you create a [virtual environment](https://docs.python.org/3/library/venv.html) and then run all parts of this tutorial in that environment:

```shell
python -m venv env
source env/bin/activate
```

## 1 Workflow
Note: [the Makefile](Makefile) contains a list of command definitions.
Where applicable, steps below will have an `make X` instruction in parentheses.

### 1.2 Export your FLEx data
1. export your FLEx text database as `.flextext` (into this folder)
2. export your FLEx lexicon as `.lift` (into this folder)

**If you just want to see the demo 🔥right now🔥**: run `make all` and visit `localhost:6543` in your webbrowser.

(If you don't have usable FLEx data, the `cldflex` repo contains example [flextext](https://github.com/fmatter/cldflex/blob/main/tests/data/apalai.flextext) and [lift](https://github.com/fmatter/cldflex/blob/main/tests/data/apalai.lift) files that you can use [`make demofiles`])

### 1.3 Set up software dependencies
Install the python packages needed for the next two steps (`make install`):

```shell
pip install -r requirements.txt
```

### 1.4 Set up the glottolog catalog

If you want to follow this tutorial to the letter, you will need to download the glottolog catalog with `cldfbench` so that language metadata can be looked up.
To do so, run the following command and say `y` to installing the glottolog catalog (`make glottolog`).
`cldfbench` will tell you where the catalog is stored so you can delete it if you don't want to keep it.

```shell
cldfbench catconfig
```

Alternatively, you can provide a `languages.csv` file to `cldflex` ([minimal example](https://github.com/fmatter/cldflex/blob/main/tests/data/languages.csv)).

### 1.5 Create a CLDF version of your corpus
Next, use `cldflex` to transform the contents of your `.flextext` and `.lift` files to a CLDF dataset (`make cldflex`):[^1]

```shell
`cldflex flex2csv <filename>.flextext --lexicon <filename>.lift --cldf`
```

Note that you can also create a CLDF dataset in some other way, e.g. by using [`cldfbench`](https://cldfbench.readthedocs.io), or you can work with an existing dataset.

### 1.6 Create a pylingdocs project based on that CLDF dataset
1. create a pylingdocs project (the Makefile looks for an ID ending in `grammar`!)

```shell
pylingdocs new
```
You will be asked some project setup prompts; the crucial one asks for the location of your CLDF dataset.
If you followed the instructions so far, the default (`cldf/metadata.json`) should work; otherwise, enter the path to your dataset.

2. (optional) write stuff! ([how to use pylingdocs](https://pylingdocs.readthedocs.io/en/latest/usage.html#quick-start))
3. create another CLDF dataset combining data and description (`make pylingdocs`):

```shell
cd your-grammar; pylingdocs cldf
```

### 1.7 Set up a CLLD app
1. fork, clone or download [this repo](https://github.com/fmatter/indicogram/) into this folder and install it (`make indicogram` does both):


```shell
pip install -e indicogram
```

2. build the `clld` database and serve it (`make clld`):

```shell
cd indicogram
clld initdb development.ini --cldf ../your-grammar/output/cldf/metadata.json
pserve --reload development.ini
```

3. view the app in your webbroser at `localhost:6543`

## 2 FAQ

## 3 Common problems
Problems will be listed here.

[^1]: Depending on the setup of your FLEx database, this will throw all sorts of warnings at you and complain about inconsistencies. You can fix them in your database, but things should largely work even if you ignore them. If you think a particular warning is inaccurate, open an issue [here](https://github.com/fmatter/cldflex/issues).