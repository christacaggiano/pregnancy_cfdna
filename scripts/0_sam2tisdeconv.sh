ls *.sam > list_sam.txt
sed 's/.sam/_sorted_CG_tisdeconv.txt/g' list_sam.txt > list_tisdeconv.txt
sed 's/.sam/_sorted_CG_tisdeconv_input.txt/g' list_sam.txt > list_tisdeconv_input.txt
max=`wc -l < ./list_sam.txt`
qsub -cwd -V -N Sam2Tisdeconv -l h_data=6G,h_rt=2:00:00 -t 1-$max:1 wrapper_sam2tisdeconv.sh
