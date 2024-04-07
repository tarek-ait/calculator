Unit BIB03;

Interface
uses wincrt,BIB02;
Type
  table = Array[tind] Of String;
Function Palind(Ph:String): Boolean;
Function Copyy(ph:String;p,n:Integer):String;
Function Concat(ph1,ph2:String): String;
Procedure convert(ph:String;var T:table;var tai:tind);
Procedure writet(T:table;tai:tind);

Implementation
// **********************les chaines de caracteres*************************
// --------------------------------------------------------------------------
// ---------------------- phrase palindrome ---------------------------------
Function Palind(Ph:String): Boolean;
Var
  CH1,CH2: String;
  i: Integer;
Begin
  PALIND := False ;
  CH1 := '';
  CH2 := '';
  For i := 1 To Length(ph) Do
    Begin
      If (Ord(Upcase(ph[i])) >= 65 ) And (Ord(Upcase(ph[i])) <= 90 ) Then
        Begin
          CH1 := CH1 + Upcase(ph[i]);
          CH2 := Upcase(ph[i]) + CH2;
        End;
      If CH1 = CH2 Then
        Begin
          PALIND := True;
        End;
    End;
End;
// --------------------------------------------------------------------------
// - Retourne une sous chaine de N caracteres a partir de la position p d'une chaine -
Function Copyy(ph:String;p,n:Integer): String;
Var
  i,j: Integer;
  z: Integer;
  cp: String;
Begin
  cp := '';
  z := Length(ph)+n-p;
  For i:=p To z - 1 Do
    Begin
      cp := cp+ph[i];
    End;
  Copyy:= cp;
End;
// --------------------------------------------------------------------------
// -------------------- Concatinating two strings ---------------------------
Function Concat(ph1,ph2:String): String;
Var
  i,j: Integer;
  phC: String;
Begin
  phC := '';
  For i:=1 To Length(ph1) Do
    phC := phC + ph1[i];
  For j:=1 To Length(ph2) Do
    phC := phC + ph2[j];
  Concat := phC;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure convert(ph:String;var T:table;var tai:tind);
Var
  i: Integer;
Begin
  For i := 1 To Length(ph) Do
    Begin
      T[i] := ph[i];
    End;
		tai := Length(ph);
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure writet(T:table;tai:tind);
Var
  i: Integer;
Begin
  For i := 1 To tai  Do
    Begin
   write(T[i]);
    End;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
end.