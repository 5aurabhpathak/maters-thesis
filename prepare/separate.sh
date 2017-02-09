#!/bin/bash
#Author: Saurabh Pathak
#separates randomly a number of sentences out of the training pipeline for isolation and possible reuse in later stages.
if [ $# -ne 1 ]
then
	echo "Usage: separate.sh [number of pairs to isolate]"
	exit 1
fi
cd $THESISDIR/prepare
./select_random.py -f hi -en en -k $1 --prefix ../data/corpus/bilingual/parallel/IITB.en-hi.clean --output-dir ../data/corpus/bilingual/parallel/
cd ../data/corpus/bilingual/parallel
mkdir -p lc
$SCRIPTS_ROOTDIR/tokenizer/lowercase.perl < IITB.en-hi.train.en > lc/IITB.en-hi.train.en
cp -n IITB.en-hi.train.hi lc/IITB.en-hi.train.hi
exit 0
