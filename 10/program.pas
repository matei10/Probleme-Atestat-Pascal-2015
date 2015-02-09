(* Se citeşte n număr natural (n<50) şi n numere întregi. Să  se afișeze numerele *)
(* care au cel mult un divizor propriu număr prim și să se calculeze media lor *)
(* aritmetică. Dacă șirul nu conține niciun astfel de număr se va afișa valoarea *)
(* 0. *)
program atestat_2015_10;
type vector=array[1..50] of integer;
var v :vector;
    n, i, sum, nr :integer;


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


function prop(x :integer):boolean;
{ Parametri:
    - 'x' -> numarul caruia pe care vom opera 
  Return
    - 'True' -> daca numarul are pintre divizori maxim 
              un numar prim
    - 'False' -> Daca are 2 sau mai multi divizori primi
}
var i, nr_div :integer;
begin
nr_div := 0;

for i := 2 to x do { Pornim de la '2' deoarece '1' o sa fie mereu divizor prim }
    if (x mod i = 0) and prim(x) then { Daca 'i' e divizor si e prim }
        inc(nr_div);                  { Il numaram }

if nr_div <= 1 then
    prop := true
else
    prop := false;

end;



{ Program Principal }
begin
write('n=');
readln(n);

for i := 1 to n do
    begin
    write('v[',i,']=');
    readln(v[i]);
    end;

nr := 0; { Variabila care numara elementele care respecta proprietatea }
sum := 0; { Variabila care tine suma elementelor care respecta proprietatea }

for i := 1 to n do
    if prop(v[i]) then
        begin
        sum := sum + v[i];
        inc(nr);
        end;

if nr >= 1 then
    writeln(sum/nr:4:4)
else
    writeln(0);

readln;
end.
