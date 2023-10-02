# Getting started

You will need a computer, some time and focus, and maybe some coffee.
Ideally, you'll also have an existing database you would like to work with.

## Requirements

* **knowledge prerequisites: basic command line literacy**
    * [*Introduction to the Command Line* (book)](https://launchschool.com/books/command_line/)
    * [tutorial by Johannes Englisch](https://github.com/dictionaria/pydictionaria/blob/master/docs/intro-commandline.md)
* software prerequisites:
    * a working [python](https://wiki.python.org/moin/BeginnersGuide/Download) 3.7+ installation
    * [git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/) (version control system)
    * system-specific:
        * macOS: running `git` might ask you to install the [Xcode Command Line Tools](https://www.freecodecamp.org/news/install-xcode-command-line-tools/), do it
        * Windows: ?
        * Linux: you should be fine
    * [Pandoc](https://pandoc.org/installing.html) (2.8+) if you want to use `pylingdocs` for any output other than a CLLD app

## Setup
It is recommended that you create a directory for this tutorial, and store all data and execute all commands in that directory (`cd /path/to/your/grammar-tutorial`).

### Virtual environment
If you use python, it is [highly recommended](https://stackoverflow.com/questions/41972261/what-is-a-virtualenv-and-why-should-i-use-one) that you create a [virtual environment](https://docs.python.org/3/library/venv.html) and then run all commands from this tutorial in that environment.

=== "macOS & Linux"

    1. Create virtual environment in folder `env`:
    ```shell
    python -m venv env
    ```
    2. Activate environment from folder:
    ```shell
    source env/bin/activate
    ```

=== "Windows"

    1. Install virtualenv:
    ```shell
    pip install virtualenv
    ```
    2. Create virtual environment in folder `env`:
    ```shell
    virtualenv env
    ```
    2. Activate environment from folder:
    ```shell
    source env/bin/activate
    ```

### Python packages

The following packages are required for this guide:

* [pylingdocs](https://fl.mt/pylingdocs) for combining dataset and markdown
* [cldflex](https://fl.mt/cldflex) for extracting FLEx databases
* [unboxer](https://fl.mt/unboxer) for extracting \*box databases

Install them with:

```shell
pip install pylingdocs cldflex unboxer
```

### Set up the glottolog catalog

If you want to automatically recognize the language in your database, you will need to download the glottolog catalog with `cldfbench` to look up language metadata.
To do so, run the following command and say `y` to installing the glottolog catalog.
`cldfbench` will tell you where the catalog is stored so you can delete it if you don't want to keep it.

```shell
cldfbench catconfig
```

Alternatively, you can use `--corpus your_languages.csv` with `cldflex` or `unboxer` ([minimal example for file](https://github.com/fmatter/cldflex/blob/main/tests/data/languages.csv)).

