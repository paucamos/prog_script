#! /usr/bin/awk -f
#Nom i cognoms de l'alumne: Pau Camós Parra
#Usuari de la UOC de l'alumne: paucamos
#Data: 30/05/2022
#Objectius de l'script: Formatar l'any
#Nom i tipus dels camps manipulats:  Any, string
BEGIN { FS = ";"; counter = 0;}
{

    # Li fem un append a un fitxer csv
    if (counter != 0) {
        $0 = $1";"$2";"$3";"$4";"substr($5, 6)";"$6";"$7";"$8";"$9";"$10";"$11";"
    }
    print $0 >> "b2.csv"
    counter ++
}