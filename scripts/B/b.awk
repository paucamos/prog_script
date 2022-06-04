#! /usr/bin/awk -f
#Nom i cognoms de l'alumne: Pau Camós Parra
#Usuari de la UOC de l'alumne: paucamos
#Data: 30/05/2022
#Objectius de l'script: Cambiar els noms de les columnes
# per una lectura mes senzilla posteriorment
#Nom i tipus dels camps manipulats:  Columnes
BEGIN { 
    FS = ";"; 
    counter = 0;
    print "date;gender;age;course;current_year;GPA;marital_status;depression;anxiety;panic_attacks;seek_help;" > "b0.csv"
}
{
    # Si es el header l'ignorem
    if (counter != 0)
        print $0 >> "b0.csv"

    # Augmentem el contador
    counter ++
}