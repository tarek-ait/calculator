Program table_of_one_demenssion;
Uses Wincrt,BIB02;
Var
  T: TAB1D;
  tai: tind;
  V: Integer;
  Ch: Integer;
Begin
Repeat
clrscr;
  Writeln('----------------------Menu Tabmeaux 1D -----------------------');
  Writeln;
  Writeln('1 : Lecture d''un vecteure (Tableau 1D)');
  Writeln('2 : Ecriture d''un vecteure (Tableau 1D)');
  Writeln('3 : Remplir randomly un vecteur (Tableau 1D)');
  Writeln('4 : Minimum d''un vecteur (Tableau 1D)');
  Writeln('5 : Maximum d''un vecteur (Tableau 1D)');
  Writeln('6 : Nb Eleme. d''un vecteur (Tableau 1D)');
  Writeln('7 : Quitter');
  Writeln;
  Write('Choix : ');
  Readln(Ch);
  Case ch Of
    1 :Begin
          Writeln('1 :  Lecture d''un vecteure (Tableau 1D)');
					writeln('----------------------------------------');
          read1D(T,tai);
        End;
    2 :Begin
          Writeln('2 :  Ecriture d''un vecteure (Tableau 1D)');
					writeln('-----------------------------------------');
          write1D(T,tai);
        End;
    3 :Begin
          Writeln('3 :  Remplir randomly un vecteur (Tableau 1D)');
					writeln('---------------------------------------------');
          Aleat1D(T,tai);
        End;
    4 :Begin
          Writeln('4 : 	Minimum d''un vecteur (Tableau 1D)');
					writeln('----------------------------------------');
          Writeln('Min des elements de vecteur : ',minTAB1D(T,tai));
        End;
    5 :Begin
          Writeln('5 : 	Maximum d''un vecteur (Tableau 1D)');
					writeln('----------------------------------------');
          Writeln('Max des elements de vecteur : ',maxTAB1D(T,tai));
        End;
    6 :Begin
          Writeln('6 :  Nb Eleme. d''un vecteur (Tableau 1D)');
					writeln('------------------------------------------');
          Write('Valeur a compter dans le vecteur : ');
          Readln(V);
          Writeln('Il y a ',NebV(T,tai,V),' Elem. = à ',V);
        End;
    7 :Begin
          Writeln;
          Writeln('------Fin du travail----------');
          Exit;
        End;
  End;
		 until ReadKey=chr(27);
End.
