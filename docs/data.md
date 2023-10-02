# Creating a CLDF dataset

[CLDF](https://cldf.clld.org/) is a lightweight, human-readable format for linguistic data, using linked data in CSV files.
The [`cldfviz`](https://github.com/cldf/cldfviz/blob/main/docs/text.md) library offers the possibility to intersperse markdown with data.
[cldf-ldd](https://github.com/fmatter/cldf-ldd) is a set of cldf components designed to encode fieldwork data, used by both conversion libraries below.


* if you have a FLEx database, [click here](#flex)
* if you have a [shoebox](https://software.sil.org/shoebox/) or [toolbox](https://software.sil.org/toolbox/) database, [click here](#box)
* if you don't have a database, the `cldflex` repo contains example [flextext](https://github.com/fmatter/cldflex/blob/main/tests/data/apalai.flextext) and [lift](https://github.com/fmatter/cldflex/blob/main/tests/data/apalai.lift) files that you can use.
* you can also use some [other existing CLDF dataset](https://github.com/orgs/cldf-datasets/repositories) to go through the workflow

## FLEx

The [cldflex](https://fl.mt/cldflex) library can be used to convert FLEx databases into CSV files (and from there into CLDF datasets, if desired).
To get your corpus & lexicon ready for grammar writing, follow these steps:

1. export your FLEx text database as `.flextext`: Navigate to `Text & Words > Interlinear Texts`, open the `Analyzed` tab, use the menu `File > Export Interlinear...` and choose the first option ("ELAN, SayMore, FLEx"). You can include one or multiple texts.
2. export your FLEx lexicon as `.lift`: Navigate to `Lexicon`, use the menu `File > Export...` and choose the option "Full Lexicon (LIFT 0.13 XML)".
3. use `cldflex` to transform the contents of your `.flextext` and `.lift` files to a CLDF dataset:
```shell
`cldflex flex2csv <filename>.flextext --lexicon <filename>.lift --cldf`
```
Depending on the setup of your FLEx database, this will throw all sorts of warnings at you and complain about inconsistencies. You can fix them in your database, but things should mostly work even if you ignore them. If you think a particular warning is inaccurate, open an issue [here](https://github.com/fmatter/cldflex/issues/new).
4. [get writing](/pld)

## \*box

The [unboxer](https://fl.mt/unboxer) is a tool to convert shoe- and toolbox databases into CSV files (and from there into CLDF datasets, if desired).
To get your corpus & lexicon ready for grammar writing, follow these steps:

1. identify the path to your corpus database
2. identify the path to your lexicon
3. (optional) identify the path to your parsing database
4. run this command, inserting the paths:

```shell
unboxer corpus </path/to/corpus.db> --lexicon </path/to/lexicon.db> --parsing </path/to/parse.db> --cldf
```