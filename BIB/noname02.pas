Program tarek;
Uses Wincrt,BIB02;
Type
bday = record
  day :integer;
	month:integer;
	year:integer;
end;
  etudiant = Record
    nom : String;
    prenom : String;
    matricule : String;
		birht:bday;
  End;
  table = Array[tind] Of etudiant;
Var
  E: etudiant;
  T: table;
  N,i: Integer;
Begin
  Write('give the numbers of students : ');
  Readln(N);
  With E Do
    Begin
      For i:=1 To N Do
        Begin
          Write('nom : ');
          Readln(T[i].nom);
          Write('prenom  : ');
          Readln(T[i].prenom);
          Write('matricule  : ');
          Readln(T[i].matricule);
				  with birht do
					begin
					Write('day  : ');
          Readln(T[i].day);
          Write('month : ');
          Readln(T[i].month);
          Write('matricule  : ');
          Readln(T[i].year);
					end;
					writeln;
        End;
    End;
  With E Do
    Begin
      For i:=1 To N Do
        Begin
          Writeln('nom : ',T[i].nom);
          Writeln('prenom :',T[i].prenom);
          Writeln('matricule  : ',T[i].matricule);
					writeln;
        End;
    End;
End.
