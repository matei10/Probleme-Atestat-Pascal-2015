{ PROBLEMA DUBIOASA }
(* Se citesc n (n<=100) numere naturale. Scrieți un program care determină și *)
(* afişează cel mai mic număr care se poate forma cu cifra maximă a fiecărui număr *)
(* citit. *)
(* Exemplu: Pentru n= 5 şi v=(29, 171, 0, 2222, 100) se afişează 10279. *)
program atestat_2015_24;
type vector=array[1..100] of byte ;
var v :vector;
    n, i, j, aux :integer;


{ Obs.
    dupa cum observam trebuie sa creeam un numar care poate avea maxim
    100 de cifre ceea ce nu stiu sa fac, dar o sa afisez ceea ce o sa semene cu
    un numar cu maxim 100 de cifre.

    De ce maxim 100 de cifre?
        Daca eu iau n= 20 => o sa am 20 de numere , alea 20 de numere o sa imi
        dea 20 de cifre maxime, si in enunt scire "format cu cifra maxima a
        fiecarui numar citit", asta inseamna ca daca doua numere x,y din alea
        citite au cifra maxima 9 eu in numarul final trebuie sa gasesc doi de
        9, unul de la x si unu de la y.

    Obs. Metoda de rezolvare
        - folosesc un subprogram care sa imi returneze cifra maxima
        - stochez cifrele maxime intr-un vector
        - ordonez vectorul crescator ca cifrele mari sa fie la final
          si cele mici in fata
        - afisez elementele vectorului ca sa dau impresia ca e un numar cu n
          cifre( in realitate va fi doar un sir de caractere)
}

function cifra_max(x :integer):byte;
{ Parametri:
    - x => numarul cu care vom lucra
  Return:
    - byte => cifra maxima a numarului x
}
var c :byte;
begin
cifra_max := x mod 10; { scot prima cifra si initializez cifra_max cu ea }
x := x div 10;

while x > 0 do
    begin
    c := x mod 10;
    x := x div 10;
    
    if c > cifra_max then
        cifra_max := c;
    end;
end;


{ Program Principal }
begin
write('n=');
readln(n);

for i := 1 to n do
    begin
    write('nr[',i,']=');
    readln(aux);

    { adaugam cifra maxima a numarului citit in vector }
    v[i] := cifra_max(aux);
    end;


{ ordonam vectorul crescator }
for i := 1 to n-1 do
    for j := i+1 to n do
        if v[i] > v[j] then
            begin
            aux := v[i];
            v[i] := v[j];
            v[j] := aux;
            end;


{ acum putem avea cazu in care prima cifra este 0 
  ceea ce nu se poate, ca sa remediem asta
  verificam daca prima cifra e 0, daca da o interschimbam cu prima cifra
  diferita de 0 }
if v[1] = 0 then
    for i := 2 to n do
        if v[i] <> 0 then
            begin
            v[1] := v[i];
            v[i] := 0;
            break
            end;



writeln('Numarul :');
{ afisam "numarul" }
for i := 1 to n do
    write(v[i]);



readln;
end.

