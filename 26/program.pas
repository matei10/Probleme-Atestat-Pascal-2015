(* Fie un vector v cu n elemente numere întregi citite de la tastatură. Scrieţi *)
(* programul C/C++ care mută la sfârșitul lui v elementele sale nule, păstrând *)
(* ordinea celorlalte elemente și afișează pe ecran elementele vectorului *)
(* modificat. *)
(* Exemplu: se citeşte: n=7 şi vectorul v=(2,3,0,9,0,0,8) *)
(*                 se afişează: v=(2,3,9,8,0,0,0) *)
(*  *)
program atestat_2015_26;
type vector=array[1..100] of integer;
var v :vector;
    n, i, k, nr:integer;

{ Obs. metoda de rezolvare 
    - citesc vectorul
    - trec prin fiecare element si mut elementele care nu sunt nule 
      in fata cate una ( folosind o variabila k)
    - in timp ce mut elementele nenule numar elementele nule in nr
    - dupa ce am termiant de mutat ultimele nr elemente ale vectorului
      le voi initializa cu 0
}

{ Program Atestat }
begin
write('n=');
readln(n);

{ citim vecoturl }
for i := 1 to n do
    begin
    write('v[',i,']=');
    readln(v[i]);
    end;



k := 1; { pozitia in care sa mutam elementele }
nr := 0; { numarl de elementen nule}
for i := 1 to n do { mergem de la 1 la n }
    if v[i] <> 0 then { daca elementul nu este null }
        begin
        v[k] := v[i]; { il mutam in pozitia k }
        inc(k); { pozitia k se mareste cu o unitate }
        end
    else { daca nularul este null }
        nr := nr+1; { il numaram }
        



{ initlializez ultimele nr elemente cu 0}
for i := n downto 1 do { mergem de la ultimul element la primu }
    if nr > 0 then { daca mai avem elemente de initlializat }
        begin
        v[i] := 0; { initializam elementul }
        nr := nr-1; { mai avem nr-1 elemente de initializat }
        end;


{ afisez vectorul }
for i := 1 to n do
    write(v[i], ' ');

readln;
end.
