#!/bin/bash

scores=$1
threads=$2

while read score
do
	mkdir $score && cd $score;
	while [ $( ps -u $USER | grep 'java' | wc -l ) -ge $threads ]; do sleep 1 ; done
	nextflow run pgscatalog/pgsc_calc \
		-r main \
		-profile singularity \
		-params-file /mnt/c/Users/PC/Desktop/work/skull/june/conf/params_1.yaml \
		--pgs_id $score \
		--min_overlap 0.000001 &> $score.log &
	sleep 0.5
	cd ../
done < $scores
