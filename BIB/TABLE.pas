program table;
uses wincrt,BIB02;
var T:TAB2D;
NBC,NBL:tind;
begin
//Aleat2D(T,NBL,NBC);
read2D(T,NBL,NBC);
writeln;
writeln('------------------------------');
writeln;
write2D(T,NBL,NBC);
writeln;
writeln('------------------------------');
writeln;
minind2D(T,NBL,NBC);
writeln;
writeln('------------------------------');

end.