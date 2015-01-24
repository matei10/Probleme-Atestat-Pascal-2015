(* Dat n natural, să se descompună ca sumă de puteri distincte ale lui 2. *)
(* Exemplu : 25=24+23+20. *)
program atestat_2015_17;
var x, k :integer;

{ Obs. Metoda de rezolvare 
    - gasim cea mai mare putere a lui 2 care este mai mica ca numarul 
    - din x se scade acea putere
    - repetam procesul 
  Obs.
    vom folosi un subprogram ca sa calcula puterile lui 2
}


function putere(b, e :integer):integer;
{ Parametri:
    - b => baza
    - e => exponentul
  Return
    - integer => b*b*b*b de e ori adica b ^ e
}
var i :integer;
begin
putere := 1;

for i := 1 to e do
    putere := putere * b;
end;

{ Program Principal }
begin
write('x=');
readln(x);

k := 0; { in aceasta variabila vom stoca puterea lui 2 }

while x > 0 do
    begin
    if putere(2, k+1) > x then { daca 2^(k+1) > x atunci 2^k este < x }
        begin
        writeln(2,'^',k); { afisam puterea }
        x := x - putere(2 ,k); { din x scoatem 2 la puterea cea mai mare care
                                    respecta regula }
        k := 0;{ resetam puterea lui 2 }
        end
    else
        inc(k); { daca 2^(k+1) nu e cea mai mare putere continuam cautarea }
    end;


readln;
end.
