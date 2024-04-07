Program tarek;
// CF15                   // dechiff
Uses Wincrt,crt,BIB02;
var message,cle,chiffre:string;
procedure dechiffrement(var message:string;var cle,chiffre:string);
type table = Array[1..26] Of String[26];
Var
  V: table;
	car1,car2:char;
	mot,alphabet:string;
	savel,k,i,j:integer;
Begin
  V[1] := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  V[2] := 'BCDEFGHIJKLMNOPQRSTUVWXYZA';
  V[3] := 'CDEFGHIJKLMNOPQRSTUVWXYZAB';
  V[4] := 'DEFGHIJKLMNOPQRSTUVWXYZABC';
  V[5] := 'EFGHIJKLMNOPQRSTUVWXYZABCD';
  V[6] := 'FGHIJKLMNOPQRSTUVWXYZABCDE';
  V[7] := 'GHIJKLMNOPQRSTUVWXYZABCDEF';
  V[8] := 'HIJKLMNOPQRSTUVWXYZABCDEFG';
  V[9] := 'IJKLMNOPQRSTUVWXYZABCDEFGH';
  V[10] := 'JKLMNOPQRSTUVWXYZABCDEFGHI';
  V[11] := 'KLMNOPQRSTUVWXYZABCDEFGHIJ';
  V[12] := 'LMNOPQRSTUVWXYZABSDEFGHIJK';
  V[13] := 'MNOPQRSTUVWXYZABCDEFGHIJKL';
  V[14] := 'NOPQRSTUVWXYZABCDEFGHIJKLM';
  V[15] := 'OPQRSTUVWXYZABCDEFGHIJKLMN';
  V[16] := 'PQRSTUVWXYZABCDEFGHIJKLMNO';
  V[17] := 'QRSTUVWXYZABCDEFGHIJKLMNOP';
  V[18] := 'RSTUVWXYZABCDEFGHIJKLMNOPQ';
  V[19] := 'STUVWXYZABCDEFGHIJKLMNOPQR';
  V[20] := 'TUVWXYZABCDEFGHIJKLMNOPQRS';
  V[21] := 'UVWXYZABCDEFGHIJKLMNOPQRT';
  V[22] := 'VWXYZABCDEFGHIJKLMNOPQRSTU';
  V[23] := 'WXYZABCDEFGHIJKLMNOPQRSTUV';
  V[24] := 'XYZABCDEFGHIJKLMNOPQRSTUVW';
  V[25] := 'YZABCDEFGHIJKLMNOPQRSTUVWX';
  V[26] := 'ZABCDEFGHIJKLMNOPQRSTUVWXY';
  alphabet := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	k:=0;
	mot:='';
	writeln(V[3,5]);
  Repeat
	  k:=k+1;
    car1 := cle[k];
    car2 := chiffre[k];
		if car2 = ' ' then 
		 mot := mot+' '; 
    For i:=1 To 26 Do
      Begin
        If car1=alphabet[i] Then savel := i;
      End;
    For i := 1 To 26 Do
      Begin
        If savel=i Then
          Begin
            For j:=1 To 26 Do
              Begin
                If V[savel,j] = car2 Then mot := mot+alphabet[j];
              End;
          End;
      End;
  Until k > Length(cle);
	WriteLn;
	writeln;
	writeln('le message en  claire est : ',mot);
	end;
	Procedure chiffrement(Var message,cle,chiifre:String);
Type
  table = Array[1..26] Of String[26];
Var
  i,j: Integer;
  d: Char;
Procedure cle_generate(message:String;Var cle:String);
Var
  i: Integer;
  d: Char;
Begin
  Repeat
    i := i+1;
    If i>Length(cle) Then i := 1;
    d := cle[i];
    cle := Concat(cle,d);
  Until Length(cle) = Length(message);
  Write('la cle est : ',cle);
End;
Procedure code(message,cle:String;Var msgchif:String);
Var
  alphabet: String;
  savec,savel,k,i: Integer;
  V: table;
Begin
  V[1] := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  V[2] := 'BCDEFGHIJKLMNOPQRSTUVWXYZA';
  V[3] := 'CDEFGHIJKLMNOPQRSTUVWXYZAB';
  V[4] := 'DEFGHIJKLMNOPQRSTUVWXYZABC';
  V[5] := 'EFGHIJKLMNOPQRSTUVWXYZABCD';
  V[6] := 'FGHIJKLMNOPQRSTUVWXYZABCDE';
  V[7] := 'GHIJKLMNOPQRSTUVWXYZABCDEF';
  V[8] := 'HIJKLMNOPQRSTUVWXYZABCDEFG';
  V[9] := 'IJKLMNOPQRSTUVWXYZABCDEFGH';
  V[10] := 'JKLMNOPQRSTUVWXYZABCDEFGHI';
  V[11] := 'KLMNOPQRSTUVWXYZABCDEFGHIJ';
  V[12] := 'LMNOPQRSTUVWXYZABSDEFGHIJK';
  V[13] := 'MNOPQRSTUVWXYZABCDEFGHIJKL';
  V[14] := 'NOPQRSTUVWXYZABCDEFGHIJKLM';
  V[15] := 'OPQRSTUVWXYZABCDEFGHIJKLMN';
  V[16] := 'PQRSTUVWXYZABCDEFGHIJKLMNO';
  V[17] := 'QRSTUVWXYZABCDEFGHIJKLMNOP';
  V[18] := 'RSTUVWXYZABCDEFGHIJKLMNOPQ';
  V[19] := 'STUVWXYZABCDEFGHIJKLMNOPQR';
  V[20] := 'TUVWXYZABCDEFGHIJKLMNOPQRS';
  V[21] := 'UVWXYZABCDEFGHIJKLMNOPQRT';
  V[22] := 'VWXYZABCDEFGHIJKLMNOPQRSTU';
  V[23] := 'WXYZABCDEFGHIJKLMNOPQRSTUV';
  V[24] := 'XYZABCDEFGHIJKLMNOPQRSTUVW';
  V[25] := 'YZABCDEFGHIJKLMNOPQRSTUVWX';
  V[26] := 'ZABCDEFGHIJKLMNOPQRSTUVWXY';
  alphabet := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  k := 0;
  While k < Length(cle) Do
    Begin
      k := k+1;
      For i:= 1 To Length(alphabet) Do
        Begin
          If cle[k] = alphabet[i] Then savel := i;
        End;
      For i:= 1 To Length(alphabet) Do
        Begin
          If message[k] = alphabet[i] Then savec := i;
        End;
      If message[k] = ' ' Then
        msgchif := msgchif+' '
      Else
        msgchif := msgchif+V[savel,savec];
    End;
End;
Begin
  Write('message : ');
  Readln(message);
  Writeln;
  Write('mot : ');
  Read(cle);
  Writeln;
  cle_generate(message,cle);
  Writeln;
  code(message,cle,chiifre);
  Writeln;
  Writeln('cryptogramme : ',chiifre);
End;
	begin
	chiffrement(message,cle,chiffre);
	dechiffrement(message,cle,chiffre);
End.