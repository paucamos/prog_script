#! /usr/bin/awk -f
#Nom i cognoms de l'alumne: Pau Camós Parra
#Usuari de la UOC de l'alumne: paucamos
#Data: 30/05/2022
#Objectius de l'script: Cambiar els noms de les columnes
#Nom i tipus dels camps manipulats:  Columnes
BEGIN { FS = ";" }
{
    new_cols["1"]="Date"
    new_cols["2"]="Gender"
    new_cols["3"]="Age"
    new_cols["4"]="Course"
    new_cols["5"]="CurrentYear"
    new_cols["6"]="CGPA"
    new_cols["7"]="MaritalStatus"
    new_cols["8"]="Depression"
    new_cols["9"]="Anxiety"
    new_cols["10"]="PanicAttacks"
    new_cols["11"]="SeekHelp"

    for(i=1;i<=NF;i++) 
        $i = new_cols[i]
    
    for(i=1; i<=12; i++) 
        printf $i " "

    print ""
    exit   
} 1