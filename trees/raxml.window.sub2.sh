#!/bin/bash -l

FILE_ID=$1
INDIR=$2
OUTDIR=$3
WINDOW_FILE=$4
WINDOW_LINE=$5
MODEL=$6
MINSITES=$7
SKIPFASTA=$8
OUTGROUPS="$9"

date
echo "Script: raxml_window.sub2.sh"
echo "Script: raxml.scaffold.sub.sh"
echo "File ID: $FILE_ID"
echo "Input dir: $INDIR"
echo "Output dir: $OUTDIR"
echo "Window file: $WINDOW_FILE"
echo "Window line: $WINDOW_LINE"
echo "Model: $MODEL"
echo "Minimum number of sites: $MINSITES"
echo "Skip fasta step: $SKIPFASTA"
echo "Outgroups: $OUTGROUPS"

for WINDOW_LINE in $(seq 1 $(cat $WINDOW_FILE | wc -l))
do
	echo "Window line: $WINDOW_LINE"
	scripts/trees/raxml.window.sub.sh $FILE_ID $INDIR $OUTDIR $WINDOW_FILE $WINDOW_LINE $MODEL $MINSITES $SKIPFASTA "$OUTGROUPS"
done


echo "Done with script."
date