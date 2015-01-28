{ PROBLEMA DUBIOASA }
(* Fie a o matrice pătratică de ordin n (n<=20). Scrieți o funcţie de ordonare a *)
(* unui vector de dimensiune k, și utilizând această funcție, ordonați elementele *)
(* situate pe liniile impare. Afișați matricea obținută. *)
program atestat_2015_27;
type vector=array[1..20] of integer;
     matrice=array[1..20,1..20] of integer;
     var a :matrice;
         n, i :integer;


{ Obs.
    E grea... va zic din start, nu e greu ce ai de facut dar 
    trebuie sa folosesti chestii care nu au fost invatate la clasa.
    In primu rand tu trebuie sa pasezi un array unei functii ( var)
    apoi acel array este linia unei matrici (daca a e matrice atunci pasam
    a[1] ) care este de tip 'array of integer', dar asa indexarea se face de la
    0 asa ca folosim functia low(a) ca sa aflam limita de jos, daca folosim
    high(a) ne da limita maxima de sus dar noua ne trebuie doar elementele
    asa ca pai avem nevoie de un parametru n iar limita de sus va fi
    'low(a) +n -1' si sortam acest vector ... mai e si problema ca in enunt nu
    zice ce fel de 'ordonare' asa ca mai folosim un parametru, daca al treilea
    parametru e 0 atunci sortam descrescator, daca e alt ceva sortam crescator
}

procedure citire_matrice(n :integer);
{ Parametri:
    - n => ordinul matrici 
  Obs.
    - citeste o matrice de ordin n 
}
var i, j :integer;
begin
for i := 1 to n do
    for j := 1 to n do
        begin
        write('a[',i,' ,',j,']=');
        readln(a[i, j]);
        end;
end;


procedure ordonare_v(var a:array of integer; n, tip_sort :integer);
{ Parametri:
    - a => arrayul pe care il sortam
    - n => cate elemente are
    - tip_sort => daca e 0 srotam descrescator
                  daca e diferit de 0 sortam crescator 
                  }
var i, j, aux, lim_jos, lim_sus :integer;
begin
lim_jos := low(a); { aflam limita de jos }
lim_sus := low(a) + n - 1; { aflam limita de sus }
if tip_sort = 0 then { verificam ce tip de sortare avem, descrescatoare }
    begin
    for i := lim_jos to lim_sus -1 do { sortarea clasica descrescatoare }
        for j := i+1 to lim_sus do
            if a[i] < a[j] then
                begin
                aux := a[i];
                a[i] := a[j];
                a[j] := aux;
                end;
    end
else { sau creascatoare }
    begin
    for i := lim_jos to lim_sus -1 do { sortarea clasica crescatoare }
        for j := i+1 to lim_sus do
            if a[i] > a[j] then
                begin
                aux := a[i];
                a[i] := a[j];
                a[j] := aux;
                end;
    end
end;



procedure afisare_matrice(a :matrice; n :integer);
{ Parametri:
    - a => matricea ce dorim sa o afisam
    - n => ordinul matrici 
}
var i, j :integer;
begin
for i := 1 to n do
    begin
    for j := 1 to n do
        write(a[i, j], ' ');
    writeln;
    end;
end;



begin
write('n=');
readln(n);

citire_matrice(n);

for i := 1 to n do
    if i mod 2 <> 0 then { daca linia e impara }
        ordonare_v(a[i], n, 1); { ordonam linia crescator }


afisare_matrice(a, n);

readln;
end.
