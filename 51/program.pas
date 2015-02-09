(* Scrieţi programul C/C++ care citeşte de la tastatură  un cuvânt format din cel *)
(* mult 15 litere mici ale alfabetului englez şi care afişează pe ecran, pe linii *)
(* distincte, cuvintele obţinute prin ştergerea succesivă a vocalelor din cuvântul *)
(* citit, de la stânga la dreapta, ca în exemplu de mai jos: *)
(*     Exemplu: Dacă se citeşte cuvântul vacanta se afişează: *)
(*         vacant  *)
(*         vacnt  *)
(*         vcnt *)
program atestat_2015_51;
var s :string;
    i :integer;

{ Obs.
    Exemplul elimina litere de la dreapta la stanga desi se cere sa fie 
    eliminate de la stanga la dreapta.
    In exemplu:
        'vacanta' devine 'vacant' -> a fost eliminat ultimul 'a'
        'vacant' devine 'vacnt' -> a fost eliminat 'a'-ul dintre 'c' si 'n'

    Un exemplu corect (care respecata enuntul) ar fi :
        'vacanta' devine 'vcanta'
        'vcanta' devine 'vcnta'
        'vcnta' devine 'vcnt'

        adisa se va afisa pentru cuvantul 'vacanta'
        vcanta
        vcnta
        vcnt

}
{ Obs. Metoda de rezolvare 
    - citim cuvantul in variabila 's' 
    - parcurgem toate caracterele cuvantului de la stanga la dreapta
      (daca urmam exemplul) sau de la dreapta la stanga daca urmam
      enuntul 
        - cand gasim o vocala o eliminam si afisam cuvantul 
}





function este_vocala(c :char):boolean;
{ Parametri:
    - 'c' -> un caracter
  Return:
    - 'True' -> daca 'c' este vocala
    - 'False' -> daca 'c' nu este vocala
}
begin
case c of
    { daca 'c' are una din valorile de mai jos, este vocala }
    'a' : este_vocala := true;
    'e' : este_vocala := true;
    'i' : este_vocala := true;
    'o' : este_vocala := true;
    'u' : este_vocala := true;
    else { daca nu, nu este vocala }
        este_vocala := false;
    end;
end;



{ Program Principal }
begin
write('s=');
readln(s);

for i := length(s) downto 1 do { parcurgem caracterele de la stanta la dreapta }
{ pentru a parcurge vectoul de la dreapta la stanga ( cum se cere in enunt )
  vom inlocui 'length(s) downto 1' cu '1 to length(s)                   }
    if este_vocala(s[i]) then { daca caracterul e o vocala }
        begin
        delete(s, i, 1); { deletam vocala }
        writeln(s); { afisam cuvantul fara vocala }
        end;


readln;
end.
{
    *delete = primeste 3 parametri
            1) sirul de unde vrem sa deletam
            2) din ce pozitie in sir dorim sa deletam
            3) cate caractere vrem sa deletam
            procedura deleteaza din sirul primit ca prim paramteru de pe
            pozitia primita ca al doilea parametru numaru de caractere
            specificate in al treilea parametru
            }
