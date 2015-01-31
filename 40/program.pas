(* Se citesc de la tastatură două numere naturale m și n (0<=m,n<=5) și m*n cifre *)
(* de la 0 la 9. Să se afișeze suma numerelor care se pot forma cu cifrele *)
(* fiecărei linii (numărul aferent fiecărei linii se va obține prin alipirea *)
(*     cifrelor de pe linia respectivă de la stânga la dreapta, ignorându-se *)
(*     zerourile de la începutul liniei).  *)
(*     Exemplu : Pentru valorile : *)
(*         3 5 *)
(*         0 3 8 2 5 *)
(*         0 0 5 1 4 *)
(*         0 7 7 9 3  *)
(*         se va afișa 12132 reprezentând suma 3825+514+7793. *)
program atestat_2015_40;
type matrice=array[1..100,1..100] of byte;
var a :matrice;
    n, m, i, j :integer;
    sum :longint;

{ Obs. Metoda de rezolvare 
    - citim matricea
    - parcurgem liniile matrici 
        - pentru fiecare linie folosim un subprogram care sa creeze numarul
            - subprogramul va folosi urmatoarea metoda:
                * initializam numarul cu 0 
                * parcurgem linia de la inceput la sfarsit
                * inmultim numarul cu 10 si ii adunam cifra la fiecare pas
                Exemplu:
                    linia : 0 2 3 5
                    parcurgem de la 0 spre 5
                        ~ nr = 0 (initializat
                        ~ invepem de la 0 si aplicam nr = nr * 10 + c
                            adica  nr = 0 * 10 + 0 => nr = 0
                        ~ continuam cu 2
                            adica nr = 0*10 + 2 => nr = 2
                        ~ continuam cu 3
                            adica nr = 2*10 + 3 => nr = 23
                        ~ continuam cu 5
                            adica nr = 23*10 + 5 => nr = 235
    - adunam fiecare numar returnat de subprogram unei sume totale 'sum'
    - afisam suma
}

function creeaza_nr(linie :integer):longint;
{ Parametri:
    - linie -> linia de unde vom creea numarul
  Return:
    - longint -> numarul creeat cu elementele liniei
}
var i :integer;
begin
creeaza_nr := 0;

{ parcurgem elementele linie }
for i := 1 to m do
    creeaza_nr := creeaza_nr*10 + a[linie, i];
end;


{ Program Principal }
begin
write('n=');
readln(n);

write('m=');
readln(m);

{ citim matricea }
for i := 1 to n do
    for j := 1 to m do
        begin
        write('a[', i, ', ', j, ']=');
        readln(a[i,j]);
        end;

{ parcurgem liniile si creeam suma }
sum  := 0; { initializam suma }

for i := 1 to n do
    sum := sum + creeaza_nr(i); { adunam sumei numarul creeat de pe linia i }


{ afisam suma }
writeln(sum);


readln;
end.
