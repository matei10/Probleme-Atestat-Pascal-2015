(* Scrieţi programul C/C++ care citeşte de la tastatură un număr de n şiruri de *)
(* cel mult 40 de caractere, formate doar din litere mici ale alfabetului englez *)
(* și verifică dacă fiecare din primele n-1 șiruri de caractere au ultimul *)
(* caracter egal cu caracterul cu care începe șirul următor. În caz afirmativ *)
(* programul va afișa pe ecran mesajul Sirurile citite verifica proprietatea, *)
(* respectiv,  Sirurile citite nu verifica proprietatea! în caz contrar. *)
program atestat_2015_47;
type vector=array[1..100] of string;
var v :vector;
    ok :boolean;
    i, n :integer;

{ Obs. Metoda de rezolvare 
    - citim 'n'-ul
    - citim cele 'n' siruri de caractere
    - parcurgem primele 'n-1' siruri
        - verificam daca fiecare sir are ultimul caracter egal
          cu primul caracter al sirului de dupa ele
    - folosim o variabila 'ok' ca sa vedem daca sirurile verifica
      sau nu proprietatea
    - afisam mesajul corect in functie de 'ok'
}


{ Program Principal }
begin
write('n=');
readln(n);

{ citim cele 'n' siruri }
for i := 1 to n do
    begin
    write('v[', i, ']=');
    readln(v[i]);
    end;


{ verificam daca sirurile respecta regula }
ok := true;

for i := 1 to n-1 do
    if v[i][length(v[i])] <> v[i+1][1]then
        { pentru a afla ultimul caracter, obtinem marimea fisierului folosind
          'length(v[i])' si comparam  acest caracter cu primul caracter ar
          sirului urmator 'v[i+1]' primul caracter fiind 'v[i][1]' }
        ok := false;


{ afisam mesajul corespunzator }
if ok then
    writeln('Sirurile citite verifica proprietatea')
else
    writeln('Sirurile citite nu verifica proprietatea!');

readln;
end.

