(* Se citesc de la tastatură n numere naturale, cu cel mult 9 cifre fiecare. *)
(* Scrieţi un program care afişează cifra care apare de cele mai multe ori în *)
(* numerele citite. Dacă există mai multe astfel de cifre se vor afişa cele mai *)
(* mari două cifre. *)
program atestat_2015_7;
type vector=array[1..100] of longint;
     cifre=array[0..9] of integer;
var v :vector;
    vec_cif :cifre;
    n, i, max, k  :integer;

{ Obs. Metoda de rezolvare 
    In primul rand vom citi numerele apoi folosind vectorul cifre
    care are valori de la 0-9 ( cate cifre sunt ) o sa trecem prin fiecare numa
    din v il descompunem in cifre si pentru fiecare cifra gasita vom incrementa
    vec_cif['cifrea gasita'] .

    In vec_cif vom avea de cate ori apare fiecare cifra in sirul de numere .

    Vom parcurge vom parcurge vectorul si vom afla maximul lui, apoi vom
    verifica cate cifre apar de max ori, daca sunt mai multe cifre cu
    proprietatea asta vom merge de la 9 downto 0 si vom afisa cifrele care apar
    de max ori, si vom incrementa un k , cand k-ul este = 2 o sa iesim din for
    }

procedure descompunere(x :longint);
{ Parametri:
    - x => numarul care va fi descompus in cifrele componente 
 Obs.
    Procedura descompune numarul in cifrele sale componente
    apoi le numara in cev_cif
    }   
var c :byte;
begin
while x > 0 do
    begin
    c := x mod 10;
    x := x div 10;
    inc(vec_cif[c]);
    end;
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

{ Initializam vec_cif cu 0 }
for i := 0 to 9 do
    vec_cif[i] := 0 ;


{ Parcurgem vectorul si descompunem fiecare numar }
for i := 1 to n do
    descompunere(v[i]);


{ Aflam maximul ( adica de cate ori a aparut cea mai fregventa cifra ) }
max := vec_cif[1];

for i := 1 to 9 do
    if vec_cif[i] > max then
        max := vec_cif[i];

{ Afisam cele mai mari cifre care apar de max ori }
k := 0;

for i := 9 downto 0 do
    if k < 2 then
        if vec_cif[i] = max then
            begin
            write(i,' ');
            inc(k);
            end;

readln;
end.

