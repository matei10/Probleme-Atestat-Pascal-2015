(* Fişierul text NUMERE.IN conţine pe prima linie un număr natural nenul n *)
(* (1≤n≤1000) şi pe următoarea linie n numere reale pozitive separate prin câte un *)
(* spaţiu. Scrieţi un program C/C++ care citeşte din fişierul NUMERE.IN numărul *)
(* natural n, şi determină, utilizând un algoritm eficient din punct de vedere al *)
(* timpului de executare şi al memoriei utilizate, poziția pe care se află primul *)
(* şi ultimul număr din cele n numere reale care sunt egale cu cea mai mică *)
(* valoare citită. *)
(* Exemplu: Dacă fişierul NUMERE.IN are conţinutul: *)
(*     6 *)
(*     2.8 2.3 5.7 5.7 2.3 6.3 *)
(*     atunci se afişează 2 5 (valoarea minimă este 2.3 și numerele din poziţiile *)
(*         2, respectiv 5 sunt egale cu 2.3). *)
(*  *)
program atesta_2015_33;
var f :text;
    n, i, first, last :integer;
    min, nr :real;

{ Obs. Metoda de rezolvare
    - citim n-ul
    - initializam min cu primul numar
    - initializam first si last cu '1'
    - mergem cu un for si citim cate un numar
    - daca numarul citit este mai mic decat numarul atunci
        min -> numarul citit
        fist -> pozitia numarului citit(i-ul)
        last -> pozitia numarului citit(i-ul)
    - daca numarl citit este egal cu minimul
        last -> pozitia numarului citit(i-ul)
}

{ Program Principal }
begin
assign(f, 'NUMERE.IN');
reset(f);

readln(f, n); { citim n-ul }
read(f, min); { initializam min cu primul nr din sir }
first := 1; 
last := 1;

for i := 2 to n do { pornit de la 2 deoarece am citit un nr }
    begin
    read(f, nr); { citim numarul }
    if nr = min then
        last := i
    else
        if nr < min then
            begin
            min := nr;
            first := i;
            last := i;
            end;
    end;

close(f); { inchidem fisierul }

{ afisam rezultatele }
write(first, ' ', last);

readln;
end.
