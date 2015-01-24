(* Scrieți un program care citește de la tastatură un număr natural cu maximum 9 *)
(* cifre și construiește și afișează pe ecran două numere, astfel: primul număr va *)
(* conține cifrele pare situate pe pozițiile pare ale numărului dat, iar cel de al *)
(* doilea, cifrele impare situate pe poziții impare în numărul citit. Numărarea *)
(* pozițiilor începe cu cifra cea mai semnificativă a numărului. Ex : Pentru *)
(* n=2134506 se vor obține numerele 40 și 35. *)
program atestat_2015_18;
type vector=array[1..10] of byte;
var v :vector;
    x, nr_1, nr_2, i :longint;
    c, n, aux :byte;

{ Obs.
    Din exemplu observam ca "cifra semnificativa" inseamna "prima cifra de la
    stanga la dreapta", de ce ar face subiectele astea usor de inteles ... 


  Obs. Metoda de rezolvare
    - salvam cifrele intr-un vector ( o sa fie inversate deoarece le scoatem din
        numar de la dreapta la stanga )
    - inversam vectorul 
    - indicele cifrei ne va arata pozitia si valoare din vector va fi cifra
    - pentru fiecare indice par verificam daca numarul e par si formam primu
      numar, repetam procesu pentru indici impari si cifre impare 
}



    


{ Program Principal }
begin
write('x=');
readln(x);

{ Populam vectorul }
n := 0;
while x > 0 do
    begin
    c := x mod 10;
    x := x div 10;
    inc(n);
    v[n] := c;
    end;

{ inversam valorile vectorului }
for i := 1 to (n div 2) do
    begin
    aux := v[i];
    v[i] := v[n-i+1];
    v[n-i+1] := aux;
    end;


nr_1 := 0;
nr_2 := 0;

for i := 1 to n do 
    begin
    if i mod 2 = 0 then { daca pozitia e para }
        if v[i] mod 2 = 0 then { daca cifra e para }
            nr_1 := nr_1*10 + v[i];
            
    if i mod 2 = 1 then {daca pozitia e impara }
        if v[i] mod 2 = 1 then{ daca numarul este impar }
            nr_2 := nr_2*10 + v[i];
    end;


{ afisam rezultatele }
writeln('Primul numar :', nr_1);
writeln('Al doilea numar :', nr_2);

readln;
end.
