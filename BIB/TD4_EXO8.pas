Program tarek;
Uses Wincrt,BIB02;
Type
  suduko = Record
    nom : String[15];
    age : Integer;
    grillefi : tab2D;
    temps : Integer;
  End;
  tab = Array[tind] Of suduko;
Var
  S: suduko;
  T: tab;
  N,i: Integer;
  LG,CG: tind;

Procedure remplircondidat(Var S:suduko;Var T:tab; N:Integer);
Var
  i: Integer;
  G: tab2D;
  LG,CG: tind;
Begin
  Write('donener le nombre des condidats : ');
  Readln(N);
  With S Do
    Begin
      For i := 1 To N Do
        Begin
          Writeln ;
          Writeln('Condidat N°=',i);
          Writeln('-----------------');
          Write('Le nom : ');
          Readln(T[i].nom);
          Write('L''age : ');
          Readln(T[i].age);
          Write('La grille : ');
          ALEAT2D(T[i].Grillefi,LG,CG);
          Write('le temps a remplir : ');
          Readln(T[i].temps);
        End;
    End;
End;
Begin
  Write('donener le nombre des condidats : ');
  Readln(N);
  With S Do
    Begin
      For i := 1 To N Do
        Begin
          Writeln ;
          Writeln('Condidat N°=',i);
          Writeln('-----------------');
          Write('Le nom : ');
          Readln(T[i].nom);
          Write('L''age : ');
          Readln(T[i].age);
          Write('La grille : ');
          ALEAT2D(T[i].Grillefi,LG,CG);
          Write('le temps a remplir : ');
          Readln(T[i].temps);
        End ;
    End;
  LG := 9;
  CG := 9;
  With S Do
    Begin
      For i := 1 To N Do
        Begin
          Writeln ;
          Writeln('Condidat N°=',i);
          Writeln('-----------------');
          Writeln('name :',T[i].nom);
          Writeln('age : ',T[i].age);
          Writeln;
          write2D(T[i].grillefi,LG,CG);
          Writeln;
          Writeln('time : ',T[i].temps);
        End;
    End;
End.
