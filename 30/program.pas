(* Scrieţi un program C/C++ care citeşte de la tastatură două numere naturale *)
(* natural n și m (2<n, m<20) şi afişează pe ecran o matrice cu n linii şi m *)
(* coloane, având ca elemente primele n*m numere naturale compuse (nu sunt prime).  *)
program atestat_2015_30;
type matrice=array[1..100,1..20] of integer;
var a :matrice;
    k, n, m, i, j :integer;


{ Obs. Metoda de rezolvare
    - citim n-ul si m-ul
    - folosim un subprobgram sa vedem daca nu numar e prim
    - parcurgem matricea si folosim un k pe care il vom incrementa mereu
    - daca k-ul NU este prim atunci il punem in elementul matrici si trecem 
      la urmatorul
    Exemplu:
        n = 2;
        m = 3;
        Ar trebui sa ne iasa:
            4  6  8
            9 10 12 
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

k := 1;
for i := 1 to n do
    for j := 1 to m do
        begin
        inc(k); { marim k-ul deoarece a fost scris o data }
        while este_prim(k) do { cat timp k-ul e prim }
            inc(k);
        a[i, j] := k;{ iese din while cand k-ul nu mai e prim si il pune in matrice }
        end;


{ afisam matricea }
for i := 1 to n do
    begin
    for j := 1 to m do
        write(a[i, j]:5, ' ');
    writeln;
    end;




readln;
end.
