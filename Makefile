CLLD_GRAMMAR = $(shell find *grammar -maxdepth 0 )
FLEXTEXT = $(shell find *flextext -maxdepth 0 )
LIFT = $(shell find *lift -maxdepth 0 )

.PHONY: indicogram

all:
	make setup
	make build

setup: install cldflex indicogram
	: "IF YOU ARE USING THE make COMMANDS, MAKE SURE YOUR PROJECT NAME ENDS IN 'grammar'"
	pylingdocs new # set up a new pylingdocs project

demofiles:
	curl https://github.com/fmatter/cldflex/blob/main/tests/data/apalai.flextext -o texts.flextext
	curl https://github.com/fmatter/cldflex/blob/main/tests/data/apalai.lift -o lexicon.lift

build:
	make pylingdocs
	make clld

install:
	pip3 install -r requirements.txt # install the toolchain

cldflex:
	cldflex flex2csv $(FLEXTEXT) --lexicon $(LIFT) --cldf # convert FLEx database to CLDF

indicogram:
	git clone https://github.com/fmatter/indicogram/ # download the CLLD app
	cd indicogram; pip install -e . # install it

pylingdocs:
	cd $(CLLD_GRAMMAR); pylingdocs cldf # build a CLDF dataset containing your pylingdocs document

clld:
	cd indicogram; clld initdb development.ini --cldf ../$(CLLD_GRAMMAR)/output/cldf/metadata.json; pserve --reload development.ini # set up CLLD database from CLDF datataset, run app