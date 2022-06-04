#!/bin/bash
#Nom i cognoms de l'alumne:
#Usuari de la UOC de l'alumne:
#Data:
#Objectius de l'script: Modificar els camps Yes-No amb binaris (1-0)
#Nom i tipus dels camps manipulats: Depression; Anxiety; PanicAttacks; SeekHelp;

IFS=';'
while read -ra fields; do
    for i in {6..10};
    do
        if [ "${fields[$i]}" = "Yes" ]; then
            fields[$i]=1
        elif [ "${fields[$i]}" = "No" ]; then
            fields[$i]=0
        fi
    done
    
    echo "${fields[*]};" >> "b1.csv"
done < "$1"
