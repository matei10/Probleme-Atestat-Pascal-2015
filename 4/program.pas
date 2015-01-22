(* Fişierul unu.in conţine pe primul rând numărul natural n ( 2≤n≤1000000 ), iar *)
(* pe a doua linie se găsesc n numere întregi formate din cel mult 9 cifre şi *)
(* despărţite prin câte un spaţiu. Ştiind că linia a doua a fişierului conţine cel *)
(* puţin două numere distincte, scrieţi un program care să scrie în fişierul *)
(* unu.out pe o singură linie şi separate printr-un spaţiu, în ordine *)
(* descrescătoare, cele mai mari două valori distincte din fişierul de intrare.  *)
(* Exemplu : *)
(*     unu.in                                                            unu.out *)
(*     10 *)
(*     -8 14 8 14 15 9 -7 1 4 10                                         15 14                  *)
program atestat_2015_4;
type vector=array[1..100000] of longint;
var v :vector;
    f, g :text;
    n, i, max, pre_max: longint;

{ Program Principal }
begin
assign(f, 'unu.in');
assign(g, 'unu.out');

reset(f);
rewrite(g);

{ Citim n-ul din fisier }
readln(f, n);

{ Citim cele n numere }
for i := 1 to n do
    read(f,v[i]);

close(f); { Inchidem fisierul }

{ Initializam max cu cea mai mare valoare dintre primele doua
  (v[1] si v[2]) si pre_max cu cea mai mica                 }
if v[1] > v[2] then
    begin
    max := v[1];
    pre_max := v[2];
    end
else
    begin
    max := v[2];
    pre_max := v[1];
    end;

{ Parcurgem vectorul de la 3 la n sa vedem daca gasim valori mai mari ca max }
for i := 3 to n do
    if v[i] > max then
        begin
        pre_max := max; { pre_max ia valoarea curenta a lui max }
        max := v[i]; { max ia cea mai mare valoare gasita pana acum }
        end;

{ Scriem valorie in fisierul unu.out }
write(g, max);
write(g, ' ');
write(g, pre_max);

close(g);{ Inchidem fisierul }

readln;

end.
