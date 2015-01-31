(* Fişierul cuv_a.txt conţine pe prima linie un număr natural n(n<=20) și pe *)
(* fiecare din următoarele n linii câte un cuvânt cu maximum 20 litere. Să se *)
(* afișeze pe ecran cuvintele din fișier, în ordine alfabetică. *)
program atestat_2015_43;
type vector=array[1..20] of string;
var v :vector;
    i, n, j :integer;
    aux :string;
    f :text;

{ Obs. Metoda de rezolvare
      - citim 'n'-ul 
      - citim cele 'n' cuvinte intr-un vector 'v'
      - ordonam alfabetic vectorul 'v'
      - afisam vectorul
}


{ Program Principal }
begin
assign(f, 'cuv_a.txt');
reset(f);

readln(f, n); { citim n-ul };
for i := 1 to n do
    readln(f, v[i]);

{ ordonam vectorul }
for i := 1 to n-1 do
    for j := i+1 to n do
        if v[i] > v[j] then
            begin
            aux := v[i];
            v[i] := v[j];
            v[j] := aux;
            end;


{ afisam vectorul }
for i := 1 to n do
    writeln(v[i]);

readln;
end.
