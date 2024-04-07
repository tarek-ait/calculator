Program nombre_dapparition;
Uses Wincrt;
Var
  N,d,saveN,i,NA,cn,dn: Integer;
Begin
  Readln(N);
  saveN := N;
    For i := 0 To 9 Do
      Begin
        NA := 0;
        Repeat
				d:= saveN mod 10;
          If d = i Then
            NA := NA+1;
          If NA <> 0 Then
            Begin
              N := NA*10+i;
              Writeln(N);
            End;
          saveN := saveN Div 10;
        Until saveN = 0;
      End;
  End.
