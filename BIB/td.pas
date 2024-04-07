Program gangof9;
Uses Wincrt,BIB01;
Var
  A,B,C,Z,d,df,X: integer;
  check: Boolean;
Begin
  For A:= 123 To 987 Do
    Begin
      For B:=123 To 987 Do
        Begin
          C := A+B;
          If Pos(C)= 3 Then
            Begin
              Z := Concat(Concat(A,B),C);
                   check:=True;
									 x:=1;
              While (x < 10) And (check) Do
                Begin
                  If freq(Z,x) <> 1 Then
                    check := False;
                  x := x+1;
                End;
								 if check then
								 writeln(A,' + ', B,' = ',C);
            End;
        End;
    End;
End.