(* Se citește de la tastatură un număr natural n cu cel mult nouă cifre. Scrieți *)
(* un program care verifică  dacă există un  număr natural k cu proprietatea că *)
(* n=1*2*3*…*k. În caz afirmativ programul va afișa mesajul “Da” și valoarea k , *)
(* altfel va afișa mesajul “Nu”. *)

(*  Obs. *)
(*  Programul verifica daca numarul n este un factorial, daca este printeaza si *)
(*  cat factorial ne va da n . *)
program atestat_2015_2;
var n, sum, k :longint;

{ Program Principal }
begin
{ Citim n-ul }
write('n=');
readln(n);

{ Initializam suma  si k-ul}
sum := 1; { In aceasta variabila vom calcula produsul 1*2*3*...k }
k := 1; { Vom mari k-ul cu unu }

while sum < n do { Cat timp suma este strict mai mica decat numarul continuam
                    incrementarea  }
    begin
    inc(k); { "inc(k)" e acelas lucrur cu "k := k + 1;" }
    sum := sum * k; { Mai adaugam un termen sumei }
    end;

{ Avem doua cazuri :
    - suma este egal cu n ;
    - suma este mai mare decat n;
}

if sum = n then
    begin
    writeln('Da');
    writeln('k=',k);
    end
else
    writeln('Nu');

readln;

end.
    
    
