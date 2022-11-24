CLLD_GRAMMAR = $(shell find *grammar -maxdepth 0 )
FLEXTEXT = $(shell find *flextext -maxdepth 0 )
LIFT = $(shell find *lift -maxdepth 0 )

.PHONY: indicogram

all:
	make setup
	make build

setup: install cldflex indicogram
	pylingdocs new

build:
	make pylingdocs
	make clld

install:
	pip3 install -e /home/florianm/Dropbox/development/cldflex/
	pip3 install -e /home/florianm/Dropbox/development/pylingdocs
	pip3 install -e /home/florianm/Dropbox/development/clld-plugins/clld-*

cldflex:
	cldflex flex2csv $(FLEXTEXT) --lexicon $(LIFT) --cldf

indicogram:
	cd indicogram; pip install -e .

pylingdocs:
	cd $(CLLD_GRAMMAR); pylingdocs cldf

clld:
	cd indicogram; clld initdb development.ini --cldf ../$(CLLD_GRAMMAR)/output/cldf/metadata.json; pserve --reload development.ini