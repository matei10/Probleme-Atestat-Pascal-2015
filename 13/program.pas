(* Scrieți un program care afișează pe ecran toate numerele naturale cu exact k *)
(* cifre (k <5) care sunt rotunde (un număr natural este număr rotund dacă numărul *)
(*     de cifre 0 este egal cu numărul de cifre 1 în reprezentarea sa binară). *)
(*     Exemplu: 12(10)=1100(2) este număr rotund; 13(10)=1101(2)  nu este rotund ) *)
program atestat_2015_13;
var k, i :longint;



{ Obs. Metoda de rezolvare 
    - pornim cu un for de la 1 la k 
    - transformam numarul intr-un string care reprezinta valoarea lui in baza
      2 .
    - numaram cate zerouri si cati de 1 se gasesc in acel string, daca cele doua
      numere sunt egale afisam numarul
}

function to_2(x :longint):string;
{ Parametri:
    - x => numarul pe care dorim sa il transformam 
  Return:
    - string => reprezinta valoarea numarului in baza 2
}
var c : integer;
    st :string;
begin
to_2 := '';

while x > 0 do
    begin
    c := x mod 2;
    x := x div 2;

    { transformam cifra in string }
    str(c, st);
    to_2 := to_2 + st;
    end;

{ Am optinut oglinditul numarului in sistem binar, acum trebuie sa il scriem
    invers}
st := to_2;
to_2 := '';
for c := length(st) downto 1 do
    to_2 := to_2 + st[c];
end;




function e_rotund(s :string):boolean;
{ Parametri:
    - s => stringul cu expresia binara 
  Return:
    - True => numarul zerourilor egal cu numarul cifrelor 1
    - False => numarul rezourilor diferit de numarul cifrelor 1
}
var nr_0, nr_1, i :integer;
begin
nr_0 := 0;
nr_1 := 0;

for i := 1 to length(s) do
    if s[i] = '1' then
        inc(nr_1)
    else
        inc(nr_0); { Fiind un sir format doar din 0 si 1 evidenta ca daca o
                    valoare nu e 1 atunci e 0 }

if nr_0 = nr_1 then
    e_rotund := true
else
    e_rotund := false;
end;



{ Program Principal }
begin
write('k=');
readln(k);


{ Mergem cu un for prin toate numerele de la 1 la k }
for i := 1 to k do
    if e_rotund(to_2(i)) then
        writeln(i,' - ',to_2(i));

readln;
end.



