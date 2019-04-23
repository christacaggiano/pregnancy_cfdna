ls *.bam > list_bam.txt
sed 's/.bam/.sam/g' list_bam.txt > list_sam.txt
max=`wc -l < ./list_bam.txt`
qsub -cwd -V -N Bam2Sam -l h_data=6G,h_rt=2:00:00 -t 1-$max:1 wrapper_bam2sam.sh
