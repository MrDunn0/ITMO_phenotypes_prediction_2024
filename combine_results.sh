#!/bin/bash

mkdir results

find PGS* | grep aggregated | grep -v work > results/score_files.txt

echo -e "sampleset\tIID\tPGS\tSUM\tDENOM\tAVG" > results/results_combined.tsv
while read res
do
	echo "Reading $res"
	zcat $res | tail -n+2 >> results/results_combined.tsv
done < results/score_files.txt 
