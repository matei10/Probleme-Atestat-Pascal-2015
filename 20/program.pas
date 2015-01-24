(* Se citesc n (n<=100) numere naturale nenule. Să se afișeze numărul de zerouri *)
(* cu care se va termina produsul numerelor fără a calcula efectiv produsul lor. *)
(* Exemplu: Pentru n=3 și numerele 25, 12, 9 se afişează  2. *)
program atestat_2015_20;
var n, nr, nr_5, nr_2 :integer;

{ Obs. Metoda de rezolvare
    Dupa cum stim de la orele de informatica ca un produs sa aiba zerouri la
    final in descompunerea lui in factori primi trebuie sa avem 2*5 
    pentru a vedea cate zerouri o sa avem trebuie sa vedem cate perechi de 2*5
    avem in descompunerea in factori primi
    - citim numerele
    - trecem prin fiecare si folosim o procedura care o sa vada de cate ori se
      divide un numar la 2 si o sa adauge valoarea numarului total de divizori a lui 2 a
      produsului final <nr_2> , procedura va face acelas lucru si pentru 5
    - ca sa vedem cate perechi de 2*5 sunt vedem care dintre cele doua valori(
      nr_5 si nr_2 e mai mic si acela va fi numarul de zerouri de la final)

    ATENTIE:
        Nu salvam numerele , odata citite le descompunem si continuam citirea 
}

procedure desc(x :integer);
{ Parametri:
    - x => numarul pe care il vom preluca
  Obs.
    - procedura va imparti numarul la 2 cat timp se imparte exact
      si vom numara de cate ori s-a putut si vom aduna acel lumar la numarul
      total de 2 in produsul final
    - idem si pentru 5
}
var putere_2, putere_5 :integer;
begin

putere_2 := 0;
putere_5 := 0;

while x mod 2 = 0 do
    begin
    x := x div 2;
    inc(putere_2);
    end;

while x mod 5 = 0 do
    begin
    x := x div 5;
    inc(putere_5);
    end;

{ adaugam divizori la numaratoare globala }
nr_2 := nr_2 + putere_2;
nr_5 := nr_5 + putere_5;
end;


{ Program Principal }
begin
write('n=');
readln(n);

while n > 0 do { cat timp mai avem numere de citit }
    begin
    write('nr =');
    readln(nr);

    desc(nr);

    dec(n); { 'dec(nr)' = 'nr := nr-1', adica am citit un numar mai avem n-1 de citit }
    end;



{ vedem care valoare e mai mica si o afisam }
if nr_2 > nr_5 then
    writeln(nr_5)
else
    writeln(nr_2);

readln;
end.
