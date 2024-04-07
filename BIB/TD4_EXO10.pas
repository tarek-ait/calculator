 Program tarek;
Uses Wincrt,BIB02;

Procedure exo10;
Var
  ph,mot: String;
  i,j: Integer;
  car: Char;
  ct,n: Integer;
  wordd: Boolean;
Begin
  Write('donner une phrase : ');
  Readln(ph);
	write('n : ');
	readln(n);
  Write('donner un caractere a chercher : ');
  Readln(car);
  Writeln;
  Writeln('----------------------------------');
  For i :=1 To Length(ph) Do
    Begin
      If ph[i] <> ' ' Then
        Begin
          mot := mot+ph[i];
        End;
				 
      If (i = Length(ph)) Or (ph[i] = ' ') Then
        Begin
          ct := 0;
//          wordd := False;
          For j := 1 To Length(mot) Do
            Begin
              If (Upcase(mot[j]) = Upcase(car)) And (mot[j] <> ' ') Then
							begin
                ct := ct + 1;
							if ct = n then
							 Writeln('the character ''',car,''' appears in the word ''',mot,''' ',ct,' times');
            End;
						end;
//          If wordd Then
//            Writeln('the character ''',car,''' appears in the word ''',mot,''' ',ct,' times');
						mot := '';
        End;
    End;
end;
Begin
  exo10;
End.
