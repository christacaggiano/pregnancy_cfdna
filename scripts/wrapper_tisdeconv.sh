echo $SGE_TASK_ID
./tisdeconv.sh `sed -n ${SGE_TASK_ID}p ./list_x.txt` `sed -n ${SGE_TASK_ID}p ./list_y.txt` 
