(* Se citește de la tastatură un număr natural n cu cel mult 9 cifre, având cel *)
(* puțin o cifră pară. Să se afișeze  cel mai mare și cel mai mic număr care se *)
(* pot forma cu cifrele pare distincte ale numărului dat. *)
program atestat_2015_11;
type vector=array[1..10] of byte;
var v :vector;
    c, i, j, aux, nr_cif :byte;
    put, n :longint;



{ Obs. Metoda de rezolvare
    Pentru a rezolva problema trebuie sa urmam urmatori pasi:
        1) scoatem din <n> in vectorul <v> numerele pare distincte
            Exemplu:
                24623 = [2, 4]
                833228 = [8, 2]
        2) ordonam vectorul descrescator ( deoarece cand vom creea numarul
            il vom inversa )
                [2, 4] => [4, 2]
                [8, 2] => [8, 2]
        3) cream numarul cu cifrele din <v>
            [4, 2] = 24
            [8, 2] = 28
          pentru a crea numarul folosim urmatoarea metoda
            numarul = numarul + cifra * (10 ^ locul_in_vector)
        4) apoi ordinam vectorul  crescator ca sa putem afisa
           cel mai mic numar 
        5) se repeta punctu 3)
}


function in_v(x :byte):boolean;
{ Parametri:
    - x => cifra 
  Return:
    - True => cifra se afla in vectorul <v>
    - False => cifra nu se afla in vectorul <v>
}
var i :byte;
begin
in_v := false;

for i := 1 to nr_cif do
    if x = v[i] then
        in_v := true;
end;



{ Program Principal }
begin
write('n=');
readln(n);

nr_cif := 0; { Sticam cate cifre sunt in <v> }

{ Adaugam cifrele in vector }
while n > 0 do
    begin
    c := n mod 10;
    n := n div 10;

    if (not in_v(c)) AND (c mod 2 = 0) then { Daca cifra nu e deja in vector si
                                              este para }
        begin
        inc(nr_cif); 
        v[nr_cif] := c;
        end;
    end;


{ Sortam vectorul decrescator  }
for i := 1 to nr_cif - 1 do
    for j := i + 1 to nr_cif do
        if v[i] < v[j] then
            begin
            aux := v[i];
            v[i] := v[j];
            v[j] := aux;
            end;


n := 0; { Vom creea numarul tot in <n> }
put := 1; { Folosim <put>  pentru a stoca puterile lui 10 }
for i := 1 to nr_cif do
    begin
    n := n + v[i]*put;
    put := put * 10;
    end;

{ Afisam rezultatul numaru cel mai mare  }
writeln(n);



{ Sortam vectorul crescator  }
for i := 1 to nr_cif - 1 do
    for j := i + 1 to nr_cif do
        if v[i] > v[j] then
            begin
            aux := v[i];
            v[i] := v[j];
            v[j] := aux;
            end;


n := 0; { Vom creea numarul tot in <n> }
put := 1; { Folosim <put>  pentru a stoca puterile lui 10 }
for i := 1 to nr_cif do
    begin
    n := n + v[i]*put;
    put := put * 10;
    end;

{ Afisam rezultatul numarul cel mai mic  }
writeln(n);

readln;
end.
