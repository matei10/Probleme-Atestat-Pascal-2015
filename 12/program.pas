(* Se citește din fișierul numar.txt un număr natural n, cu cel mult 100000 de *)
(* cifre. Scrieți un program care afișează mesajul Cifre distincte dacă cifrele *)
(* numărului sunt distincte două câte două, respectiv, Conține cifre egale în caz *)
(* contrar. *)
program atestat_2015_12;
type vector=array[1..5000] of string;
var v :vector;
    n, i, j, prev :integer;
    f :text;
    ok :boolean;
    prev_char :char;


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
for i := 1 to n do
    begin
    for j := 1 to length(v[i]) do
        begin
        
            
        prev := j - 1; { Obtinem indicele elementului predecesor lui j}
        if prev = 0 then { Daca elementul este 0 (adica j e 1 ) avem doua cazuri :}
            if i = 1 then { I: daca suntem pe prima linie ca sa evitam o eroare
                            vom lua elementul predecesoru ca urmatoru adica 2 }
                prev_char := v[i][2]
            else { Daca suntem pe alta linie atunci predecesorul este ultimul
                    element al liniei i-1 }
                prev_char := v[i-1][length(v[i-1])]
        else
            prev_char := v[i][prev];

    
        { Vedem daca elementul curent (j) este egal de predecesoru }
        if v[i][j] = prev_char then
            begin
            ok := false;
            end;
        end;
    end;

if ok then
    writeln('Cifre distincte')
else
    writeln('Contine cifre egale');

end.
