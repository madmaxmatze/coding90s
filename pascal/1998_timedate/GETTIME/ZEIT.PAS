Program Test;
Uses Crt, WinDos, Cursor;

var h, m, s, hund : Word;
    function LeadingZero(w : Word) : String;
var s : String;

begin
  Str(w:0,s);
  if Length(s) = 1 then
     s := '0' + s;
  LeadingZero := s;
end;

begin
  ClrScr;
  CursorOff;
  repeat
    GetTime(h,m,s,hund);
    GotoXY(1,1);
    Writeln('Zeit: ',LeadingZero(h),':',LeadingZero(m),':',LeadingZero(s),'.',LeadingZero(hund));
  until KeyPressed;
end.
