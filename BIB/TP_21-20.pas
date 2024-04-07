Program TP;
Uses crt,BIB02;
Var
  i,j: Integer;
  T,T4,T5,T6: TAB2D;
  TC,TL,q,k: tind;
  a: Boolean;
	s:string;
Begin
  a := True;
  ALEAT2D(T,TL,TC);
  Writeln;
  Writeln;
  write2D(T,TL,TC);
  K := 1;
  q := 1;
  For i := 1 To TL Do
    Begin
      For j:=1 To TC Do
        Begin
          If (freqlig(T,TC,i,T[i,j]) > 1 ) Or (freqcol(T,TL,j,T[i,j]) > 1 ) Or (freqrec(T,region(T,i
             ),region(T,j),region(T,i)+2,region(T,j)+2,T[i,j]) > 1) Then
            Begin
              a := False ;
              t4[q, k] := t [i, j];
              t5[q, k] := i;
              t6[q, k] := j;
              q := q+1;
              textcolor(lightred + blink);
							writeln;
              Write(t[i,j]) ;
              textcolor(white);
              Write('|');
            End
          Else Write(t [i, j],'|');
        End;
      Writeln;
      Writeln(' ');
    End;
  If a = False Then
    Begin
      Writeln('votre suduko is wrong');
      Write('les cases erronées sont : ') ;
      write2D(t4, q-1, k);
      Write(' les lignes erronées sont : ');
      write2D (t5, q-1, k);
      Write('les colonnes erronées sont : ');
      write2D(t6, q-1, k);
    End
  Else
    Writeln('votre suduko is correct');
		  repeat
    readln(s);
    writeln(s);
  until s='';
End.