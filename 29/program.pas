(* Scrieţi un program C/C++ care citeşte de la tastatură două numere naturale *)
(* natural n și m (2<n, m<20) reprezentând dimensiunile unei matrice și m*n numere *)
(* întregi să se determine punctele șa din matrice (elementele care sunt minime pe *)
(*     linia lor și maxime pe coloana lor). În cazul în care nu există se va afișa *)
(*     mesajul “NU”. *)
program atestat_2015_29;
type matrice=array[1..20,1..20] of integer;
var a :matrice;
    i, j, n, m :integer;
    ok :boolean;

{ Obs. Metoda de rezolvare 
    - citesc matricea
    - folosim doua subprograme care vor determina minimul de pe o linie si
      maximul de pe o coloana( coloana si linia vor fi primiti ca parametri)
    - vom trece prin fiecare element si vom verifica daca elementul 
      respecta cele doua reguli, daca da il afisam si avem grija sa vedem daca
      gasim un element sau nu ( caz in care vom afisa"nu")
}

function minim_linie(linie :integer):integer;
{ Parametri:
    - linie => linia de de pe care vom determina minimul
  Return:
    - cel mai mic element de pe linia respectiva
}
var i :integer;
begin
minim_linie := a[linie, 1];
for i := 1 to m do
    if a[linie, i] < minim_linie then
        minim_linie := a[linie, i];
end;


function maxim_coloana(coloana :integer):integer;
{ Parametri:
    - coloana => coloana de pe care  vom determina minimul
  Return:
    - cel mai mare element de pe coloana respectiva
}
var i :integer;
begin
maxim_coloana := a[1, coloana];
for i := 1 to n do
    if maxim_coloana < a[i, coloana] then
        maxim_coloana := a[i, coloana];
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
        write('a[',i,', ',j,']=');
        readln(a[i, j]);
        end;

ok := false; { presupunem ca nu exista nici un element sa}
for i := 1 to n do
    for j := 1 to m do
        if (a[i, j] = maxim_coloana(j)) AND { daca a[i, j] este maximul pe
                                            coloana lui}
           (a[i, j] = minim_linie(i)) then { si este minimul pe linia lui } 
            begin
            ok := true; { ok = true deoarece am gasit un element}
            write(a[i, j], ' '); { afisam elementul }
            end;

if not ok then { daca nu am gasit nici un element }
    write('NU');


readln;
end.
