(* Fișierul matrice.in conţine pe prima linie un număr natural n (0≤n≤50), iar pe *)
(* următoarele 2*n linii câte n numere naturale de cel mult 5 cifre fiecare, *)
(* separate prin câte un spaţiu reprezentând elementele a două matrice a şi b cu *)
(* câte n*n elemente fiecare. Verificaţi dacă matricea b este obţinută din *)
(* matricea a prin rotirea spre stânga cu 270 de grade, afişând un mesaj *)
(* corespunzător („Da” / „Nu”).  *)
(* Exemplu:  *)
(* Dacă fişierul matrice.in are următorul conţinut : *)
(*     3 *)
(*     1 2 3 *)
(*     3 4 5 *)
(*     5 6 7 *)
(*  *)
(*     5 3 1 *)
(*     6 4 2 *)
(*     7 5 3   atunci se va afişa DA. *)
program atestat_2015_27;
type matrice=array[1..50,1..50] of integer;
var a, b :matrice;
    i, j, n :integer;
    ok :boolean;
    f :text;

{ Obs.
    In exemplu ei au pus un spartiu intre prima matrice si a doua, dar in enunt
    spun 2*n linii adica n linii de la priam matrice si n de la a doua => nici
    un spartiu intre ele, in rezovlare voi lua in considerare enuntul
}

{ Obs.
    270 grade spre stanga = 90 grade spre dreapta , adica prima linie devine a
    n-a coloana, a doua linie a n-1 coloana si asa mai departe
    adica a[1,1] = a[1,3] sau a[2,1] = a[1,2] sau a[1,3] = a[1,3]

  Obs. Metoda de rezolvare
    - citim cele doua matrici 
    - parcurgem prima matrice si verificam daca corespondentul din a doua
      matrice este egal cu cel din prima, daca nu iesim din for-uri si ok
      devine false
    - afisam 'da' dau 'nu' in functie de valoare lui ok
}

{ Program Principal }
begin
assign(f, 'matrice.in');
reset(f);

readln(f, n); { citim n-ul }

{ citim prima matrice, a }
for i := 1 to n do
    begin
    for j := 1 to n do 
        read(f, a[i,j]);
    readln(f);{ trecem pe linia urmatoare }
    end;

{===========================================}
{ daca se ia in considerare spatiul eliminam parantezele care inconjoara linia
  urmatoare, care doar trece peste linia goala }
{ readln(f); }
{===========================================}

{ citim a doua matrice, b}
for i := 1 to n do
    begin
    for j := 1 to n do 
        read(f, b[i,j]);
    readln(f);{ trecem pe linia urmatoare }
    end;

ok := true; { initializam ok }

for i := 1 to n do 
    begin
    for j := 1 to n do
        if a[i,j] <> b[j,n-i+1] then { daca elementul a[i,j] e diferit de
                        elementu corespunzator din b( adica b[j, n-i+1])}
            begin
            ok := false; { nu se respecata regua }
            break; { iesim din for-ul lui j }
            end;
    if not ok then { daca s-a rupt regula }
        break; { iesim din forul lui i }
    end;




if ok then
    write('Da')
else
    write('Nu');

readln;
end.
