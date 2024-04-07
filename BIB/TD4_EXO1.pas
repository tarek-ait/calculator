Program katia;
// recherche le nombre des suite d'ordre croissant d'un tableau a une demenssion
Uses Wincrt,BIB02;
Var
  T: tab1D;
  tai: tind;
  i,c,Un,j,se: Integer;
  sec: Boolean;
Begin
  c:=0;
  read1D(T,tai);
  Writeln;
  write1D(T,tai);
  Writeln;
  se := 0;
  For i:=1 To tai-1 Do
    Begin
      If T[i] <= T[i+1] Then
        Begin
          c := c+1;
        End
      Else
        Begin
          If c>=1 Then
            Begin
              se := se+1;
              c := 0;
            End;
        End;
				 if (i = tai -1 ) and (c >= 1) then
				 begin
				 se := se +1;
				 end;
    End;
  Writeln;
  Writeln;
  Writeln('le nombre des suites d''ordre croissant dans le tableau T est : ',se);
End.
