(* Fişierul text numere.in conţine pe prima linie un număr natural n (0≤n≤5000), *)
(* iar pe a doua linie n numere naturale de cel mult 9 cifre fiecare, separate *)
(* prin câte un spaţiu. Scrieți datele din fişierul numere.in şi scrie în fişierul *)
(* numere.out, valorile de pe a doua linie a fişierului numere.in care sunt *)
(* palindroame și au număr par de cifre. *)
program atestat_2015_5;
type vector=array[1..5000] of longint;
var v :vector;
    n, i :integer;
    f, g :text;

function palindrom(x :longint):boolean;
{ Paramentri:
    - 'x' -> numarul pe care il va verifica daca este palindrom 
  Return:
    - 'True' -> daca numarul e palindrom;
    - 'False' -> daca numarul nu este palindrom;
    }
var ogl, aux :longint;
    c :byte;
begin
ogl := 0;
aux := x; { Salvam valoare initiala a lui x }

{ Scoatem cate o crifra }
while x <> 0 do 
    begin
    c := x mod 10; { Scoatem o cifra }
    x := x div 10; { Eliminam cifra din numar }

    { Adaugam cifra in ogl }
    ogl := ogl * 10; { Facem loc pentru cifra }
    ogl := ogl + c;
    end;

{ Verificam daca numarul e palindrom }
{ Adica daca oglinditu este egal cu valoarea salvata de noi la inceput }
if ogl = aux then
    palindrom := true
else 
    palindrom := false;
end;


function nr_cif(x :longint):byte;
{ Parametri:
    - 'x' -> numarul caruia ii vom afra numaul de cifre 
  Return :
    - 'byte' -> numrul de cifre
    }
begin
nr_cif := 0; { Initializam numarul de cifre }

while x > 0 do
    begin
    { Numaram cifra }
    nr_cif := nr_cif + 1;
    { Elininam cifra }
    x := x div 10; 
    end;
end;

{ Program Principal }
begin
assign(f, 'numere.in');
assign(g, 'numere.out');

reset(f);
rewrite(g);

{ Citim n }
readln(f, n);

for i := 1 to n do
    read(f, v[i]);

close(f); { Inchidem fisierul }


for i := 1 to n do
    begin
    { Afisam numarul }
    write(v[i], ' ');

    { Verificam daca numarul este palindrom si daca are numaru de cifre mare }
    if palindrom(v[i]) AND ( nr_cif(v[i]) mod 2 = 0 ) then
        write(g, v[i], ' ');

    end;

close(g); { Inchidem fisierul }

readln;
end.








