(* Se citesc de la tastatură n (n<=100)  numere naturale, cu cel mult 9 cifre *)
(* fiecare. Scrieți un program care,  pentru o cifră k citită de la tastatura, *)
(* afișează pe ecran numărul de valori prime din șirul dat, în scrierea cărora *)
(* apare cifra k. *)
(* Exemplu: pentru n=4 , cifra k=2 și valorile citite 23, 603, 122, 27 se obține *)
(* numărul nr = 1, care corespunde valorii 23. *)
program atestat_2015_1;
type vector=array[1..100] of longint;
var v :vector;
    n, k, nr, i :longint;


{ Obs. Metoda de rezilvare
    - citim 'n'-ul
    - citim cele 'n' numere
    - citim 'k'-ul
    - parcurgem cele 'n' numere si verificam daca cifra 'k' se gaseste in
      scrierea lor 
        - daca da, numaram 
}

function prim(x :longint):boolean;
{ Parametri :
    - x -> numarul care va fi testat daca este prim sau nu ;
  Return :
    - True -> daca numarul este prim ; 
    - False -> daca numarul nu este prim ;
}
var i :longint;
begin
prim := true;
for i := 2 to trunc(sqrt(x)) do
    if (x mod i) = 0 then
        begin
        prim := false;
        break;
        end;
end;


function contine_k(x :longint):boolean;
{ Parametri:
    - x -> numarul in a carui cifre va cauta cifra k
  Return:
    - True -> daca numarul contine cifra k in scrierea lui
    - False -> daca numarul nu contine cifra k in scrierea lui
}
var c :longint;
begin
contine_k := false;
while x <> 0 do 
    begin
    c := x mod 10; { Scoatem o cifra }
    x := x div 10; { Eliminam cifra din numar }
    if k = c then  { Verificam daca cifra este egala cu k (k-ul este global) }
        contine_k := true; { Daca da, returnam true }
    end;
end;


procedure citire_vector;
{ Procedura citeste primele n elemente ale vectorului }
var i :integer;
begin
for i := 1 to n do
    begin
    write('v[',i,']=');
    readln(v[i]);
    end;
end;


{ Program Principal }
begin
write('n=');
readln(n);

{ Citim cele 'n' elemente }
citire_vector;

{ Citim 'k'-ul }
write('k=');
readln(k);

nr := 0; { Initializam 'nr' }

for i := 1 to n do 
    if contine_k(v[i]) AND prim(v[i]) then 
    { daca 'v[i]' contine cifra 'k' si este prim atunci il numaram }
        inc(nr); { 'inc(nr)' este echivalent cu 'nr := nr + 1' }

writeln('nr=',nr);

readln;

end.


        

