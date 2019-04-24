#!/bin/bash                         

#$ -S /bin/bash                     
#$ -cwd                            
#$ -l mem_free=10G                 
#$ -l scratch=10G         
#$ -l h_rt=336:00:00
#$ -t 1-22


conda activate py36

BAM_FILE=$1 

# index and create chromosome bam files 

if [[ ! -e $BAM_FILE".bam" ]]; then
	samtools index $BAM_FILE".bam"
fi

samtools view -bh $BAM_FILE".bam" "chr"$SGE_TASK_ID > $BAM_FILE"_chr"$SGE_TASK_ID".bam"

samtools view -h $BAM_FILE"_chr"$SGE_TASK_ID".bam" > $BAM_FILE"_chr"$SGE_TASK_ID".sam" 

INPUT=$BAM_FILE"_chr"$SGE_TASK_ID".sam"
OUTPUT1=$BAM_FILE"_chr"$SGE_TASK_ID"_deconv.txt" 
OUTPUT2=$BAM_FILE"_chr"$SGE_TASK_ID"_deconv_input.txt" 

awk '{print $3,$4,$15}' $INPUT > $OUTPUT1
sed -i 's/XM:Z://g' $OUTPUT1
sed -i 's/-//g' $OUTPUT1
sed -i 's/x/0/g' $OUTPUT1
sed -i 's/y//g' $OUTPUT1
sed -i 's/z//g' $OUTPUT1
sed -i 's/X/1/g' $OUTPUT1
sed -i 's/Y//g' $OUTPUT1
sed -i 's/Z//g' $OUTPUT1
sed -i 's/ /\t/g' $OUTPUT1
awk 'NF == 3' $OUTPUT1 > $OUTPUT2