(* Să se afişeze primele n perechi de numere prime gemene, unde n este un număr *)
(* natural nenul citit de la tastatură. *)
(* Exemplu: Pentru n=4 se afişează perechile (3 ; 5) ; (5 ; 7) ; (11 ; 13) ; (17 ; 19) *)
program atestat_2015_19;
var n, nr :longint;



{ Obs.
  Cum in enunt nu se specifica definitia numerelor "prime gemene" pe google
  am gasit ca 
    doua numere sunt prime si gemene ( prime gemene) daca sunt prime( evident)
    si difera pintn doua unitati 
    adica 3 si 5 sunt prime gemene deoarece si 3 si 5 sunt prime si |3-5| = 2
    7 si 11 nu sunt prime gemene deoarece |7-11| = 4 


    Obs. Metoda de rezolvare 
        - folosim un while ca sa verificam cate perechi am descoperit 
        - folosim o functie care verifica daca un numar este prim
          si o functie care porneste de la un numar si cauta cel mai aproapiat
          numar prim mai mare ca acesta si il returneaza ca sa gasim numerele
          prime in continuare.
        - cand am gasit un numar prim ii adaugam 2 unitati si vedem daca si
          acesta e prim , daca da am mai gasit o pereche
}

        
function este_prim(x :longint):boolean;
{ Parametri:
    - x => numarul pe care il vom verifica 
  Return:
    - True => daca numarul este prim 
    - False => daca numarul nu este prim
}
var i :integer;
begin
este_prim := true;

for i := 2 to trunc(sqrt(x)) do
    if x mod i = 0 then
        begin
        este_prim := false;
        break;
        end;
end;


function next_prim(x :longint):longint;
{ Parametri:
    - x => numarul de la care o sa pornit
  Return:
    - longint => urmatorul numar prim dupa x;
}
begin
next_prim := x +1;
while not este_prim(next_prim) do
    inc(next_prim);
end;




{ Program Principal }
begin
write('n=');
readln(n);

nr := 2;
while n > 0 do { cat timp mai avem perechi de gasit }
    begin
    if este_prim(nr) AND (next_prim(nr) - nr = 2) then
        begin
        writeln('(',nr,'; ',next_prim(nr),')');
        dec(n); { 'dec(n)' e acelas lucru ca si 'n := n-1', adica avem de gasit
                    cu o pereche mai putin  }
        inc(nr); { continuam sa cautam alt numar }
        end
    else { daca nu au fost indeplinite conditiile cautam alt numat }
        inc(nr);
    end;


readln;
end.



