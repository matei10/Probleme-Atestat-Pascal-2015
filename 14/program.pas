(* Fişierul text numere.in conţine pe prima linie un număr natural n (0<n<1000), *)
(* iar pe a doua linie n numere naturale cu cel mult 9 cifre fiecare, despărţite *)
(* prin câte un spaţiu. Scrieţi un program C/C++ care citeşte toate numerele din *)
(* fişier şi afişează pe ecran, separate prin câte un spaţiu, numerele de pe a *)
(* doua linie a fişierului, care au toate cifrele egale. *)
program atestat_2015_14;
var n, i :integer;
    f :text;
    nr :longint;


{ Obs. Metoda de rezolvare 
    citim n-ul
    citim cate un numar din fisier
    folosim un subprogram sa vedem daca numarul are toate cifrele egale
    daca le are il afisam , daca nu il citim pe urmatoru 

  Obs. 2
    in cerinta se cere un program in C/C++ dar o sa il fac evident
    in pascal
}

function cif_eg(x :longint):boolean;
{ Paramentri:
    - x => numarul pe care il vom verifica 
  Return:
    - True => daca are toate cifrele egale ( ex. 999 , 333 )
    - False => daca nu are toate cifrele egale (ex. 123, 882)
}
var c, first_c :byte;
begin
cif_eg := true; { Presupunem ca are toate cifrele egale }
first_c := x mod 10; { Scoatem prima cifra }
x := x div 10; { Eliminam cifra din numar }
while x > 0 do
    begin
    c := x mod 10; { Scoatem cate o cifra }
    x := x div 10;
    if c <> first_c then { Daca cifra e diferita de prima }
        begin
        cif_eg := false; { Nu are toate cifrele egale }
        break; { Iesim din while }
        end;
    end;
end;



{ Program Principal }
begin
assign(f, 'numere.in');
reset(f);

readln(f, n); { Citim n-ul }

for i := 1 to n do 
    begin
    read(f, nr);
    if cif_eg(nr) then
        write(nr, ' ' );
    end;

close(f); { Inchidem fisierul }



readln;
end.
