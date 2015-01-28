{ PROBLEMA DUBIOASA }
(* Fişierul atestat.txt conţine pe prima linie un număr natural n (n≤100), iar pe *)
(* a doua linie, separate prin câte un spaţiu, n numere naturale nenule, cu cel *)
(* puțin 3 cifre și cel mult 9 cifre fiecare. Scrieţi programul C/C++ care *)
(* afișează pe ecran numerele în ordinea crescătoare a cifrelor maxime *)
(* corespunzătoare. Dacă mai multe numere au aceeași cifră a sutelor, vor fi *)
(* afișate în ordinea descrescătoare a valorilor lor *)
program atestat_2015_15;
type vector=array[1..100] of longint;
var v :vector;
    i, j, n :integer;
    aux :longint;
    f :text;


{ Exemplu: dacă fişierul numere.in are conţinutul:
    9
    55 105 3 101 99 7 208 2222 80
    se va afișa:
    99 208 80 7 105 55 3 2222 101
        
  Obs! 
    In enunt se foloseste 'atestat.txt' si in exemplu 
    'numere.in', presupun ca e o greseala, eu o sa folosesc
    'atestat.txt'
    
    Tot in exemplu numerele sunt afisare DESCRESCATOR in functie de cifra
    maxima ( adica cifra maxima a lui 99 e mai mare decat cifra maxima a lui 
    208 si tot asa ) si cifra "sutelor" nu are nici o legatura in exemplu daca
    doua numere au cifrele maxime egale( nu a 'sutelor' cum zic ei) acele
    numere sunt afisare crescator dupa valoare lor( adica 208 si 80 au cifrele
    maxime egale si sunt afisare descrescator 208 evidentm ai mare decat 80, 
    acelas lucrur si cu 105 si 55 cifre maxime egale, aranjate descresactor

    Eu o sa folosesc exemplu si un enunt corect ar fi :
        Fisierul atestat.txt contine pe prima linie un numar natural n (n<=100)
        iar pe a doua linie, separate prin cate un spatiu, n numere naturale
        nenule, cu cel putin 3 cifre si cel mult 9 cifre fiecare. Scrieti
        programul C/C++ ( pascal in cazu meu ) care afiseaza pe ecran numerele
        in ordinea DESCRESCATOARE a cifrelor maxime corespunzatoare.Daca mai
        multe numere au CIFRELE MAXIME EGALE , vor fi afisate in ordinea
        CRESCATOARE a valorilor lor.

    ATENTIE!
        Se poate sa am drepatate se poate sa nu am daca gasiti o logica in
        enuntu lor care sa faca legatura cu exemplul va rog explicatimi si mie.
        





  Obs. Metoda de rezolvare
    - deschidem fisierul
    - citim n-ul si cele n numere in vecotrul 'v'
    - pornim cu metoada clasica de sortare dar comparatiea
      se va face diferit ( vom folosi un subprogram care va returna
      cifra maxima dintr-un numar si vom compara cifrele maxima )
    - dupa comparatia cifrelor maxime vom compara daca ele sunt egale
      daca sunt vom compara numerele pentru a vedea care e mai mare 
      ( ca sa il punem primul )
}

function cif_max(x :longint):byte;
{ Parametri:
    - x => numarul caruia ii vom afla cifra maxima
  Return:
    - byte => cifra maxima a numarului 'x'
}
var c :byte;
begin
cif_max := x mod 10; { Initializam 'cif_max' cu ultima cifra a numarului }
x := x div 10; { eliminam ultima cifra din 'x' ( care e in 'cif_max' acum )}
while x > 0 do
    begin
    c := x mod 10; { scoatem cate o cifra din x }
    x := x div 10;
    if c > cif_max then { daca cifra scoasa e mai mare ca 'cif_max' }
        cif_max := c; { 'cif_max' ia valoarea cifrei gasite }
    end;
end;



{ Program Principal }
begin
assign(f, 'atestat.txt');
reset(f);

readln(f, n); { citim n-ul }

{ citim numerele in vector }
for i := 1 to n do
    read(f, v[i]);

close(f); { inchidem fisierul }

for i := 1 to n-1 do
    for j := i+1 to n do
        begin
        if cif_max(v[i]) <= cif_max(v[j])  then { Daca v[i] are cifra max egala
                                                sau mai mica cu cea a lui v[j] 
                                                daca dorim putem pune >= daca
                                                enuntu cere sa fie aranjate
                                                descrescator in functie de
                                                cifra maxima }

            begin
            if cif_max(v[i]) = cif_max(v[j]) then { Daca cifrele maxime sunt
                                                    egale ordonam dupa valoare}
                if v[i] > v[j] then { Daca primul e mai mic ca al doilea le inversam}
                    begin
                    aux := v[i];
                    v[i] := v[j];
                    v[j] := aux;
                    end;
            if cif_max(v[i]) < cif_max(v[j]) then{ Daca cifrele nu sunt egale atunci prima e mai mica ca a
                                                    doua (datorita primului if cu <= }
                begin
                aux := v[i];
                v[i] := v[j];
                v[j] := aux;
                end;
            end;
        end;

{ Afisam elementele }
for i := 1 to n do
    write(v[i], ' ');


readln;
end.
