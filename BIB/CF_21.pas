Program tarek;
Uses Wincrt,BIB01,BIB02;
Procedure searchalphabet(mot:String;Var T:tab1D;Var tai:tind);
Type
  table = Array[tind] Of Char;
Var
  A: table;
  car: Char;
  i,k,j: Integer;
Begin
  k := 0;

A[1]:='A'; A[2]:='B';A[3]:='C';A[4]:='D';A[5]:='E';A[6]:='F';A[7]:='G';A[8]:='H';A[9]:='I';A[10]:='J';A[11]:='K';A[12]:='L';  A[13]:='M';
A[14]:='N';A[15]:='O';A[16]:='P';A[17]:='Q';A[18]:='R';A[19]:='S';A[20]:='T';A[21]:='U';A[22]:='V';A[23]:='W';A[24]:='X';A[25]:='W'; A[26]:='Z';
  For i:= 1 To Length(mot) Do
    Begin
      car := Upcase(mot[i]);
      For j := 1 To 26 Do
        Begin
          If car = A[j] Then
            Begin
              k := k+1;
              T[k] := j;
            End;
        End;
    End;
  tai := k;
End;
Procedure reversesearch(V:tab1D;taiV:tind;Var mcode:String);
Type
  table = Array[tind] Of Char;
Var
  i,j: Integer;
  A: table;
Begin
mcode:='';
A[1]:='A'; A[2]:='B';A[3]:='C';A[4]:='D';A[5]:='E';A[6]:='F';A[7]:='G';A[8]:='H';A[9]:='I';A[10]:='J';A[11]:='K';A[12]:='L';  A[13]:='M';
A[14]:='N';A[15]:='O';A[16]:='P';A[17]:='Q';A[18]:='R';A[19]:='S';A[20]:='T';A[21]:='U';A[22]:='V';A[23]:='W';A[24]:='X';A[25]:='W'; A[26]:='Z';
  For i := 1 To taiv Do
    Begin
      For j:=1 To 26 Do
        Begin
          If V[i]=j Then
            mcode := mcode+A[j];
        End;
    End;
End;
Procedure crypt;
Var
  a,b,ta,i,k: Integer;
  T,V: tab1D;
  tai,taiv: tind;
	msgcode,mot:string;
Begin
  Write('Donner la taille de votre alphabet : ');
  Readln(Ta);
  Writeln;
  Repeat
    Write('Donner votre parametre a : ');
    Readln(a);
    Writeln;
    If Not(premier(a,Ta)) Then
      Writeln(a,' et ',ta,' non premiers entre eux!');
  Until premier(a,Ta);
  Writeln;
  Write('paramatre correct | donnez maintenant votre paramatre b : ');
  Readln(b);
  Writeln;
  Writeln('votre equation affine est : ',a,'x + ',b);
	WRITELN;
  Write('donner votre message : ');
  Readln(mot);
	writeln;
  searchalphabet(mot,T,tai);
	writeln('le rang de ces caracteres : ');
	writeln;
  write1D(T,tai);
  Writeln;
  For i := 1 To tai Do
    Begin
      V[I] := (a*T[i]+ b ) Mod Ta;
    End;
  taiV := tai;
  Writeln;
	reversesearch(V,taiV,msgcode);
	writeln;
	writeln;
	writeln('message code : ',msgcode);
	writeln;
	writeln('le rang de ces caracteres : ');
	writeln;
	write1D(V,taiv);
End;
Begin
  crypt;
End.
