 Program tarek;
// atelier 3
Uses wincrt,BIB01,BIB02;
Var
  A: tab2D;
  V,C: tab1D;
  TL,TC,tai,taic: tind;
  i,j: Integer;
Begin
  A[1,1] := 0;A[1,2] := 0;A[1,3] := 1;A[1,4] := 0;A[1,5] := 0;
  A[2,1] := 0;A[2,2] := 1;A[2,3] := 0;A[2,4] := 1;A[2,5] := 0;
  A[3,1] := 1;A[3,2] := 0;A[3,3] := 0;A[3,4] := 0;A[3,5] := 1;
  A[4,1] := 1;A[4,2] := 1;A[4,3] := 1;A[4,4] := 1;A[4,5] := 1;
  A[5,1] := 1;A[5,2] := 0;A[5,3] := 0;A[5,4] := 0;A[5,5] := 1;
  A[6,1] := 1;A[6,2] := 0;A[6,3] := 0;A[6,4] := 0;A[6,5] := 1;
  A[7,1] := 1;A[7,2] := 0;A[7,3] := 0;A[7,4] := 0;A[7,5] := 1;
  TL:=7;
  TC:=5;
  // reading and writing the two demensions table
  Writeln('the matrix A : ');
  write2D(A,TL,TC);
  Writeln;
  Writeln('-----------------------------------------------------------------');
  Writeln;
  // converting to one demension
  Writeln('Compressing : ');
  Writeln('--------------');
  Writeln;
  Writeln('1.Converting to V , one demension table : ');
  Writeln;
  convert2Dto1D(A,TL,TC,V,tai);
  write1D(V,tai);
  Writeln;
  // compressing
  Writeln;
  Writeln('2.Compressing the table V to another table of one demension C : ');
  Writeln;
  compres(V,tai,C,taic);
  write1D(C,taic);
  Writeln;
  Writeln;
  Writeln('-----------------------------------------------------------------');
  Writeln;
  // decompress
  Writeln('Decompressing : ');
  Writeln('--------------');
  Writeln;
  Writeln('1.decompress C to V : ');
  Writeln;
  decompres(C,taic,V,tai);
  write1D(V,tai);
  Writeln;
  // convertiong from one demension to two demension table
  Writeln;
  Writeln('2.Reconvert the one demension table V to the matrix A : ');
  Writeln;
  convert1Dto2D(V,tai,A,TL,TC);
  write2D(A,TL,TC);
	writeln;
	writeln;
	writeln;
  For i :=1 To TL Do
    Begin
      For j:=1 To TC Do
        Begin
          If A[i,j] = 1 Then                     
            Begin
              textcolor(lightred);
              Write(A[i,j],' ');
            End;
          If A[i,j] = 0 Then
            Begin
              textcolor(white);
              Write(A[i,j],' ');
            End;
        End;
      Writeln;
    End;
  Writeln;
  Writeln('-----------------------------------------------------------------');
	readln;
End.