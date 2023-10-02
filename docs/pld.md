# Writing

[pylingdocs](https://fl.mt/pylingdocs) is a markdown processor using the [cldfviz](https://github.com/cldf/cldfviz/blob/main/docs/text.md) library.
It converts markdown into a variety of formats, provides most functionalities needed for linguistics papers, and is customizable.

## Project setup
1. create a new pylingdocs project:
```shell
pylingdocs new
```
You will be asked some project setup prompts; the crucial one asks for the location of of the metadata JSON file of your CLDF dataset.

2. (optional) write stuff! ([how to use pylingdocs](https://fl.mt/pylingdocs/usage/#quick-start))
3. create a new CLDF dataset combining data and text:

```shell
cd <path/to/pld-project>
pylingdocs cldf
```

