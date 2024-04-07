Program TP2;
Uses crt, Sysutils,BIB01;
Const
  max = 15;
Type
  tind = 1..max;
  Tab = Array [tind] Of String;
  EmitFile = Record
    FileNum: String;
    NameAdmin : String;
    SigneAdmin : String;
    CityAdmin : String;
    PhoneAdmin : String;
    SentDate : String;
    Profile : Tab;
    tai: tind;
    R: Integer;
  End;
  RecTab = Array [Tind] Of EmitFile;
Var
  O: EmitFile;
  T: Rectab;
  i: Integer;
Procedure FillProfile(Var T:Tab;Var tai:tind);
Var
  k: Integer;
Begin
  k := 0;
  Repeat
    k := k+1;
    Readln(T[k]);
  Until (T[k]='fin') Or (k>=max);
  tai := k;
End;
Procedure fillAdminEmet(Var O:Emitfile;Var T:Rectab);
Var
  N: Integer;
  i: Integer;
  FN: Integer;
Begin
  Write('enter the numbers of employees : ');
  Readln(N);
  For i:=1 To N Do
    Begin
      With o Do
        Begin
          Repeat
            Write('File Number : ');
            Readln(FN);
          Until (FN<=10) And (FN>=0);
          Str(FN,T[i].FileNum);
          Repeat
            Write('Name. Admin : ');
            Readln(T[i].NameAdmin);
          Until Length(T[i].NameAdmin) <=40;
          Repeat
            Write('Signe. Admin : ');
            Readln(T[i].SigneAdmin);
          Until Length(T[i].signeAdmin) <=5;
          Repeat
            Write('City. Admin : ');
            Readln(T[i].CityAdmin);
          Until Length(T[i].CityAdmin)<=15;
          Repeat
            Write('Phone. Admin : ');
            Readln(T[i].PhoneAdmin );
          Until Length(T[i].PhoneAdmin ) <=10;
          Write('Sent. Date (YYYY-MM-DD format) : ');
          Readln(T[i].SentDate);
          Write('Text : ');
          Writeln;
          Fillprofile(T[i].Profile,T[i].tai);
        End;
    End;
End;

Procedure displaytext(T:tab; tai :tind);
Var
  i: Integer;
Begin
  For i:=1 To tai Do
    Begin
      Writeln(T[i]);
    End;
End;
Procedure displayAdminEmet(Var O:Emitfile; T:Rectab);
Var
  N: Integer;
  i: Integer;
Begin
  Write('enter the numbers of employees : ');
  Readln(N);
  For i:=1 To N Do
    Begin
      With o Do
        Begin
          Writeln('File Number : ',T[i].FileNum);
          Writeln('Name. Admin ',T[i].NameAdmin);
          Writeln('Signe. Admin : ',T[i].SigneAdmin);
          Writeln('City. Admin : ',T[i].CityAdmin);
          Writeln('Phone. Admin ',T[i].PhoneAdmin);
          Writeln('Sent. Date (YYYY-MM-DD format) : ',T[i].SentDate);
          Writeln('Text : ');
          Writeln;
          displaytext(T[i].Profile,T[i].tai);
        End;
    End;
End;
Procedure crypt(Var ph:String; R:Integer);
Var
  min,max,ch,k,i: Integer;
  d,c: Char;
  saveph,ph2: String;
Begin
  saveph := ph;
  ph := '';
	ph2:='';
  k := 0;
  Repeat
    k := k+1;
    d := saveph[k];
    ch := Ord(d)+R;
    c := Chr(ch);
    ph2 := ph2+c;
  Until k=Length(saveph);
  ph := ph2;
End;
Procedure cryptAdminEmet(Var O:Emitfile;Var T:Rectab);
Var
  N,i,j: Integer;
  max,min: Integer;
  Rf: Integer;
  ph: String;
Begin
  Randomize;
  Write('max : ');
  Readln(max);
  Write('min : ');
  Readln(min);
  Repeat
    Rf := min + Random((max-min)+1);
  Until premier(Rf);
  Write('enter the numbers of employees : ');
  Readln(N);
  For i:=1 To N Do
    Begin
      With o Do
        Begin
          T[i].R := Rf;
          crypt(T[i].FileNum,T[i].R);
          crypt(T[i].NameAdmin,T[i].R);
          crypt(T[i].SigneAdmin,T[i].R);
          crypt(T[i].CityAdmin,T[i].R);
          crypt(T[i].PhoneAdmin,T[i].R);
          crypt(T[i].SentDate,T[i].R);
          For j:=1 To T[i].tai Do
            Begin
              crypt(T[i].Profile[j],T[i].R);
            End;
        End;
    End;
End;

Procedure Decrypt(var ph:string;var R:integer);
Var  ch,k,i: Integer;
  d,c: Char;
	ph2,saveph:string;
Begin
	ph2:='';
	saveph:=ph;
	ph:='';
	k := 0;
	Repeat
		k:=k+1;
		d:= saveph[k];
		ch := ord(d)-R;
		c := Chr(ch);
		ph2:= ph2+c;
	until k=Length(saveph);
ph:=ph2;
end;
	
Procedure decryptAdminEmet(Var O:Emitfile;Var T:Rectab);
Var
  N,i,j: Integer;
  max,min: Integer;
  Rf: Integer;
  ph: String;
Begin
  Write('enter the numbers of employees : ');
  Readln(N);
  For i:=1 To N Do
    Begin
      With o Do
        Begin
          decrypt(T[i].FileNum,T[i].R);
          decrypt(T[i].NameAdmin,T[i].R);
          decrypt(T[i].SigneAdmin,T[i].R);
          decrypt(T[i].CityAdmin,T[i].R);
          decrypt(T[i].PhoneAdmin,T[i].R);
          decrypt(T[i].SentDate,T[i].R);
          For j:=1 To T[i].tai Do
            Begin
              decrypt(T[i].Profile[j],T[i].R);
            End;
        End;
    End;
End;
Begin
//  i := 1;
//  With o Do
//    Begin
//      Write('File Number : ');
//      Str(8,T[i].FileNum);
//      T[i].NameAdmin := 'Caisse Nationale Assurance Socials';
//      T[i].SigneAdmin := 'CNAS';
//      T[i].CityAdmin := 'Alger';
//      T[i].PhoneAdmin := '044556677';
//      T[i].SentDate := '2023-01-23';
//      Write('Text : ');
//      Writeln;
//      Fillprofile(T[i].Profile,T[i].tai);
//    End;
fillAdminEmet(O,T);
writeln;
  displayAdminEmet(O,T);
  Writeln;
  cryptAdminEmet(O,T);
  Writeln;
  displayAdminEmet(O,T);
	writeln;
	decryptAdminEmet(O,T);
	writeln;
	displayAdminEmet(O,T);
End.
