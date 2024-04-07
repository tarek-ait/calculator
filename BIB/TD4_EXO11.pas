Program tarek;

// str to convert an integer to a string         // first lodule to convert the string to one demensonel table of strings     // module to display the tale    //the module to compress the table
Uses Wincrt,BIB02;
Type
  tab = Array[tind] Of String;
Var
  T,k: tab;
  ph: String;
  tait,taik: tind;
  ct,i,S,j: Integer;
  cts: String;
Procedure rempT(ph:String; Var T:tab; Var tai:tind);
Var
  i: Integer;
Begin
  For i:=1 To Length(ph) Do
    Begin
      T[i] := ph[i];
    End;
  tai := i;
End;
Procedure dispT(T:tab;tai:tind);
Var
  i: Integer;
Begin
  For i := 1 To tait Do
    Begin
      Write(T[i]);
    End;
End;
Begin
  Write('ph : ');
  Readln(ph);
  rempT(ph,T,tait);
  Writeln;
  ct := 1;
  j := 1;
	write('S : ');
	readln(S);
  For i:=1 To tait Do
    Begin
      If T[i] =T[i+1] Then
        ct := ct+1
      Else
        Begin
          If ct >= S Then
            Begin
              Str(ct,cts);
              K[j] := '[' + cts + ']'+ T[i];
              ct := 1;
              j := j+1;
            End
          Else
            Begin
              K[j] := T[i];
              j := j+1;
            End;
        End;
	  	End;
		taik:=j;
  dispT(k,taik);
End.
