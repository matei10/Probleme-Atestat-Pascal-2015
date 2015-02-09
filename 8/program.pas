(* Se citeşte de la tastatură un număr natural n cu maximum cinci cifre. Afişaţi *)
(* cel mai apropiat număr faţă de n care are aceeaşi sumă a cifrelor. (Dacă sunt *)
(*     două numere cu această proprietate se vor afișa ambele, separate printr-un *)
(*     spațiu.) *)
program atestat_2015_8;
var suma :integer;
    n, k :longint;
    ok :boolean;

{ Obs. Metoda de rezolvare 
    vom folosi in 'ok' de tip booleanl ca sa vedem daca am gasit sau nu un numar
    care are suma cifrelor egala cu a lui 'n' 
    
    o sa ne departam de n cu o unitate si o sa verificam daca numarul la care
    am ajuns respecta propietatea

    folosim un 'k' ca sa marim numarul de unitati, daca avem si 'n-k' si 'n+k' care
    respecta regula le afisam pe amandoua

    exemplu :
        n=24  sum = 6
        15 e la 9 unitati distanta si are suma 6 
        33 e la 9 unitati distatanta si are suma tot 6

        trebuie afisat si 15 si 33 

}



function suma_cif(x :longint):integer;
{ Parametri:
    - 'x' -> numarul caruia ii vom returna suma 
  Return:
    - 'integer' -> suma cefrelor 
    }
var c :integer;
begin
suma_cif := 0;

while x > 0 do
    begin
    c := x mod 10;
    x := x div 10;
    suma_cif := suma_cif + c;
    end;
end;


{ Program Principal }
begin
write('n=');
readln(n);

ok := false; 
k := 1;
suma := suma_cif(n);

while not ok do
    begin
    if suma_cif(n-k) = suma then
        begin
        writeln(n-k);
        ok := true;
        end;

    if suma_cif(n+k) = suma then
        begin
        writeln(n+k);
        ok := true;
        end;

    k := k + 1;
    end;

readln;
end.


