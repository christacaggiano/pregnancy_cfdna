#!/bin/bash        

DIR=$1

cd $DIR
for filename in *.bam; do
	prefix=$(echo $filename | cut -f 1 -d '.')
	qsub ../divide.sh $prefix
done
