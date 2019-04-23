awk '{print $3,$4,$15}' $1 > $2
sed -i 's/XM:Z://g' $2
sed -i 's/-//g' $2
sed -i 's/x/0/g' $2
sed -i 's/y//g' $2
sed -i 's/z//g' $2
sed -i 's/X/1/g' $2
sed -i 's/Y//g' $2
sed -i 's/Z//g' $2
sed -i 's/ /\t/g' $2
awk 'NF == 3' $2 > $3

