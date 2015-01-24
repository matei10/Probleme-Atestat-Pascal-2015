(* Fişierul numere.in conţine pe prima linie cel mult 100 de numere naturale *)
(* ordonate crescător. Scrieți un program care verifică, folosind o metodă *)
(* eficientă,  dacă numărul x citit de la tastatură se află în acest șir și *)
(* afișează un mesaj corespunzător. *)
program atesta_2015_5;
type vector=array[1..100] of integer;
var v :vector;
    n, x, rez :integer;
    f :text;

{ Obs. Metoda de rezolvare 
    Aici evident ne este ceruta metoda cautari binare
    Adica ?
        Avem siru ordonat , comparam elementul cautat cu cel din mijloc
        daca e egal, am gasit elementul daca nu verificam cum e( > , < )
        daca elementul cautat e mai mare atunci ne ducem spre jumatatea 
        superioara a sirului daca e mai mic spre jumatatea inferioara, si
        repetam procesu 
    folosim un subprogram care realizeaza cautarea binara si returneaza
    locul elementului in sir daca a fost gasit sau 0 daca nu a gasit elemetul
    in sir
}

function cauta(i, j, x:integer):integer;
{ Parametri:
    - i => pozitia de pornire in vector de unde cautam
    - j => ultima pozitie in care cautam 
        Exemplu avem 100 elemente si i= 20 , j = 35
                noi o sa cautam doar intre elementele de la 
                20 la 35
    - x => elementul cautat 
  Return:
    - 0 => daca elementul nu e in sir
    - integer => pozitia elementului in vector
}
var m :integer;
begin
m := (i+j) div 2; { mijlocul sirului }
if i <= j then { daca i <= j atunci avem un sir in care sa cautam }
    if x  = v[m] then { am gasit elementul }
        cauta := m
    else { elementul nu e in mijlocul sirului }
        if x < v[m] then { elementul e mai mic decat mijlocul, cautam in
                            jumatate inferioara  }
            cauta := cauta(i, m-1, x)
        else { elementul e mai mare decat mijlocul, cautam in jumatatea
                superioara }
            cauta := cauta(m+1, j, x)
else { daca i < j atunci elementul nu e in vector }
    cauta := 0;
end;


{ Program Principal }
begin
assign(f, 'numere.in');
reset(f);

{ citim numerele }
n := 0;
while not eoln(f) do
    begin
    inc(n);
    read(f, v[n]);
    end;

close(f); { inchidem fisierul }

{ citim numarul }
write('x=');
readln(x);

rez := cauta(1, n, x);

if rez = 0 then { daca rezultatul cautari e 0, numarul nu e in vector }
    writeln('Numarul nu a fost gasit!')
else { daca rezultatul e diferit de 0 atunci i s-a returnat pozitia adica e in vector}
    writeln('Numarul a fost gasit!', rez);




readln;
end.
