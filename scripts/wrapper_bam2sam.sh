echo $SGE_TASK_ID
./bam2sam.sh `sed -n ${SGE_TASK_ID}p ./list_bam.txt` `sed -n ${SGE_TASK_ID}p ./list_sam.txt` 
