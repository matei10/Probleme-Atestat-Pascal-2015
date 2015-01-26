(* Se consideră o matrice de dimensiuni m*n (m,n<=20)  cu elemente numere *)
(* naturale. Scrieţi programul C/C++ care citește dimensiunile și elementele *)
(* matricei și afişează pe ecran elementele matricei care au număr impar de *)
(* divizori şi numărul lor acestora. *)
program atesat_2015_25;
type matrice=array[1..20,1..20] of integer;
var a :matrice;
    i, j, m, n, k :integer;

{ Obs.
    Inca un enunt care are sens si nu prea.
    daca am elimina cuvantul "acestora" as intelege urmatoarele:
        - cititi o matrice cu m, n elemente
        - afisati elementele care au numar de dicizor impar
        - afisati numarul elementelor care respecta cerinta
    cuvantul "acestora" nu stiu cum sa il interpretez logic asa ca o sa
    folosesc ce am explicat mai sus 

    Obs. Metoda de rezolvare
        - cum am explicat mai sus, doar ca o sa folosesc un subprogram
          care va returna numarul de divizori 
}


function nr_div(x :integer):integer;
{ Parametri:
    - x => numarul a carui nr de divizori il vom afla
  Return:
    - integer => numarul de divizori ai numarului x 
}
var i :integer;
begin
nr_div := 0;
for i := 1 to n do
    if x mod i = 0 then
        inc(nr_div);
end;



{ Program Principal }
begin
write('m=');
readln(m);
write('n=');
readln(n);


{ citim matricea }
for i := 1 to m do
    for j := 1 to n do
        begin
        write('a[',i,',',j,']=');
        readln(a[i, j]);
        end;


k := 0; { aici vom stoca cate numere respecta regula }

for i := 1 to m do
    for j := 1 to n do
        begin
        if nr_div(a[i, j]) mod 2 = 1 then { daca numarul de divizori e impar }
            begin
            writeln(a[i, j]); { afisam }
            inc(k); { numaram }
            end;
        end;

{ afisam cate numere sunt }
writeln('Avem ',k,' numere care respecta regula .');


readln;
end.
