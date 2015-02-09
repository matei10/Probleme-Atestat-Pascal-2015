(* Definiți structura fracție care memorează în câmpul a al structurii *)
(* numărătorul, iar în câmpul b numitorul unei fracții. Scrieți un program care *)
(* citește un număr natural n și n perechi de numere întregi reprezentând *)
(* numitorul și numărătorul a n fracții și afișează pentru fiecare fracție dată, *)
(* pe câte o linie, numitorul și numărătorul fracției ireductibile echivalente, *)
(* separate printr-un spațiu. *)
program atestat_2015_44;
type fractie=record
            a, b :integer;
            end;
    vector=array[1..100] of fractie;
var v :vector;
    n, i :integer;
    aux :fractie;

{ Obs. Metoda de rezolvare
    - am derifin o structura de date de tip record
      care are doua campuri 'a' si 'b' 
    - citim 'n'-ul
    - citim cele 'n' fractii intrun vector 'v' 
    - folosim o functie care primeste ca parametru o fractie
      si returneaza fractia ireductibila
    - parcurgem vectorul afisam fractiile cate una si separate cu un spartiu
      afisam fractia ireductibila folosind functia
}


function simplifica(f :fractie):fractie;
{ Parametri:
    - f -> fractia pe care o vom simplifica
  Return:
    - fractie -> fractia 'f' simplificata
}
var i, min :integer;
begin
{ stabilim valoare minima dintre numarator si numitor }
if f.a > f.b then
    min := f.a
else
    min := f.b;

{ luam fiecare numar de la 'min' la '2' }
for i := trunc(min) downto 2 do
    if (f.a mod i = 0) AND (f.b mod i = 0) then  { daca si numaratoru si numitoru se
                                            impart exact la i }
        begin
        f.a := f.a div i;
        f.b := f.b div i;
        end;


simplifica := f; { returnam fractia simplificata }
end;


{ Program Principal }
begin
write('n=');
readln(n);

{ citim cele 'n' fractii }
for i := 1 to n do 
    begin
    writeln('Fractia ',i);

    write('numaratoru=');
    readln(v[i].a);
    
    write('numitoru=');
    readln(v[i].b);
    end;

{ afisam fractia si aceeasi fractie simplificata }
for i := 1 to n do
    begin
    write(v[i].a, '/', v[i].b, ' ');
    
    { calculam fractia v[i] simplificata }
    aux := simplifica(v[i]);

    { afisam fractia simplificata }
    writeln(aux.a, '/', aux.b);
    end;


readln;
end.



