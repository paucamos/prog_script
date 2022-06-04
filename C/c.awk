BEGIN {
    FS=";"
    counterH = 0
    counterD = 0
    science = 0
    mentalH = 0
    mentalD = 0
    seekH = 0
    seekD = 0
    counterMateries = 0
    problems = 0
    genHelp = 0

    # Anys
    a1 = 0
    a2 = 0
    a3 = 0
    a4 = 0
}
function calc_percentage(value, total) {
    return (value / total) * 100
}
{
    counterMateries ++

    if ($8 == 1 || $9 == 1 || $10 == 1) {
        problems ++
    }

    if ($11 == 1) {
        genHelp ++
    }

    if (tolower($4) ~ /science/ || tolower($4) ~ /math/ || tolower($4) ~ /engin/) {
        science ++
    }
    
    # Contador de homes i dones
    if ($2 == "Male" && tolower($4) ~ /science/ || tolower($4) ~ /math/ || tolower($4) ~ /engin/) {
        counterH ++
        if ($8 == 1 || $9 == 1 || $10 == 1) {
            mentalH ++
        }

        if ($11 == 1) {
            seekH ++
        }
    } 

    if ($2 == "Female" && tolower($4) ~ /science/ || tolower($4) ~ /math/ || tolower($4) ~ /engin/) {
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
            if (tolower($4) ~ /science/ || tolower($4) ~ /math/ || tolower($4) ~ /engin/) a1 ++;
            break
        case "2":
            if (tolower($4) ~ /science/ || tolower($4) ~ /math/ || tolower($4) ~ /engin/) a2 ++;
            break
        case "3":
            if (tolower($4) ~ /science/ || tolower($4) ~ /math/ || tolower($4) ~ /engin/) a3 ++;
            break
        case "4":
            if (tolower($4) ~ /science/ || tolower($4) ~ /math/ || tolower($4) ~ /engin/) a4 ++;
            break
    }
}
END {
    print "<!DOCTYPE html>"
    print "<html lang='es'>"
        print "<head>"
            print "<meta charset='UTF-8'>"
            print "<meta http-equiv='X-UA-Compatible' content='IE=edge'>"
            print "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
            print "<title>Presentació resultats</title>"
        print "</head>"
        print "<body>"
            print "<h1> Representació d'estudiants amb problemes de salud mental a les carreres científiques: </h1>"
            print "Homes a la ciencia: <b>" counterH "</b>, <b>" mentalH "</b> dels quals tenen algun problema de salud mental. <br>"
            print "Dones a la ciencia: <b>" counterD "</b>, <b>" mentalD "</b> de les quals tenen algun problema de salud mental. <br>"
            print "<br>"
            print "Això representa un " calc_percentage(mentalH, counterH) "% d'homes amb problemes de salud mental a les carreres cientifiques i "
            print "un " calc_percentage(mentalD, counterD) "% de dones."
            print "<br>"
            print "<br>"
            print seekH " homes diuen que han buscat ajuda mentres que "
            print " les dones, "seekD" de elles diuen que han buscat ajuda."
            print "Aixo es nomes un " calc_percentage(seekH+seekD, counterH+counterD) "% de persones que ha demanat ajuda."
            print "<br>"
            print "<br>"
            print "Podem veure que les carreres cientifiques representen un "calc_percentage(science, counterMateries)"% de totes les materies registrades"
            print "Ara mirarem el total de persones que tenen ansietat i veurem quin percentatge sol demanar ajuda."
            print "<br>"
            print "<br>"
            print "El "calc_percentage(problems, counterMateries)"% de persones sufreixen algun tipus de problema de salud mental, i un " calc_percentage(genHelp, counterMateries) "% de les quals ha demanat algun tipus de ajuda per superar-ho."
            print "<br>"
            print "<br>"
            print "<h2> Ara mirarem quines persones solen tenir mes ansietat segons l'any cursant</h2>"
            print "<h4> Distribució (H/D): </h4>"
            print "<table>"
                print "<tr>"
                    print "<th> Any </th>"
                    print "<th>Num. alumnes</th>"
                    print "<th> Percentatge (%) </th>"
                print "</tr>"
                print "<tr>"
                    print "<td> <b>1</b> </td>"
                    print "<td>"a1"</td>"
                    print "<td>"calc_percentage(a1, (a1+a2+a3+a4)) "%</td>"
                print "</tr>"
                print "<tr>"
                    print "<td> <b>2</b> </td>"
                    print "<td>"a2"</td>"
                    print "<td>"calc_percentage(a2, (a1+a2+a3+a4)) "%</td>"
                print "</tr>"
                print "<tr>"
                    print "<td> <b>3</b> </td>"
                    print "<td>"a3"</td>"
                    print "<td>"calc_percentage(a3, (a1+a2+a3+a4)) "%</td>"
                print "</tr>"
                print "<tr>"
                    print "<td> <b>4</b> </td>"
                    print "<td>"a4"</td>"
                    print "<td>"calc_percentage(a4, (a1+a2+a3+a4)) "%</td>"
                print "</tr>"
            print "</table>"
            print "<br>"
            print "<div id='tester' style='width:600px;height:250px;'>"
            print "<img src='plot.jpg'>"
            print "</div>"
            print "<br>"
            print "Podem veure com els estudiants de primer any de carreres cientifiques són els que més problemes de salud mental tenen dels 4 cursos representant així el " calc_percentage(a1, (a1+a2+a3+a4)) "% de estudiants amb problemes de ansietat, depressió o atacs de panic dins les seves carreres."
            print "Amb aquet resultat podriem arribar a la conclusio tinguent en compte el seguent: <br>"
            print "<br>"
            print "<h2> Hipótesis </h2>"
            print "A 1er i 2n, molts estudiants no saben si els i agrada la materia, solen haver-hi assignatures troncals que no tenen molt a veure amb la carrera i també, el canvi de batxillerat o cicles al model universitari porta a molts alumnes a posar-se nerviosos."
            print "<br>"
            print "<br>"
            print "Al 3er any normalment les assignatures son més pràctiques i més afins amb la carrera escollida, per veterania ja saps com van els examens i mes o menys ja t'has decidit si la carrera t'agrada o és lo teu."
            print "<br>"
            print "<br>"
            print "Al 4rt any hi sol haver una pujada deguda al treball de final de grau i a voler acabar ja la carrera."
        print "</body>"
    print "</html>"
}