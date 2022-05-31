#!/bin/bash
#Nom i cognoms de l'alumne: Pau Camós Parra
#Usuari de la UOC de l'alumne: paucamos
#Data: 30/05/2022

# Testing
#rm download
#rm sample.csv

# Main script
ID="https://opendata-ajuntament.barcelona.cat/data/dataset/15b349cd-3d4d-4a62-9ad3-d67230029a23/resource/3224123d-488e-4e03-9b64-ed278a9c3c79/download" 
curl -o raw_data.csv https://drive.google.com/uc?export=download&id=1jRvPwX7SzXI1o1ZLWyu2bXQuMF7ZDtvG

# Si l'script s'executa sense opcions, mostra la ID de descàrrega i el nombre de
# columnes i registres. 

# Si s'inclou en la seva invocació l'opció -v, a més,
# ha de mostrar el format del o dels fitxers i el tipus de dades de les seves columnes.

# Opcio sense -v
if [ -z "$1" ]; then
    echo "Numero de registres: $(wc -l < download)"
    echo "Numero de columnes: $(head -1 download | sed 's/[^,]//g' | wc -c)"

# Opcio amb -v
else
    echo "Numero de registres: $(wc -l < download)"
    echo "Numero de columnes: $(head -1 download | sed 's/[^,]//g' | wc -c)"
    echo "Tipus de fitxer: $(file -ib download)"
    echo "Data types columnes:"

    # Per mostrar les dades nomes necesitem una linea de dades
    sed -n 2p download > sample.csv

    # Delimitador
    IFS=","

    # Per mirar si es numeric o no
    integer='0-9'

    # Llegim el csv
    while read -r -a fields
    do
        for (( c=0; c<25; c++ ))
        do
            if [[ ${fields[c]} =~ [^$integer] ]]; then
                echo -n "numeric,"
            else
                echo -n "caracters,"
            fi
        done
        echo ""
    done < sample.csv
fi