(* În fişierul valori.txt sunt memorate maximum 1000 de numere întregi despărţite *)
(* prin câte un spaţiu. Scrieţi un program care să determine valoarea maximă şi *)
(* valoarea minimă din fișier și numărul de apariţii al maximului, respectiv al *)
(* minimului. *)
(* Exemplu: conţinutul fişierului  valori.txt  este : 24 3 89 24 1 3 1 1 89, *)
(* atunci se vor afişa: *)
(*     min = 1  nr_aparitii = 3 *)
(*     max =  89  nr_aparitii = 2 *)
program atestat_2015_3;
type vector=array[1..1000] of integer;
var v :vector;
    f :text;
    n, max, min, i, nr_ap_max, nr_ap_min :integer;

{ Obs. Metoda de rezolvare
    - citim numere din fisier
    - aflam minimul si maximul 
    - numaral sa vedem de cate ori apare minimul si maximul 
    - afisam rezultatele
}



{ Program Principal }
begin
assign(f, 'valori.txt');
reset(f);

n := 0; { 'n'-ul va tine numarul de valori din fisier }

while not eoln(f) do { 'eoln' = End Of LiNe, cu alte cuvinte, cat timp nu am
                        ajuns la finalul linie }
    begin
    n := n + 1;
    read(f,v[n]);
    end;

close(f); { Inchidem fisierul }

{ Initializam minimul si maximul cu primva valoarea }
min := v[1];
max := v[1];

{ Aflam minimul si maximul }
for i := 2 to n do
    begin
    { Minim }
    if v[i] < min then
        min := v[i];

    { Maxim }
    if v[i] > max then
        max := v[i];
    end;

{ Acum ca avem minimul si maximul o sa mergem din nou prin vector
  sa vedem de cate ori apare nimimul si maximul             }

{ Initializam numarul de aparitii }
nr_ap_max := 0;
nr_ap_min := 0;

for i := 1 to n do
    begin
    { Minim }
    if v[i] = min then
        inc(nr_ap_min);

    { Maxim }
    if v[i] = max then
        inc(nr_ap_max);
    end;

{ Afisam rezultatul }
writeln('min = ',min:6,' nr_aparitii = ',nr_ap_min);
writeln('max = ',max:6,' nr_aparitii = ',nr_ap_max);

readln;
end.
