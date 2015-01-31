(* Fişierul text linii.txt este alcătuit din maximum 50 de linii de lungime *)
(* variabilă, pe fiecare linie găsindu-se câte un cuvânt. Scrieţi un program care *)
(* afișează cuvintele ce conțin cel puțin două vocale, ordonate alfabetic. *)
program atestat_2015_48;
type vector=array[1..100] of string;
var v, b :vector;
    i, j, n, n_b :integer;
    f :text;
    aux :string;

{ Obs. Metoda de rezolvare 
    - citim cuvintele din fisier si le punem in vectotorul 'v'
      le si numaram in variabila 'n'
    - folosim un subprogram care verifica daca un caracter e vocala (a, e, i,
      o, u ) , apoi folosim alt subprogram care returneaza numarul de vocale
      dintr-un cuvant
    - trecem in vectorul 'b' toate cuvintele care au macar doua vocale
    - ordonam vectorul 'b' 
    - afisam vectorul 'b'
}

function este_vocala(c :char):boolean;
{ Parametri:
    - 'c' -> un caracter
  Return:
    - 'True' -> daca 'c' este vocala
    - 'False' -> daca 'c' nu este vocala
}
begin
case c of
    { daca 'c' are una din valorile de mai jos, este vocala }
    'a' : este_vocala := true;
    'e' : este_vocala := true;
    'i' : este_vocala := true;
    'o' : este_vocala := true;
    'u' : este_vocala := true;
    else { daca nu, nu este vocala }
        este_vocala := false;
    end;
end;



function nr_vocale(s :string):integer;
{ Parametri:
    - 's' -> sirul cu care o sa lucram
  Return:
    - integer -> numarul de vocale din sirul 's'
}
var i :integer;
begin
nr_vocale := 0;

{ parcurgem sirul }
for i := 1 to length(s) do { parcurgem caractelele sirului }
    if este_vocala(s[i]) then { daca caracterul e vocala }
        nr_vocale := nr_vocale + 1; { il numaram }
end;




{ Program Principal }
begin
assign(f, 'linii.txt');
reset(f);

{ citim liniile si le numaram }
n := 0;
while not eof(f) do { cat timp nu am ajuns la finalul fisierului }
    begin
    n := n + 1; { numaram linia }
    readln(f, v[n]); { citim linia }
    end;

close(f); { inchidem fisierul }

{ punem in vectorul 'b' si numaram in 'n_b' cuvintele care au minim 2 covale }
n_b := 0;

for i := 1 to n do { parcurgem cuvintele din 'v' }
    if nr_vocale(v[i]) >= 2 then { daca cuvantul are macar doua vocale }
        begin
        n_b := n_b + 1; { il numaram }
        b[n_b] := v[i]; { il adaugam in vectorul 'b' }
        end;




{ ordonam vectorul 'b' alfabetic }
for i := 1 to n_b - 1 do
    for j := i+1 to n_b do
        if b[i] > b[j] then
            begin
            aux := b[i];
            b[i] := b[j];
            b[j] := aux;
            end;


{ afisam cuvintele care au macar doua vocale in ordine alfabetica }
for i := 1 to n_b do
    writeln(b[i]);


readln;
end.

