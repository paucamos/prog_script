start=`date +%s`

# Script A
(cd 'scripts/A' ; ./a.sh [-v])

# Scripts B
(cd 'scripts/B' ; gawk -f b.awk '../A/raw_data.csv')
(cd 'scripts/B' ; ./b.sh 'b0.csv')
(cd 'scripts/B' ; gawk -f b1.awk 'b1.csv')

# Script C
(cd 'scripts/C' ; gawk -f c.awk '../B/b2.csv') > index.html
end=`date +%s`
runtime=$((end-start))

echo "********************************"
echo "Temps d'execució: " $runtime "s"