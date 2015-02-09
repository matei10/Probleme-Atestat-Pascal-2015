(* Se citesc n numere naturale. Să se afișeze cele n numere în ordinea crescătoare *)
(* a numărul de divizori primi corespunzători fiecărei valori. Valorile având *)
(* același număr de divizori primi se vor afișa în ordine descrescătoare. *)
(*  Exemplu: Pt. n=5 și numerele 12, 4, 5, 6, 13 se va afișa pe ecran  13 5 4 12 6 *)
(*  . *)
program atestat_2015_9;
type vector=array[1..100] of integer;
var v :vector;
    n, i, j, aux :integer;


function prim(x :integer):boolean;
{ Parametri:
    - 'x' -> numarul pe care il vom testa 
  Return:
    - 'True' -> numarul este prim
    - 'False' -> numarul nu este prim 
}
var i :integer;
begin
prim := true;

for i := 2 to trunc(sqrt(x)) do
    if x mod i = 0 then
        prim := false;
end;



function nr_div(x :integer):integer;
{ Parametri:
    - 'x' -> numarul caruia ii vom calcula nr de divizori primi
  Return:
    - 'integer' -> numarul de divizori  primi ai lui 'x' 

}
var i :integer;
begin
nr_div := 0;

for i := 1 to x do 
    if (x mod i = 0) AND prim(i) then { daca 'i' este divizor si este prim }
        inc(nr_div);
end;



{ Program Principal }
begin
write('n=');
readln(n);

{ Citim numerele }
for i := 1 to n do
    begin
    write('v[',i,']=');
    readln(v[i]);
    end;


for i := 1 to n-1 do
    for j := i+1 to n do
        begin
        if nr_div(v[i]) > nr_div(v[j]) then { Daca numarul de divizori e mai mare }
            begin
            aux := v[i];
            v[i] := v[j];
            v[j] := aux;
            end;

        if nr_div(v[i]) = nr_div(v[j]) then { Daca numarul de divizori e egal}
            if v[i] < v[j] then             { cerificam daca sunt in ordine descrescatoare }
                begin
                aux := v[i];
                v[i] := v[j];
                v[j] := aux;
                end;
        end;

            
{ Afisam numerele }
for i := 1 to n do
    write(v[i],' ' );


readln;
end.

