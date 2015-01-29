(* Scrieţi un program C/C++ care citeşte de la tastatură numerele întregi m şi n *)
(* (1<=m<=50, 1<=n<=50) şi elementele unui tablou bidimensional cu m linii şi n *)
(* coloane, numere naturale de cel mult 4 cifre fiecare. Programul va afişa pe *)
(* prima linie a ecranului numărul de elemente prime de pe fiecare coloană a *)
(* matricei, separate prin câte un spațiu. *)
program atestat_2015_35;
type matrice=array[1..50,1..50] of integer;
var a :matrice;
    i, j, n, m, elem_prim :integer;


{ Obs. Metoda de rezolvare
    - citim matricea
    - parcurgem matricea pe coloane
        - pentru fiecare coloana initializam 'elem_prim' cu 0
        - parcurgem coloana si numaram elementele prime
        - afisam cate elemente prime am gasit
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

{ Program Principal }
begin
write('n=');
readln(n);
write('m=');
readln(m);

{ citim matricea }
for i := 1 to n do
    for j := 1 to m do
        begin
        write('a[', i, ', ', j,']=');
        readln(a[i, j]);
        end;


{ parcurgem matreiace }
for j := 1 to m do { mergem pe coloane }
    begin
    elem_prim := 0; 
    for i := 1 to n do { mergem pe coloana "in jos" }
        if este_prim(a[i,j]) then { daca elementul a[i,j] e prim }
            elem_prim := elem_prim +1; { il numaram }
    write(elem_prim, ' '); { afisam cate elemente prime am gasit }
    end;


readln;
end.
