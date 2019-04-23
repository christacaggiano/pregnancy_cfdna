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
if test -f "$FILE"; then
    samtools index $BAM_FILE".bam"
	samtools view -bh $BAM_FILE".bam" "chr"$SGE_TASK_ID > $BAM_FILE"_chr"$SGE_TASK_ID".bam"
fi

view -h -o out.sam in.bam