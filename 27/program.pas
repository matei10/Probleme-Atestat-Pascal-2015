(* Fie a o matrice pătratică de ordin n (n<=20). Scrieți o funcţie de ordonare a *)
(* unui vector de dimensiune k, și utilizând această funcție, ordonați elementele *)
(* situate pe liniile impare. Afișați matricea obținută. *)
program atestat_2015_27;
type matrice=array[1..20,1..20] of integer;
var a :matrice;
    n, i :integer;


{ Obs.
    Domnul profesor a spus sa simplific rezolvarea in asa fel incat sa nu mai
    contina chestii care nu au fost facute la clasa, asa ca vom folosi o
    procedura care ordoneaza liniile matrici 'a' si ca sa stie ce linie sa
    ordineze primeste ca marametru numarul liniei 

    ordonarea va fi creascatoare 

  Obs. Metoda de rezolvare
    - citim matricea
    - trecem prin liniile matrici
    - daca numarul liniei este impar
    - folosim o procedura sa ordonam linia crescator
    - afisam matricea

}

procedure citire_matrice(n :integer);
{ Parametri:
    - n -> ordinul matrici 
  Obs.
    - citeste o matrice de ordin n 
}
var i, j :integer;
begin
for i := 1 to n do
    for j := 1 to n do
        begin
        write('a[',i,' ,',j,']=');
        readln(a[i, j]);
        end;
end;


procedure ordonare_v(linie :integer);
{ Parametri:
    - 'linie' -> linia pe care vrom sa o sortam

  Procedura va ordona crescator linia din matrice 
                  }
var i, j, aux :integer;
begin
for i := 1 to n-1 do { sortarea clasica crescatoare }
    for j := i+1 to n do
        if a[linie, i] > a[linie, j] then
            begin
            aux := a[linie, i];
            a[linie, i] := a[linie, j];
            a[linie, j] := aux;
            end;
end;



procedure afisare_matrice(a :matrice; n :integer);
{ Parametri:
    - 'a' -> matricea ce dorim sa o afisam
    - 'n' -> ordinul matrici 
}
var i, j :integer;
begin
for i := 1 to n do
    begin
    for j := 1 to n do
        write(a[i, j], ' ');
    writeln;
    end;
end;



begin
write('n=');
readln(n);

citire_matrice(n);

for i := 1 to n do
    if i mod 2 <> 0 then { daca linia e impara }
        ordonare_v(i); { ordonam linia crescator }


afisare_matrice(a, n);

readln;
end.
