(* Scrieţi programul  C/C++  care citeşte de la tastatură un şir s de cel mult 30 *)
(* de caractere şi un caracter c. Programul determină triplarea fiecărei apariţii *)
(* a caracterului c în șirul s şi scrie noul şir obţinut în fişierul text *)
(* final.out.   *)
(* De exemplu, dacă se citeşte şirul : ciocarlie şi caracterul c atunci fişierul *)
(* va conţine şirul : ccciocccarlie. *)
program atesta_2015_42;
var s :string;
    c :char;
    i :integer;

{ Obs. Metoda de rezolvare
    - citim sirul in variabila 's'
    - citim caracterul in variabila 'c'
    - parcurgem stringul 's' si pentru fiecare caracter egal cu caracterul din
      variabil 'c' o sa inseram caracterul de doua ori ( daca l-am gasit o data
      inserandul de inca doua ori o sa il avem in total de trei ori in sir )
}



{ Program Principal }
begin
{ citim sirutl }
write('s=');
readln(s);

{ citim caracterul }
write('c=');
readln(c);

i := 1;
while i <= length(s) do { cat timp 'i'-ul este mai mic sau egal ca lungimea sirului 's' }
    begin
    if s[i] = c then { daca caracterul de pe pozitia 'i' din stringul 's' este
                        acelas cu caracterul 'c' }
        begin
        insert(c+c, s, i); { inseram de doua ori caracterul 'c' ( 'c+c') in
                            stringul 's' , pe pozitia 'i' }
        i := i + 2; { marim 'i'-ul cu 2 deoarece am pus doua caractere 'c' si
                        nu vrem sa le gasim tot pe astea la urmatoarea iteratie }
        end;
    
    i := i + 1; { trecem la urmatorul caracter din s }
    end;


{ afisam stringul }
writeln(s);
readln;
end.

{ Explicatii :
    * length = returneaza lungimea unui sir de caractere
                Exemplu:
                    length('abc')  va returna 3 deoarece sirul are 
                    3 caractere
    * insert = primeste 3 parametri:
                    - primul este strigngul unde vrem sa inseram ceva 
                    - al doilea este pozitia in care dorim sa inseram ceva
                    - al treilea este stringul pe care dorim sa il inseram
}
