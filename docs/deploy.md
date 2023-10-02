# Distributing

## MkDocs

## CLLD
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