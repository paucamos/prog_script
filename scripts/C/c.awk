BEGIN {
    FS=";"
    NR > 1
    counterH = 0
    counterD = 0
    science = 0
    mentalH = 0
    mentalD = 0
    seekH = 0
    seekD = 0
    problems = 0
    genHelp = 0

    # Anys
    a1 = 0
    a2 = 0
    a3 = 0
    a4 = 0

    # Materies
    subjects[0] = "Ingenieria Informàtica"
    subjects[1] = "Ingenieria en Telecomunicacións"
    subjects[2] = "Ingenieria"
    subjects[3] = "Ciències biomèdiques"
    subjects[4] = "Ciències Marítimes"
    subjects[5] = "Ciències Humanes"
    subjects[6] = "Biotecnología"
    subjects[7] = "Matemàtiques"
    subjects[8] = "Ciència de dades"

    # Alumnes
    alumni[0] = 0
}
function calc_percentage(value, total) {
    return (value / total) * 100
}
function isScience(field) {
    if ($4 == "BCS" ||
        $4 == "BIT" ||
        $4 == "IT" ||
        tolower($4) ~ /science/ || 
        tolower($4) ~ /math/ || 
        tolower($4) ~ /engin/ ||
        tolower($4) ~ /technology/ ) {
        return 1
    }
}
{
    if ($8 == 1 || $9 == 1 || $10 == 1) {
        problems ++
    }

    if ($11 == 1) {
        genHelp ++
    }

    if (isScience($4)) {
        science ++
    }
    
    # Contador de homes i dones
    if ($2 == "Male" && isScience($4)) {
        counterH ++
        if ($8 == 1 || $9 == 1 || $10 == 1) {
            mentalH ++
        }

        if ($11 == 1) {
            seekH ++
        }
    } 

    if ($2 == "Female" && isScience($4)) {
        counterD ++
        if ($8 == 1 || $9 == 1 || $10 == 1) {
            mentalD ++
        }

        if ($11 == 1) {
            seekD ++
        }
    }

    switch ($5) {
        case "1":
            if (isScience($4)) {
                a1 ++;
                alumni[1] = a1
            }
            break
        case "2":
            if (isScience($4)) {
                a2 ++;
                alumni[2] = a2
            }
            break
        case "3":
            if (isScience($4)) {
                a3 ++;
                alumni[3] = a3
            }
            break
        case "4":
            if (isScience($4)) {
                a4 ++;
                alumni[4] = a4
            }
            break
    }
}
END {
print "<!DOCTYPE html>"
print "<html lang='en'>"
print "  <head>"
print "    <meta charset='UTF-8' />"
print "    <meta http-equiv='X-UA-Compatible' content='IE=edge' />"
print "    <meta name='viewport' content='width=device-width, initial-scale=1.0' />"
print "    <title>Document</title>"
print "    <link"
print "      href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css'"
print "      rel='stylesheet'"
print "      integrity='sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor'"
print "      crossorigin='anonymous'"
print "    />"
print "  </head>"
print "  <body>"
print "    <div class='col-lg-10 mx-auto p-3 py-md-5'>"
print "      <main>"
print "        <h1>"
print "          Representació d'estudiants amb problemes de salut mental als graus"
print "          científics."
print "        </h1>"
print "        <p class='col-md-8 mt-4'>"
print "		Les ciències en el nostre dataset estan compostes per els seguents graus."
print "		</p>"
print "		<table class='table'>"
print "			<thead>"
print "			  <tr>"
print "				<th scope='col'>#</th>"
print "				<th scope='col'>Nom del grau</th>"
print "			  </tr>"
print "			</thead>"
print "			<tbody>"
for ( i = 0; i < 9; i++ ) {
print "			  <tr>"
print "				<th scope='row'>"i+1"</th>"
print "				<td>"subjects[i]"</td>"
print "			  </tr>"
}
print "			</tbody>"
print "		</table>"
print "        <p class='fs-5 col-md-8 mt-2'>"
print "			Les assignatures científiques representen un <b>"substr(calc_percentage(science, NR-1),1,5)"</b>% de tots els registres."
print "		</p>"
print "        <p class='fs-5 col-md-8 mt-2'>"
print "		<h4>Resultats obtinguts</h4>"
print "		Hem trobat un total de <b>"counterH"</b> homes i <b>"counterD"</b> dones que cursen"
print "		graus d'Enginyeries, Matemàtiques i Ciències vàries."
print ""
print "		En aquets dos grups hem trobat que <b>"mentalH"</b> homes tenen o han tingut algun problema de salud mental com <b>depressió</b>, <b>ansietat</b> o <b>atacs de pànic</b> i només <b>"seekH"</b> dels quals ha demanat ajuda."
print "		En el cas de les dones, <b>"mentalD"</b> d'elles tenen problemes de salud mental i <b>"seekD"</b> han demanat algun tipus de ajuda."
print "<br>"
print "		Com podem veure son xifres força elevades."
print "        </p>"
print ""
print "		<div class='row mt-4'>"
print "			<div class='col-md-6'>"
print "				<h4>Problemes de salut mental per sexes</h4>"
print "				<table class='table'>"
print "					<thead>"
print "					  <tr>"
print "						<th scope='col'>Sexe</th>"
print "						<th scope='col'>Problemes salut mental (%)</th>"
print "					  </tr>"
print "					</thead>"
print "					<tbody>"
print "					  <tr>"
print "						<td>Masculí</td>"
print "						<td>"substr(calc_percentage(mentalH, counterH), 1, 5)"%</td>"
print "					</tr>"
print "					<tr>"
print "						<td>Femení</td>"
print "						<td>"substr(calc_percentage(mentalD, counterD), 1, 5)"%</td>"
print "					  </tr>"
print "					</tbody>"
print "				</table>"
print "			</div>"
print "			<div class='col-md-6'>"
print "				<h4>Demanda d'ajuda per sexes</h4>"
print "				<table class='table'>"
print "					<thead>"
print "					  <tr>"
print "						<th scope='col'>Sexe</th>"
print "						<th scope='col'>Busca d'ajuda (%)</th>"
print "					  </tr>"
print "					</thead>"
print "					<tbody>"
print "					  <tr>"
print "						<td>Masculí</td>"
print "						<td>"substr(calc_percentage(seekH, mentalH), 1, 5)"%</td>"
print "					</tr>"
print "					<tr>"
print "						<td>Femení</td>"
print "						<td>"substr(calc_percentage(seekD, mentalD), 1, 4)"%</td>"
print "					  </tr>"
print "					</tbody>"
print "				</table>"
print "			</div>"
print "			<div class='mx-auto text-center'>"
print "				<small>Només un <b>"substr(calc_percentage(seekH+seekD, mentalH+mentalD), 1, 5)"</b>% de persones dels dos sexes que han demanat ajud en total.</small>"
print "			</div>"
print "			<div class='col-md-12 mt-5'>"
print "				<h3>Any en el que es concentren més els problemes de salut mental</h3>"
print "				<small>Distribució (Home/Dona) en graus de ciències.</small>"
print "				<table class='table'>"
print "					<thead>"
print "					  <tr>"
print "						<th scope='col'>Any</th>"
print "						<th scope='col'>N. Alumnes</th>"
print "						<th scope='col'>Percentatge</th>"
print "					  </tr>"
print "					</thead>"
print "					<tbody>"
for ( i = 1; i <= 4; i++ ) {
print "					  <tr>"
print "						<th scope='row'>"i"</th>"
print "						<td>"alumni[i]"</td>"
                            j = 1
print "						<td>"substr(calc_percentage(alumni[i], (alumni[j]+alumni[j*2]+alumni[j*3]+alumni[j*4])), 1, 5)"%</td>"
print "					  </tr>"
}
print "					</tbody>"
print "				</table>"
print "				<h5>Gràfica dels resultats</h5>"
print "				<img src='./scripts/C/plot.jpg' alt='Gràfica distribució'>"
print "				<p>"
print "					Podem veure com el <b>"substr(calc_percentage(alumni[j], (alumni[j]+alumni[j*2]+alumni[j*3]+alumni[j*4])), 1, 5)"</b>% dels estudiants amb més problemes de salut mental als graus científics es concentren al primer any. <br>"
print "					Amb aquest resultat podem formular una hipòtesi."
print "				</p>"
print "			</div>"
print "			<div class='col-md-12 mt-4'>"
print "				<h4>Hipòtesis"
print "				</h4>"
print "			</div>"
print "			<p>"
print "				Podem veure que més de la meitat dels alumnes de graus com les enginyeries, matemàtiques i ciències vàries tenen un alt impacte a la salut mental dels estudiants. <br>"
print "             Podria ser per alguna d'aquestes raons següents:"
print "				<ul>"
print "					<li>A 1r i 2n, molts estudiants no saben si els i agrada la matèria, solen haver-hi assignatures troncals que no tenen molt a veure amb la grau i també, el canvi de batxillerat o cicles al model universitari porta a molts alumnes a posar-se nerviosos.</li>"
print "					<li>Al 3r any normalment les assignatures són més pràctiques i més afins amb la grau escollida, per veterania ja saps com van els exàmens i més o menys ja t'has decidit si el grau t'agrada. De totes maneres, això no significa que les assignatures i els exàmens siguin més senzills.</li>"
print "					<li>Al 4t any, els alumnes solen estar més tranquils, la pujada pot ser deguda al treball de final de grau i la seva defensa.</li>"
print "				</ul>"
print "				Això explicaria la distribució de la gràfica anterior."
print "			</p>		"
print "		</div>"
print "		"
print "		"
print "      </main>"
print "    </div>"
print "  </body>"
print "</html>"

}