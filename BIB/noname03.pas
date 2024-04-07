Program TP;
Uses Wincrt,BIB02;
Var
  T: tab2D;
  TL,TC: tind;
  i,j,max,min: Integer;
Begin
  read2D(T,TL,TC);
  write2D(T,TL,TC);
  pointdeselle(T,TL,TC);
End.
