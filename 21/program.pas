(* Se citesc două numere naturale nenule n și m. Să se afişeze toate numerele *)
(* prime mai mici decât n care au  suma cifrelor  mai mică decât m. *)
(* Exemplu: Pentru n=30 şi  m=7 se afişează:  2, 3, 5, 11, 13, 23 *)
program atestat_2015_21;
var n, m, i :integer;


{ Obs. Metoda de rezolvare 
    - pornim cu i de la 2 
    - folosim doua functii :
        * una care face suma cifrelor 
        * una care verifica daca un numar e prim sau nu
    - folosim un for sa mergem de la 1 la n-1 
}


function sum_cif(x :integer):integer;
{ Parametri:
    -x => numarul cu care vom lucra 
  Return:
    - integer => suma cifrelor lui x
}
var c :byte;
begin
sum_cif := 0;

while x > 0 do
    begin
    c := x mod 10;
    x := x div 10;

    sum_cif := sum_cif + c;
    end;
end;



function este_prim(x :longint):boolean;
{ Parametri:
    - x => numarul pe care il vom verifica 
  Return:
    - True => daca numarul este prim 
    - False => daca numarul nu este prim
}
var i :integer;
begin
este_prim := true;

for i := 2 to trunc(sqrt(x)) do
    if x mod i = 0 then
        begin
        este_prim := false;
        break;
        end;
end;


{ Program Principal }
begin
write('n=');
readln(n);

write('m=');
readln(m);

for i := 2 to n-1 do
    begin
    if este_prim(i) AND ( sum_cif(i) < m ) then { am gasit un numar care
                                                    respecta conditiile }
        begin
        writeln(i);
        dec(n); { mai avem de gasit n-1 numere }
        end
    end;

readln;
end.
