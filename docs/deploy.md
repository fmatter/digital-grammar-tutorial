# Distributing

## MkDocs

Pylingdocs creates output using [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) ([example](https://caribank.github.io/yawarana-sketch/)).
[MkDocs](https://www.mkdocs.org/) projects can easily be deployed to github pages.

1. set up a git repo in your pylingdocs project folder and synchronise with github
2. navigate to the `mkdocs` output directory:
```shell
cd output/mkdocs
```
3. deploy to github pages:
```shell
mkdocs gh-deploy
```

## CLLD

CLLD apps are not static sites, but powerful web apps ([example](https://yawarana-sketch.herokuapp.com/)).

1. download [this repo](https://github.com/fmatter/indicogram/archive/refs/heads/main.zip) and install it:
```shell
pip install -e indicogram
```

2. build the `clld` database and serve it:
```shell
cd indicogram
clld initdb development.ini --cldf ../your-grammar/output/cldf/metadata.json
pserve --reload development.ini
```

3. view the app in your webbrowser at `localhost:6543`