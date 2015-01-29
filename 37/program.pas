(* Scrieţi un program care citeşte de la tastatură două numere naturale nenule m *)
(* şi n şi care construieşte în memorie şi apoi afişează elementele unei matrice A *)
(* cu m linii şi n coloane, unde Aij = cmmmc(i,j). Matricea se va afişa în *)
(* fișierul matrice.txt, câte o linie a matricei pe câte o linie a ecranului, *)
(* elementele fiecărei linii fiind separate prin câte un spaţiu. *)
program atestat_2015_37;
type matrice=array[1..100,1..100] of integer;
var a :matrice;
    i, j, n, m :integer;
    f :text;

{ Obs. Metoda de rezolvare
    - citim 'm'-ul si 'n'-ul 
    - parcurcem matricea si determinam cmmdc-ul folosiunt un subprogram
}

function cmmdc(a, b :integer):integer;
{ Parametri:
    - i, j -> numere cu care vom lucra
  Return:
    - integer -> cel mai mare divizor comun al numerelor
                 'i' si 'j'
  Obs.
    Folosim metoda scaderilor repetate pentru a afla cel mai mare
    divizor comun.
}
begin
if a = b then
    cmmdc := a
else
    if a > b then
        cmmdc := cmmdc(a-b, b)
    else
        cmmdc := cmmdc(a, b-a);
end;


{ Program Principal }
begin
write('n=');
readln(n);

write('m=');
readln(m);

{ parcurgem matricea }
for i := 1 to n do
    for j := 1 to m do
        a[i, j] := cmmdc(i, j); { populam fiecare element }

assign(f, 'matrice.out');
rewrite(f);
for i := 1 to n do
    begin
    for j := 1 to m do
        write(f, a[i, j], ' ');
    writeln(f);
    end;

close(f); { inchidem fisierul }

readln;
end.
