Program tarek;
Uses Wincrt,BIB02,BIB01;
var message:string;
Function compress(Mes_org : string ;seuil: integer) : string;
  Var
    taille,i,j,d,k: Integer;
    cc: Char;
    s,resultat: String;
  Begin
    i := 1;
    resultat := '';
    taille := Length(Mes_org );
    While i<=taille Do
      Begin
        cc:=Mes_org [i];
        if  (cc='[') then 
        Begin
          resultat := resultat+'[[';
          i := i+1;
        End
        Else
          Begin
            j := i+1;
            While (j<=taille) and  (Mes_org [j]=cc) Do
              j := j+1;
            d := j-i;
            if d>= Seuil
                    then
                    Begin
                      s := '';
                      while d<>0
                      Do
                      Begin
                        s := Chr((d Mod 10)+48)+s;
                        d := (d Div 10);
                      End;;
                      resultat := resultat+'['+s+']'+cc;
                      i := j;
                    End
            Else
              Begin
              while (i<j)do
							begin
                resultat := resultat+cc;
                i := i+1;
              End;
          End;
      End;
  End;
  compress := resultat;
End;
begin
Write('message : ');
  Readln(message);
	writeln(compress(message,2));
	
End.