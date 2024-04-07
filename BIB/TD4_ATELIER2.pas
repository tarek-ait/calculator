Program eng;
Uses Wincrt;
Type
  T2 = Array[1..3,1..3] Of String;
  objet = Record
    Tmots : T2;
    car : Char;
    Fcar: Integer;
    Plus1D : Boolean;
  End;
Var
  O: objet;
  i,j: Integer;
Procedure remplirTmots(Var T:T2);
Var
  i,j: Integer;
Begin
  For i := 1 To 3 Do
    Begin
      For j:=1 To 3 Do
        Begin
          Write('T[',i,',',j,'] = ');
          Readln(T[i,j]);
        End;
    End;
End;
Procedure writeTmots(T:T2);
Var
  i,j: Integer;
Begin
  For i := 1 To 3 Do
    Begin
      Write('           ');
      For j:=1 To 3 Do
        Begin
          Write(T[i,j],'|');
          If j = 3 Then Writeln;
        End;
    End;
End;
Function freqcarTmots(T:T2;c:Char): Integer;
Var
  i,j,fc,x: Integer;
  mot: String;
Begin
  fc := 0;
  For i := 1 To 3 Do
    Begin
      For j:= 1 To 3 Do
        Begin
          mot := T[i,j];
          For x := 1 To Length(mot) Do
            Begin
              If mot[x] = c Then
                fc := fc + 1;
            End;
        End;
    End;
  freqcarTmots := fc;
End;
Function appearance(T:T2;c:Char): Boolean;
Var
  i,j,x,fc: Integer;
  mot: String;
  exist: Boolean;
Begin
  fc := 0;
  For i := 1 To 3 Do
    Begin
      For j:= 1 To 3 Do
        Begin
          mot := T[i,j];
          exist := False;
          For x := 1 To Length(mot) Do
            Begin
              If mot[x] = c Then
                Begin
                  exist := True;
                End;
            End;
          If exist Then
            fc := fc +1 ;
        End;
    End;
  If fc > 1 Then
    appearance := True
  Else
    appearance := False;
End;
Begin
  With O Do
    Begin
      Writeln('-------------------------------------');
      remplirTmots(Tmots);
      Writeln;
      Writeln('    tableau des mots :');
      Writeln('    -----------------');
      writeTmots(Tmots);
      Writeln;
      Write('Caracter < c > de l''objet : ');
      Readln(car);
      Fcar := freqcarTmots(Tmots,car);
      plus1D := appearance(Tmots,car);
    End;
  With O Do
    Begin
      Writeln;
      Writeln('Objet : ');
      Writeln('            Caractere Rech = ',car);
      Writeln('         NB Caractere Rech = ',Fcar);
      Writeln('    Plus 1D Caractere Rech = ',Plus1D);
      Writeln('    tableau des mots :');
      Writeln('    -----------------');
      writeTmots(Tmots);
    End;
End.