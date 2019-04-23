ls *_input.txt > list_x.txt
sed 's/_input.txt/_final.txt/g' list_x.txt > list_y.txt
max=`wc -l < ./list_x.txt`
qsub -cwd -V -N tisdeconv -l h_data=4G,h_rt=2:00:00, -t 1-$max:1 wrapper_tisdeconv.sh
