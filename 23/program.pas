(* Se citeşte de la tastatură o valoare naturală m (2≤m≤100). Scrieţi programul *)
(* C/C++ care construieşte în memorie şi apoi afişează pe ecran matricea a cu m *)
(* linii şi m coloane de numere întregi, construită după următoarea regulă: *)
(*     elementul de pe linia i şi coloana j a matricei ( 1≤i , j≤m) este egal cu: *)
(*         - 1 dacă i*i+j*j este pătrat perfect; *)
(*         - 2 dacă i*i+j*j nu este pătrat perfect, dar este număr prim mai mare *)
(*           decât 2; *)
(*         - 3 în rest. *)
(*         Exemplu: pentru m = 2, se va afişa matricea: *)
(*             3  2 *)
(*             2  3 *)
program atestat_2015_23;
type matrice=array[1..100,1..100] of byte;
var a :matrice;
    m, i, j, aux :integer;

{ Obs. Metoda de rezolvare
    - folosim doua subprograme :
                * este_prim => verifica daca un numar e prim
                * este_pp => verifica daca un numar este patrat perfect
    - parcurgem matricea si pentru fiecare element vom aplica legile in ordine
      inversa :
          * initializam cu 3
          * daca i*i+j*j  este numar prim > 2 rescriem 3-ul cu un 2
          * daca i*i+j*j este patrat perfect rescriem 3-ul sau 2-ul cu 1 
          }


function este_prim(x :longint):boolean;
{ Parametri:
    - x => numarul pe care il vom verifica 
  Return:
    - True => daca numarul este prim 
    - False => daca numarul nu este prim
}
var i :integer;
begin
este_prim := true;

for i := 2 to trunc(sqrt(x)) do
    if x mod i = 0 then
        begin
        este_prim := false;
        break;
        end;
end;

function este_pp(x :longint):boolean;
{ Parametri:
    - x => numarul pe care il vom verifica
  Return:
    - True => daca numarul este patrat perfect
    - False => daca numarul nu este patrat perfect 
}
var i :integer;
begin
este_pp := false;
for i := 1 to trunc(sqrt(x)) do
    if i*i = x then
        begin
        este_pp := true;
        break;
        end;
end;


{ Program Principal }
begin
write('m=');
readln(m);

{ construim matricea }
for i := 1 to m do
    for j := 1 to m do
        begin
        a[i,j] := 3; { ultima conditie }

        aux := i*i + j*j; { calculam numarul de verificat }

        if este_prim(aux) AND (aux > 2) then { a doua conditie }
            a[i,j] := 2;

        if este_pp(aux) then { prima conditie }
            a[i,j] := 1;
        end;


{ afisam matricea }
for i := 1 to m do
    begin
    for j := 1 to m do
        write(a[i,j], ' ');
    writeln;
    end;


readln;
end.
    



