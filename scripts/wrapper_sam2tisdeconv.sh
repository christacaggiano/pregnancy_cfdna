echo $SGE_TASK_ID
./sam2tisdeconv.sh `sed -n ${SGE_TASK_ID}p ./list_sam.txt` `sed -n ${SGE_TASK_ID}p ./list_tisdeconv.txt` `sed -n ${SGE_TASK_ID}p ./list_tisdeconv_input.txt` 
