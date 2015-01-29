(* Scrieţi un program C/C++ care citeşte de la tastatură un număr natural n *)
(* (2<n<20), construieşte în memorie şi afişează pe ecran o matrice cu n linii şi *)
(* n coloane, numerotate de la 1 la n. Fiecare element din matrice aflat pe o *)
(* linie impară va fi egal cu numărul liniei pe care se află iar elementele de pe *)
(* linii pare să fie completate cu valorile de la n la 1. Elementele matricei vor *)
(* fi afişate pe ecran, câte o linie a matricei pe câte o linie a ecranului cu *)
(* câte un spaţiu între elementele fiecărei linii. *)
(* Exemplu: pentru n=5 se va afişa matricea de mai jos: *)
(*     1 1 1 1 1 *)
(*     5 4 3 2 1 *)
(*     3 3 3 3 3 *)
(*     5 4 3 2 1 *)
(*     5 5 5 5 5 *)
program atestat_2015_31;
type matrice=array[1..20,1..20] of integer;
var a :matrice;
    n, i, j, k :integer;

{ Obs. Metoda de rezolvare
    - citim n-ul
    - verificam paritatea liniei 
    - daca da scriem numarul liniei pe pe toate elemente ei
    - daca nu folosim un k pe care il initlializam cu n si din care vom scadea 
      cate o unitate la fiecare scriere
}



{ Program Principal }
begin
write('n=');
readln(n);


{ completam matricea }
for i := 1 to n do
    if (i mod 2 <> 0 ) then { daca linia nu este para }
        for j := 1 to n do
            a[i,j] := i
    else
        begin
        k := n;
        for j := 1 to n do
            begin
            a[i, j] := k;
            k := k -1;
            end;
        end;


{ afisam matricea }
for i := 1 to n do
    begin
    for j := 1 to n do
        write(a[i, j], ' ');
    writeln;
    end;


readln;
end.
