(* Scrieți un program care construiește în memorie o matrice pătratică de ordin n *)
(* (număr natural citit de la tastatură) cu elemente numere naturale astfel încât *)
(* pe diagonala principală să existe numai elemente egale cu 1, elementele de pe *)
(* cele două « semidiagonale » paralele cu diagonala principală și alăturate *)
(* diagonalei principale să fie toate egale cu 2, elementele de pe următoarele *)
(* două « semidiagonale » să fie egale cu 3 etc. Afișați pe ecran elementele *)
(* matricei construite. *)
(* Pentru n=4 se va afișa tabloul : *)
(*     1 2 3 4 *)
(*     2 1 2 3 *)
(*     3 2 1 2  *)
(*     4 3 2 1 *)
program atestat_2015_39;
type matrice=array[1..10000,1..10000] of integer;
var a :matrice;
    n, i, j, k :integer;

{ Obs. Metoda de rezolvare
    - populam diagonala principala cu 1
    - pentru fiecare element de pe diagonala principala, 'a[i,i] = 1' putem
      adauga un element coloanei 'a[i, i+1] = 1 + 1' si am populat un element
      de pe diagolana secundara cu 2, acelas lucru pentru diagolana de dedesupt
      'a[i+1, i] = 1 +1', continuant pana cand ajungem la marginea 
      'a[i+n, i] = 1 +n' si 'a[i, i+n] = 1 + n' si am populat toate diagonalele
      secundare
}

{ Program Principal }
begin
write('n=');
readln(n);


for i := 1 to n do
    begin
    a[i, i] := 1; { popilam diagolana secundara }
    k := 0;
    while i+k <= n do { cat timp nu 'i+k' nu a trecut de margine, adica 'n'}
        begin
        k := k + 1; { marim 'k'-ul care dicteaza cat de departe de diagonala
                    principala suntem }
        a[i, i+k] := 1 + k; { completam elementul de deasupra diagonalei }
        a[i+k, i] := 1 + k; { completam elementul de dedesuptul diagonalei }
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


