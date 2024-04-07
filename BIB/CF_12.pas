Program katia ;
Uses Wincrt,BIB02,BIB01;
Type
  dipose = Record
    Ta : tab1D;
    R : tab2D;
		TL:tind;
		TC:tind;
		Tai:tind;
  End;
  TABLE = Array[tind] Of dipose;
Var
  i,N: Integer;
  T: TABLE;
  tai,TL,TC: tind;
  T2: tab2D;
	V:tab1D;
  D: dipose;
Begin
  Write('donner le nombre des tableau : ');
	readln(N);
  With D Do
    Begin
		for  i:=1 to N do
		begin
		  writeln;
      Writeln('please fill your table N',i,' : ');
			writeln('-------------------------------');
      Read1D(T[i].Ta,T[i].tai);
			partieA(T[i].Ta,T[i].tai,T[i].R,T[i].TL,T[i].TC);
		end;
    End;
  With D Do
	begin
	for i:=1 to N do
    Begin
		 writeln;
		  writeln('table N',i,' :');
			writeln('-------------');
			writeln;
      Writeln('your table is : ');
			writeln;
      write1D(T[i].Ta,T[i].tai);
      Writeln;
			writeln;
      Writeln('the table result is : ');
	    writeln;
      write2D(T[i].R,T[i].TL,T[i].TC);
    End;
		end;
End.