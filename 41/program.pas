(* Scrieți un program care construiește în memorie o matrice T pătratică de ordin *)
(* n (număr natural citit de la tastatură) cu elemente numere naturale astfel *)
(* încât pe ultima coloană și pe ultima linie să se afle numai elemente egale cu *)
(* 1, iar oricare alt element al matricei să fie egal cu suma dintre elementul *)
(* aflat imediat sub el și elementul aflat imediat în dreapta lui.  *)
(* Exemplu : Pentru n =4 se va afișa tabloul următor : *)
(*     20  10  4  1 *)
(*     10   6  3  1 *)
(*      4   3  2  1 *)
(*      1   1  1  1 *)
program atestat_2015_41;
type matrice=array[1..100,1..100] of integer;
var T :matrice;
    i, j, n :integer;
    
{ Obs. Metoda de rezolvare
    - citim 'n'-ul
    - initializam ultima coloana si ultima linie cu 1
    - parcurgem matricea patratica de ordin 'n-1' in ordine inversa
      adica de la 'n-1' la '1' si ii populam elementele
      respectand regulile 
    - afisam matricea
}


{ Program Principal }
begin
write('n=');
readln(n);

{ initializam ultima coloana cu 1 }
for i := 1 to n do
    T[i,n] := 1;

{ initializam ultima linie cu 1 }
for i := 1 to n do
    T[n, i] := 1;

{ parcurgem "sub-matricea" de ordin 'n-1' in ordine inversa }
for i := n-1 downto 1 do
    for j := n-1 downto 1 do
        T[i, j] := T[i+1, j] + T[i, j+1]; { fiecarui element i se atribuie suma
                           dintre elementul din dreapta lui 'T[i, j+1]' si cel
                           de dedesuptul ui 'T[i+1, j]'}


{ afisam matricea }
for i := 1 to n do
    begin
    for j := 1 to n do
        write(T[i, j]:4);
    writeln;
    end;


readln;
end.

