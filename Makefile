CLLD_GRAMMAR = $(shell find *grammar -maxdepth 0 )
FLEXTEXT = $(shell find flex/*flextext -maxdepth 0 )
LIFT = $(shell find flex/*lift -maxdepth 0 )

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
    pip3 install -r requirements.txt

cldflex:
    cldflex flex2csv $(FLEXTEXT) --lexicon $(LIFT) --cldf

indicogram:
    git clone https://github.com/fmatter/indicogram/
    cd indicogram; pip install -e .

pylingdocs:
    cd $(CLLD_GRAMMAR); pylingdocs cldf

clld:
    cd indicogram; clld initdb development.ini --cldf ../$(CLLD_GRAMMAR)/output/cldf/metadata.json; pserve --reload development.ini