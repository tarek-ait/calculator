Program matrice_transposee;
Uses Wincrt,BIB02;
Var
  T: tab2D;
TL,TC:tind;
	begin
	aleat2D(T,TL,TC);
	write2D(T,TL,TC);
	writeln;
	writeln;
	transpo(T,TL,TC);
End.

