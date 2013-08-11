Uses Crt;

var Taste                 : Char;
    x, y, dx, dy, c, d, e : ShortInt;
    a                     : LongInt;

Begin;
  TextBackground(0);
  ClrScr;
  x := 13; y := 7; dx := 2; dy := 1;
  TextBackground(1);
  For a := 2 to 24 Do
      Begin;
        GotoXY(3, a); Write('                                                                            ');
      End;
  e := 2;
  Repeat
    Inc(e);
    If e = 16 Then e := 2;
    If dx = -2 then c := -1; If dx = 2 then c := 1;
    If dy = -1 then d := -1; If dy = 1 then d := 1;
    TextColor(e);
    GotoXY(x - dx + c, y - dy - 1) ; If Dy = -1 then Write('‹‹');
    GotoXY(x - dx + c, y - dy)     ; If Dy =  1 then Write('‹‹');
    GotoXY(x - dx + c, y - dy + d) ; If Dy =  1 then Write('ﬂﬂ');
    GotoXY(x - dx + c, y - dy)     ; If Dy = -1 then Write('ﬂﬂ');
    For a := 1 to 100000 Do;
    TextColor(1);
    GotoXY(x - dx + c, y - dy + d) ; Write('€€');
    GotoXY(x - dx + c, y - dy)     ; Write('€€');
    TextColor(e);
    GotoXY(x, y); Write('€€');
    For a := 1 to 100000 Do;
    TextColor(1); GotoXY(x, y); Write('€€');
    If x <  4 then dx := -dx;
    If x > 76 then dx := -dx;
    If y <  3 then dy := -dy;
    If y > 23 then dy := -dy;
    x := x + dx; y := y + dy;
    Until Taste = #27
end.
