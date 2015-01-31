(* Se consideră un text cu maximum 255 de caractere în care cuvintele sunt *)
(* separate prin unul sau mai multe spaţii. Primul caracter din textul citit este *)
(* o literă, iar cuvintele sunt formate numai din litere mici ale alfabetului *)
(* englez. Scrieţi un program C/C++ care citeşte de la tastatură textul şi îl *)
(* transformă înlocuind prima literă a fiecărui cuvânt cu litera mare *)
(* corespunzătoare, restul caracterelor rămânând nemodificate. Textul astfel *)
(* transformat va fi afişat pe ecran. *)
(* Exemplu: Pentru textul ana are     mere se va afişa pe ecran Ana Are     Mere. *)
program atestat_2015_45;
var s :string;
    i :integer;

{ Obs. Metoda de rezolvare 
    - citim textul in variabila 's'
    - parcurgem fiecare element a lui 's'
        - cand dam de un spartiu liber
        - urmatorullui caracter ii vom aplica functia 'upcase' care 
          transfera caracterul daca e o litera in litera mare corespunzatoare
    } 


{ Program Principal }
begin
{ citim textul }
write('s=');
readln(s);


for i := 1 to length(s) do { parcurgem fiecare caracter }
    if s[i] = ' ' then { daca caracterul pe care suntem e un spartiu }
        s[i+1] := upcase(s[i+1]); { urmatorului caracter i se atribuie valoare
                                    acestuia ca litera mare }


{ cum in fata primului caracter nu e nimic acesta nu va fi facut mare asa 
  ca rezolvam asta acum }
s[1] := upcase(s[1]);


{ afisam sirul }
writeln(s);

readln;
end.
