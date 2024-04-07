Program TD4_EXO6;
Uses Wincrt,BIB02;
Var
  T: tab2D;
  TL,TC: tind;
  i,j,max,min,N: Integer;
	k,p:integer;
Begin
textcolor(white);
//	T[1,1] :=  30;  T[1,2] := 1 ; 	T[1,3] := 38 ; 	T[1,4] := 24 ; 	T[1,5] :=  5;
//	T[2,1] := 1 ; 	T[2,2] := 5 ; 	T[2,3] := 36 ; 	T[2,4] := 2 ; 	T[2,5] := 3 ;
//	T[3,1] := 15 ; 	T[3,2] := 18 ; 	T[3,3] := 32 ; 	T[3,4] := 28 ; 	T[3,5] := 9 ;
//	T[4,1] := 38; 	T[4,2] := 4 ;  	T[4,3] := 37 ; 	T[4,4] := 3 ; 	T[4,5] := 16 ;
//	T[5,1] := 4 ; 	T[5,2] :=  7; 	T[5,3] := 51 ; 	T[5,4] := 8 ; 	T[5,5] := 12 ;
aleat2D(T,TL,TC);
	writeln;
	writeln;
  TL := 5;
  TC := 5;
  write2D(T,TL,TC);
	writeln;
	writeln;
  pointdeselle(T,TL,TC,N,k,p);
	writeln;
	writeln;
  For i:=1 To TL Do
    Begin
      For j:=1 To TC Do
        Begin
          textcolor(black);
          If (k=i) and (p=j) Then
            Begin
              textcolor(red+blink);
              Write('        ',T[i,j]:3,'|');
            End
          Else
            Begin
              textcolor(white);
              Write('        ',T[i,j]:3,'|');
            End;
        End;
					 Writeln;
    End;
End.