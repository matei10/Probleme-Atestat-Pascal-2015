(* Se citeşte de la tastatură un număr natural n (1<n <100), și apoi n perechi de *)
(* câte două numere întregi a si b cu  ( a < b) reprezentând capetele intervalului *)
(* [a, b]. Afișați pe ecran, dacă există, capetele intervalului rezultat în urma *)
(* intersecției celor n  intervale citite, separate printr-un spațiu. În cazul în *)
(* care intersecția este mulțimea vidă se afișează valoarea 0. *)
(* De exemplu, pentru n=3 și perechile [-1,20], [-4,9], [-7, 12] se va afișa -1 9.  *)
program atestat_2015_6;
type vector=array[1..100] of integer;
var a_uri, b_uri :vector;
    i, n, min, max :integer;

{Obs. Metoda de rezolvare 
    daca punem exemplu pe axa vedem ca intersectia toturol multimilor are
    capetele : 
        -capatul din dreapta este maximul din toate valorile lui 'a'
        -capatul din stanga este minimul din toate valorile lui 'b'
    daca capatul din dreapta este mai mare decat capatul din stanga atunci
    intersectia este multimea vida 

    problema se rezuma la gasirea maximul primului sir ( al 'a'-urilor) si
    minimul celui de al doilea sir( al 'b'-urilor ) si verificam daca maximul
    este mai mic decat minimul
    }

{ Program Principal }
begin
write('n=');
readln(n);

for i := 1 to n do
    begin
    write('Limita inferioara a sirului ',i,' :');
    readln(a_uri[i]);
    write('Limita superioara a  sirului ',i,' :');
    readln(b_uri[i]);
    writeln;
    end;

{ Initializam 'min', 'max' }
min := b_uri[1];
max := a_uri[1];

for i := 2 to n do
    begin
    if a_uri[i] > max then
        max := a_uri[i];

    if b_uri[i] < min then
        min := b_uri[i];
    end;

if min > max then
    writeln(max, ' ', min)
else
    writeln(0);

readln;
end.

