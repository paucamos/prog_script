start=`date +%s`

# Script A
(cd './' ; ./a.sh [-v])

# Scripts B
(cd './' ; gawk -f b.awk 'raw_data.csv')
(cd './' ; ./b.sh 'b0.csv')
(cd './' ; gawk -f b1.awk 'b1.csv')

# Script C
(cd './' ; gawk -f c.awk 'b2.csv') > index.html
end=`date +%s`
runtime=$((end-start))

echo "********************************"
echo "Temps d'execució: " $runtime "s"