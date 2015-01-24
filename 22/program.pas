(* Fişierul matrice.txt  conţine pe primul rând două valori naturale  m şi n *)
(* (1≤n≤100, 1≤m≤100), reprezentând numărul de linii şi respectiv de coloane ale *)
(* unei matrice a, iar pe următoarele m linii câte n valori întregi cu maximum 4 *)
(* cifre fiecare, separate prin câte un spaţiu, reprezentând elementele matricei *)
(* a. Afişaţi pe ecran un şir de 2*(n+m) – 4 numere ordonate crescător, şir format *)
(* din elementele aflate pe chenarul exterior al matricei a. Chenarul exterior *)
(* este format din prima şi ultima linie, respectiv prima şi ultima coloană din *)
(* matrice. *)
program atestat_2015_22;
type matrice=array[1..100,1..100] of integer;
    vector=array[1..200] of integer;
var v :vector;
    a :matrice;
    m, n, i, j, k, aux :integer;
    f :text;

{ Obs. Metoda de rezolvare 
    - citim matricea
    - stocam in vector elementele din chenarul exterior
    - ordonam vectorul
    - afisam vectorul
}


{ Programul Principal }
begin
assign(f, 'matrice.txt');
reset(f);
read(f, n);
readln(f, m);

{ Citim matricea }
for i := 1 to n do
    begin
    for  j := 1 to m do
        read(f, a[i,j]);
    readln(f);
    end;

close(f); { inchidem fisierul }

k := 0; { numar de elemente in vector }

{ adaugam in vector linia de sus si linia de jos }
for j := 1 to m do
    begin
    inc(k);
    v[k] := a[1,j]; { elementul j din linia de sus }

    inc(k);
    v[k] := a[n,j]; { elementul j din linia de jos }

    end;

{ adaugam in vecotr coloada din stanga si din dreapta cu grija sa nu adaugam
  colturile de doua ori }
for i := 2 to n-1 do
    begin
    inc(k);
    v[k] := a[i,1]; { elementul i din coloana din stanga }

    inc(k);
    v[k] := a[i,m]; { elementul i din coloana din dreapta }

    end;

{ ordonam vectorul }
for i := 1 to k-1 do
    for j := i+1 to k do
        if v[i] > v[j] then
            begin
            aux := v[i];
            v[i] := v[j];
            v[j] := aux;
            end;


for i := 1 to k do
    write(v[i], ' ');

readln;
end.




