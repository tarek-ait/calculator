Program katia ;
Uses Wincrt;
Var
  ph,sc,wordd,c: String;
  lsc,i,ct,lph,k: Integer;
Procedure rm1char(Var ph:String);
Var
  i,j: Integer;
  ck: String;
Begin
  j := 1;
  For i := 2 To Length(ph) Do
    Begin
      ck := ck+ ph[i];
    End;
  ph := ck;
End;
Begin
  ct := 0;
  Readln(ph);
  Readln(sc);
  lph := Length(ph);
  lsc := Length(sc);
  i := 1;
  While k < lph Do
    Begin
      c := c + ph[i];
      If (c = sc)Then
        Begin
          ct := ct + 1;
          c := '';
          i := 1;
        End
      Else
        If (Length(c) = lsc) And (sc <> c) Then
          Begin
            rm1char(c);
            Writeln(c);
          End
      Else
        i := i+1;
      k := k+1;
    End;
		if ct > 2 then
		ct := ct -1;
  Writeln(ct);
End.

// TD version 
//Program tarek;
//Uses Wincrt;
//Var
//  ph,sc,wordd,c: String;
//  lsc,i,j,ct,lph,k: Integer;
//Begin
//  ct := 0;
//  Readln(ph);
//  Readln(sc);
//  lph := Length(ph);
//  lsc := Length(sc);
//  i := 1 ;
//  ct := 0;
//  While i <= lph Do
//    Begin
//      j := 1;
//     while  (j<=lsc ) And (ph[i] = sc[j]) do
//        Begin
//          i := 1+i;
//          j := 1+j;
//        End;
//      If j -1 = lsc Then
//        ct := ct + 1
//      Else
//        i := i + 1;
//    End;
//  Writeln(ct);
//End.
//