(* Fiecare din cele două linii ale fișierului numere.in conține mai multe valori *)
(* naturale, separate prin câte un spațiu. Scrieți un program care afișează pe *)
(* ecran conținutul fișierului și pe un rând separat, elementele de pe prima linie *)
(* a fișierului care nu apar în cea de a doua linie. *)
program atestat_2015_38;
type vector=array[1..100] of integer;
var v1, v2 :vector;
    n1, n2, i :integer;
    f :text;

{ Obs. Metoda de rezolvare
    - citim cele doua linii in doi vectori ( 'v1' si 'v2')
    - folosim o functie sa vedem daca un element 'x' se afla in al doilea
      vector,  o sa folosim aceasta functie ca sa afisam doar elementele care
      apar in prima linie, nu si in a doua
}

function este_in_v2(x :integer):boolean;
{ Parametri:
    - x -> numarul pe care o sa il cautam
  Return:
    - 'True' -> daca elementul 'x' se afla in 'v2'
    - 'False' -> daca elementul 'x' nu se afla in 'v2'
}
var i :integer;
begin
este_in_v2 := false; { presupunem ca elementul nu se afla in 'v2' }

{ parcurgem vectorul 'v2' }
for i := 1 to n2 do
    if v2[i] = x then { daca am gasit un element in 'v2' egal cu 'x' }
        begin
        este_in_v2 := true; { returnam true }
        break; { iesim din for }
        end;
end;

{ Program Principal }
begin
assign(f, 'numere.in'); { deschidem fisierul }
reset(f); { pregatim fisierul pentru citire }

{ citim prima linie }
n1 := 0; { nu avem initial nici un element }
while not eoln(f) do { cat timp nu am ajuns la finalul liniei }
    begin
    n1 := n1 + 1;{ am gasit un element }
    read(f, v1[n1]); { citim elementul }
    end;

readln(f); { trecem pe urmatoare linie }

{ citim a doua linie }
n2 := 0; { nu avem initial nici un element }
while not eoln(f) do { cat timp nu am ajuns la finalul liniei }
    begin
    n2 := n2 + 1; { am gasit un element }
    read(f, v2[n2]); { citim elementul }
    end;



{ afisam prima linie }
for i := 1 to n1 do
    write(v1[i], ' ');

writeln; { trecem pe urmatoare linie }

{ afisam a doua linie }
for i := 1 to n2 do
    write(v2[i], ' ');


writeln; { trecem pe urmatoare linie } 

{ afisam elementele din 'v1' care nu apar in 'v2' }
for i := 1 to n1 do { mergem prin elementele lui 'v1' }
    if not este_in_v2(v1[i]) then { daca elementul 'v1[i]' nu se afla in 'v2' }
        write(v1[i], ' '); { afisam elementul }

readln;
end.
