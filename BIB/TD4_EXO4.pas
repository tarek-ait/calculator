program ktaie ;
uses wincrt,BIB02;
var T:tab1D;
tai:tind;
Procedure tri_compt(T : tab1D ;tai:tind);
Var
  TT: tab1D;
  j : Integer;
  TC : tab1D;
Function comptinf(T:tab1D; tai:tind ;CN:Integer): Integer;
Var
  ct,i: Integer;
Begin
  ct := 0;
  For i := 1 To tai Do
    Begin
      If CN > T[i] Then
        ct := ct +1;
    End;
  comptinf := ct;
End;
Procedure const_TC(T : tab1D;tai:tind; Var TC : tab1D);
Var
  i : Integer;
Begin
  For i := 1 To tai Do
    Begin
      TC[i] := comptinf(t,tai,T[i] );
    End;
End;
Procedure corrige_TC(T : tab1D;tai : tind; Var TC : tab1D);
Var
  m,l : Integer;
Begin
  For m:= 1 To tai Do
    Begin
      For l:=1 To tai Do
        Begin
          If (TC[m] = TC[l]) And (m<>l) Then TC[l] := TC[l] + 1;
        End;
    End;
End;
Begin
  const_TC(t,tai,TC);
  Writeln;
  Writeln('');
  Writeln('voici la table de comptage avant correction');
  Writeln;
  write1d(tc,tai);
  corrige_TC(t,tai,TC);
  Writeln;
  Writeln('');
  Writeln('voici la table de comptage apres la correction ');
  Writeln;
  write1d(tc,tai);
  For j:=1 To tai Do
    Begin
      TT[TC[j]+1] := T[j] ;
    End;
  Writeln;
  Writeln('');
  Writeln('le nouveau tableau :');
  Writeln;
  write1d(TT,tai);
End;
begin
read1D(T,tai);
tri_compt(T,tai);
end.
