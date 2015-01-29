(* Scrieţi un program C/C++ care citeşte de la tastatură un număr natural n *)
(* (1<=n<=20), elementele unei matrice cu n linii şi n coloane, numere naturale *)
(* din intervalul [1, 100] şi  afişează pe ecran m1 şi m2, unde m1 este media *)
(* aritmetică a elementelor neprime ale matricei, situate deasupra diagonalei *)
(* principale, iar m2 este media aritmetică a elementelor pătrate perfecte ale *)
(* matricei, situate sub diagonala principală. Cele două medii se consideră egale *)
(* cu 0 dacă nu există valori ce îndeplinesc cerințele în zonele corespunzătoare. *)
program atesta_2015_34;
type matrice=array[1..20,1..20] of byte;
var a :matrice;
    i, j, n, count_nepr, count_pp, sum_nepr, sum_pp :integer;
    m1, m2 :real;


{ Obs. Metoda de rezolvare
    - citim matricea
    - folosim doua subprograme ca sa determinam daca un numar e patrat perfect
      sau neprim
    - initializam sumele cu 0 
    - parcurgem matricea element cu element
        - daca elementul e deasuptra diagonali principale:
            - daca elementul este neprim 
                - il adaugam in suma nepr
                - il numaram in countul elementelor nepr
        - daca elementul e dedesuprtul diagonalei principale:
            - daca elementul este patreat perfect
                - il adugam in suma nepr
                - in numaram in numarul elementelor pp
    - pentru fiecare suma calculam m1 si m2:
        - daca e > 0 
            - o calculam ( suma / nr_elemente )
                -o afisam
        - daca e egala cu 0
            - o afisam



    Obs.
        Exista reguli sa vedem daca un element se afla intr-o anumita zona in
        matrice :
            - i < j -> deasupra diagonalei principale
            - i > j -> dedesuptul diagonalei principale
            - i = j -> pe diagonala principala
            - i+j = n+1 -> pe diagonala secundara 
            - i+j > n+1 -> dedesuptul diagonali secundare
            - i+j < n+1 -> deasupra diabonalei secundare
}


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


function este_pp(x :longint):boolean;
{ Parametri:
    - x => numarul pe care il vom verifica
  Return:
    - True => daca numarul este patrat perfect
    - False => daca numarul nu este patrat perfect 
}
var i :integer;
begin
este_pp := false;
for i := 1 to trunc(sqrt(x)) do
    if i*i = x then
        begin
        este_pp := true;
        break;
        end;
end;


{ Program Principal }
begin
write('n=');
readln(n);

{ citim matricea }
for i := 1 to n do
    for j := 1 to n do
        begin
        write('a[', i, ', ', j, ']=');
        readln(a[i, j]);
        end;

{ initlializam variabilele }
sum_nepr := 0;
sum_pp := 0;
count_nepr := 0;
count_pp := 0;


{ parcurgem element cu element }
for i := 1 to n do
    for j := 1 to n do
        begin
        if (i < j) then { daca e deasupra diagonalei principale }
            if not este_prim(a[i ,j]) then { daca elementul nu e prim }
                begin
                sum_nepr := sum_nepr + a[i, j]; { il adaugam in suma }
                count_nepr := count_nepr  + 1;  {il numaram }
                end;
        if (i > j) then { daca e dedesuptul diagonalei principale }
            if este_pp(a[i, j]) then { daca este patrat perfect }
                begin
                sum_pp := sum_pp + a[i, j]; { il adaugam in suma }
                count_pp := count_pp + 1; { il numaram }
                end;
        end; 

{ calculam m1 }
if sum_nepr  = 0 then { daca nu am gasit nici un element }
    m1 := 0 { atunci media e default 0 }
else { daca am gasit macar un element }
    m1 := sum_nepr / count_nepr; { calculam media }


{ calculam m2 }
if sum_pp = 0 then { daa nu am gasit nici un element }
    m2 := 0 { media e default 0 }
else  { daca am gasit macar un element }
    m2 := sum_pp / count_pp; { calculam media }


{ afisam rezultatele }
writeln('m1 =', m1:4:2);
writeln('m2 =', m2:4:2);


readln;
end.



