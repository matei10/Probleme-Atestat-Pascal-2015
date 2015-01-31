(* O structură cu numele cerc are trei câmpuri x, y, r reprezentând abscisa și *)
(* ordonata centrului cercului, respectiv raza acestuia. Scrieţi programul C/C++ *)
(* care citeşte de la tastatură un număr natural n < 100 și n triplete de valori *)
(* întregi reprezentând coordonatele și razele a n cercuri și afișează *)
(* coordonatele centrelor cercurilor în ordinea crescătoare a razelor lor. *)
program atestat_2015_46;
type cerc=record
        x, y, r :integer;
        end;

    vector=array[1..100] of cerc;
var v :vector;
    n, i, j :integer;
    aux :cerc;


{ Obs. Metoda de rezolvare
    - citim 'n'-ul
    - citim cele 'n' perechi de valori 'x', 'y', 'r' in vectorul 'v'
    - ordonam vectorul 'v' in functie de valoarile lui 'r' a fiecarui
      element
}

{ Program Principal }
begin
write('n=');
readln(n);

for i := 1 to n do
    begin
    writeln('Cercul ', i);

    write('x=');
    readln(v[i].x);

    write('y=');
    readln(v[i].y);

    write('r=');
    readln(v[i].r);
    end;


{ ordonam vectorul in functie de valorile lui 'r', 
  adica o sa comparam valorile lui 'r' cand sortam }
for i := 1 to n-1 do
    for j := i+1 to n do
        if v[i].r > v[j].r then
            begin
            aux := v[i];
            v[i] := v[j];
            v[j] := aux;
            end;


{ afisam coordonatele ficarui element }
for i := 1 to n do
    writeln('(', v[i].x, ', ', v[i].y, ')');

readln;
end.
