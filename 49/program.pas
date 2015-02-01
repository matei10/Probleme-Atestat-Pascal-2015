(* Scrieți programul C/C++ care citeşte de la tastatură două şiruri de caractere *)
(* s1 şi s2 și verifică dacă șirul s2 este o codificare „shift” a șirului s1 (o *)
(*     codificare „shift” se obţine din s1 prin adăugarea la codul ASCII al *)
(*     fiecărui caracter din s1 a unei constante k) și afişează în caz afirmativ *)
(*     valoarea lui k sau mesajul „NU” în caz contrar. *)
(*     Ex: Pentru şirurile s1=”acdrtu” şi s2=”ceftvx” se afişează k=2. *)
program atestat_2015_49;
var k, i :integer;
    ok :boolean;
    s1, s2 :string;

{ ATENTIE :
    Exemplul este prost ! 
    O sa va scriu codu asci a literelor din exemplu :
        'a' -> 97
        'c' -> 99
        'd' -> 100
        'r' -> 114
        't' -> 116
        'u' -> 117
        ---
        'c' -> 99
        'e' -> 101
        'f' -> 102
        't' -> 116
        'v' -> 118
        'x' -> 120

    Dupa cum vedeti codurile asci a tuturor cifrelor difera cu 2 unitati cu
    exceptia ultimelor litere 'u' si 'x' care difera cu 5 unitati ... 
    daca folosim ca exemplu doar 'acdrt'  si 'ceftv' atunci o sa ni se afiseze
    2, dar folosind exemplu lor o sa ni se afiseze 'NU' deoarece ultima cifra
    nu respecta regula 
}

{ Obs. Metoda de rezolvare 
    - citim 's1' si 's2'
    - verificam daca lungimea lui 's1' este egala cu lungimea lui 's2' , daca
      cele doua lungimi nu sunt egale nu are rost sa incercam sa aflam k-ul
        -  daca cele doua lungimi sunt egale aflav valloarea posibila a lui 'k' 
        din valoarea ASCI a primului caracter din 's2' scadem valoare ASCI a primului 
        caracter din 's1' si asa obtinem o valoare pentru k, aceasta valoare 
        trebuie sa se verifice si pentru  restu caracterelor
    - variabila 'ok' va fi cea pe care o vom manipula sa vedem daca's2' este o
      codificare "shift" a lui 's1'
}


{ Program Principal }
begin
write('s1=');
readln(s1);

write('s2=');
readln(s2);


{ verificam daca lungimile celor doua siruri de caractere sunt egale }
if length(s1) = length(s2) then
    begin
    ok := true; { presupunem ca 's2' ar fi o codificare a lui 's1 }

    k := ord(s2[1]) - ord(s1[1]); { din codul asci al primului caracter din
                                's2' scadem codul asci al primului caracter din 's1' }

    { verificam daca valoare lui 'k' se verifica si pentru restul elementelor }
    for i := 2 to length(s1) do { folosim i care sa parcurga restul elementelor
                                    din 's1' si 's2' }
        if (ord(s2[i]) - ord(s1[i])) <> k then  { daca codu asci al literei
                corespunzatoare din 's2' nu difera prin 'k' unitati de codul asci a
                literei corespunzatoare din 's1' atunci 's2' nu e o codificare a lui
                's1' }
                ok := false;
    end
else { daca nu sunt egale atunci 's2' nu poate fi o codificare a lui 's1'}
    ok := false;




{ verificam variabila 'ok' sa vedem daca 's2' este sau nu o codificare }
if ok then
    writeln(k) { daca 'ok' este 'true' atunci afisam 'k'-ul }
else
    writeln('NU'); {daca 'ok' este false afisam 'NU' }

readln;
end.

{ Obs.
    ord = returneaza codul ASCI a unui caracter 
}
