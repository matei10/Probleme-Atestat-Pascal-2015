(* Se citește din fișierul numar.txt un număr natural n, cu cel mult 100000 de *)
(* cifre. Scrieți un program care afișează mesajul Cifre distincte dacă cifrele *)
(* numărului sunt distincte două câte două, respectiv, Conține cifre egale în caz *)
(* contrar. *)
program atestat_2015_12;
type vector=array[1..1000000] of char;
var v :vector;
    n, i :integer;
    f :text;
    ok :boolean;


{ Obs. Metoda de rezolvare
    Vom stoca numarul intr-un vector de tip string.
    Parcurgem vectorul si apoi parcurgem fiecare element de la 
    2 la n si verificam daca v[i-1] <> v[i] 

    def. cifre distincte doua cate doua :
        orcare doua cifre alaturare sa fie diferite 
        exemple :
            123452325 => cifre distincte
            12334 => 3 e asezat langa 3
}

{ Program Principal }
begin
assign(f, 'numar.txt');
reset(f);

n := 0; { numarul de elemente din vector }

while not eoln(f) do
    begin
    inc(n);
    read(f, v[n]);
    end;


ok := true; { Presupunem ca are cifre distincte }

{ verifivam daca cifrele sunt distincte doua cate doua }
for i := 2 to n do
    if v[i] = v[i-1] then
        begin
        ok := false;
        break;
        end;

if ok then
    writeln('Cifre distincte')
else
    writeln('Contine cifre egale');

end.
