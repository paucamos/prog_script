#!/bin/bash
#Nom i cognoms de l'alumne: Pau Camós Parra
#Usuari de la UOC de l'alumne: paucamos
#Data: 30/05/2022

# Testing
#rm download
#rm sample.csv
#rm raw_data.csv

# Main script
URL="https://raw.githubusercontent.com/paucamos/prog_script/main/raw_data.csv" 
wget -nv $URL

# Si l'script s'executa sense opcions, mostra la URL de descàrrega i el nombre de
# columnes i registres. 

# Si s'inclou en la seva invocació l'opció -v, a més,
# ha de mostrar el format del o dels fitxers i el tipus de dades de les seves columnes.

# Opcio sense -v
if [ -z "$1" ]; then
    echo "Numero de registres: $(wc -l < raw_data.csv)"
    echo "Numero de columnes: $(head -1 raw_data.csv | sed 's/[^,]//g' | wc -c)"

# Opcio amb -v
else
    echo "Numero de registres: $(wc -l < raw_data.csv)"
    echo "Numero de columnes: $(head -1 raw_data.csv | sed 's/[^,]//g' | wc -c)"
    echo "Tipus de fitxer: $(file -ib raw_data.csv)"
    echo "Data types columnes:"

    # Per mostrar les dades nomes necesitem una linea de dades
    sed -n 2p raw_data.csv > sample.csv

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