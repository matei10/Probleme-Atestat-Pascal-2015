(* Scrieţi un program care citeşte de la tastatură un număr natural nenul n şi un *)
(* șir de n numere întregi și afișează pe ecran valorile distincte citite și *)
(* frecvența în șir a fiecărei valori. *)
program atestat_2015_36;
type vector=array[1..100] of integer;
var v, dis :vector;
    i, n, n_dis :integer;

{ Obs. Metoda de rezolvare
    - citim elementele in vectorul 'v'
    - punem valorile din vecotul 'v' in vectorul 'dis' o singura data,
      folosim un subprogram 'nr_ap_dis(x)' care returneaza de cate ori
      apare 'x' in vecotrul 'dis'
    - parcurgem vectorul 'dis' si pentru fiecare element folosim un
      alt suprogram 'nr_ap_v(x)' care returneaza de cate ori apare 'x'
      in vectorul 'v'
}

function nr_ap_dis(x :integer):integer;
{ Parametri:
    - x -> elementul pe care il vom cauta 
  Return:
    - integer -> de cate ori apare elementul 'x' in vectorul 'dis'
}
var i :integer;
begin
nr_ap_dis := 0;
for i := 1 to n_dis do { parcurgem elementele din 'dis' }
    if dis[i] = x then { daca am gasit elementul 'x' }
        nr_ap_dis := nr_ap_dis + 1; { numaram apariata }
end;


function nr_ap_v(x :integer):integer;
{ Parametri:
    - x -> elementul pe care il vom cauta 
  Return:
    - integer -> de cate ori apare elementul 'x' in vectorul 'v'
}
var i :integer;
begin
nr_ap_v := 0;
for i := 1 to n do { parcurgem elementele din 'v' }
    if v[i] = x then { daca am gasit elementul 'x' }
        nr_ap_v := nr_ap_v + 1; { numaram apariata }
end;


{ Program Principal }
begin
write('n=');
readln(n);

{ citim elementele }
for i := 1 to n do
    begin
    write('v[', i,']=');
    readln(v[i]);
    end;


{ punem elementele distincte ale lui 'v' in 'dis' }
n_dis := 0;
for i := 1 to n do
    if nr_ap_dis(v[i]) = 0 then
        begin
        n_dis := n_dis + 1;
        dis[n_dis] := v[i];
        end;

{ afisam pentru fiecare element distinct numarul de aparitii in vectorul 'v' }
for i := 1 to n_dis do { pentru fiecare element distinct din 'v' }
    writeln(dis[i] ,'-', nr_ap_v(dis[i])); { afisam elementul si de cate ori
                                            apare in 'v' }

readln;
end.
