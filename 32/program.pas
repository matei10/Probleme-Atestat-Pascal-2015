{ PROBLEMA DUBIOASA }
(* Scrieţi un program C/C++ care citeşte de la tastatură un număr natural n *)
(* (2<n<20), construiește și afișează în fișierul matrice.out, elementele unei *)
(* matrice pătratice de ordinul n (n<=10) unde fiecare element Ai,j= minimul *)
(* dintre i și j. Afișarea se realizează  prin parcurgerea matricei pe coloane. *)
program atesta_2015_32;
type matrice=array[1..20,1..20] of integer;
var a :matrice;
    i, j, n :integer;
    g :text;

{ Obs.
    Se folosesc doua restrictii pentru n:
        - prima intre 2 si 20 
        - a doua <=10 ...
    Eu o sa presupun ca prima e adevarata, n apartile nui (2,20)

    Se cere afisarea pe coloane care poate fi:
        - afisare normala 
            1 2
            3 4
        - afisarea coloanelor una dupa alta
            1 3 2 4
    Eu o sa folosesc afisarea normala

    Obs. Metoda de rezolvare
        - cintesc n-ul
        - folosesc un subprogram sa determin minimul dintre doua valori
        - creez matricea
        - scriu matricea in 'matrice.out'
}

function min(a, b :integer):integer;
{ Parametri:
    - a => o valoare de comparat
    - b => a doua valoare pentru comparatie
  Return:
    - integer => minimul dinte a si b
}
begin
if a < b then
    min := a
else
    min := b;
end;


{ Program Principal }
begin
write('n=');
readln(n);

{ construim matricea }
for i := 1 to n do
    for j := 1 to n do 
        a[i, j] := min(i, j);


assign(g, 'matrice.out');
rewrite(g);
for i := 1 to n do
    begin
    for j := 1 to n do
        write(g, a[i, j], ' ');
    writeln(g);
    end;


close(g); { Inchidem fisierul }

readln;
end.
