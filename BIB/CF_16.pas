Program tarek;
Uses Wincrt,BIB02,BIB01;
Var
  N: Integer;
  i,j,k: Integer;
  T: tab2D;
  TL,TC: tind;
  L,c,ct: Integer;
Function carre_magique(T:tab2D;TL,TC:tind): Boolean;
Begin
  carre_magique := False;
  If (T[1,1]+T[1,2]+T[1,3]=T[2,1]+T[2,2]+T[2,3]) And (T[1,1]+T[1,2]+T[1,3]=T[3,1]+T[3,2]+T[3,3]) And
     (T[1,1]+T[1,2]+T[1,3]=T[1,1]+T[2,2]+T[3,3]) And (T[1,1]+T[1,2]+T[1,3]=T[3,1]+T[2,2]+T[1,3]) And
     (T[1,1]+T[1,2]+T[1,3]=T[1,1]+T[2,1]+T[3,1]) And (T[1,1]+T[1,2]+T[1,3]=T[1,2]+T[2,2]+T[3,2]) And
     (T[1,1]+T[1,2]+T[1,3]=T[1,3]+T[2,3]+T[3,3])
    Then
    carre_magique := True;
End;
Function Concat(A,B:Integer): Integer;
Var
  p,C: Integer;
Begin
  p := power(10,Pos(B));
  C := A*p+B;
  Concat := C;
End;
Function ch_diff(N:Integer): Boolean;
Var
  saveN,d: Integer;
Begin
  ch_diff := True;
  saveN := N;
  Repeat
    d := N Mod 10;
    If (freq(saveN,d) <> 1) Or (freq(saveN,0) <> 0) Then
      ch_diff := False;
    N := N Div 10;
  Until N = 0;
End;
Begin
  TL := 3;
  TC := 3;
  For i:=111 To 999 Do
    Begin
      For j:=111 To 999 Do
        Begin
          For k:=111 To 999 Do
            Begin
              N := Concat(Concat(i,j),k);
              If (ch_diff(N)) Then
                Begin
                  For l:= 1 To 3 Do
                    Begin
                      For c:= 1 To 3 Do
                        Begin
                          T[l,c] := N Mod 10;
                          N := N Div 10;
                        End;
                    End;
                  If carre_magique(T,TL,TC) Then
                    Begin
										write('y');
                      write2D(T,TL,TC);
                      ct := ct+0;
                    End;
                End;
            End;
        End;
    End;
End.
