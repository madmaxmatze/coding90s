Uses Crt;

Var X, Y, DX, DY, X1, X2, Y1, Y2, A, B, C, D, F : ShortInt;
    Dummy                                       : LongInt ;
    E                                           : String  ;

Begin;
  Randomize;
  X:=13;   Y:=20;   DX:=2;   DY:=1;   X1:=3;   X2:=78;   Y1:=2;   Y2:=24;
  TextBackGround(11);
  ClrScr;
  F := 13;
  Repeat
    If D = 0 Then Begin
    If F = 15 then F := 1;
    Inc(F);
    E := '';
    If X1 > 3 then A := Random(3)-1 Else A := Random(1) + 1;
       If X1 + A * 2 + 4 < X then X1 := X1 + A * 2;
    If X2 < 78 then A := Random(3)-1 Else A := Random(1) - 1;
       If X2 + A * 2 - 4 > X then X2 := X2 + A * 2;
    If Y1 > 2 then A := Random(3)-1 Else A := Random(1) + 1;
       If Y1 + A + 2 < Y then Y1 := Y1 + A;
    If Y2 < 24 then A := Random(3)-1 Else A := Random(1) - 1;
       If Y2 + A - 2 > Y then Y2 := Y2 + A;
    For A := X1 to X2 Do E := E + '€';
    TextColor(1); TextBackGround(11);
    For A := Y1 to Y2 Do
        Begin;
          GotoXY(X1 - 2, A); Write('  ', E ,'  ');
        End;
    GotoXY(1 , Y1 - 1); Write('                                                                              ');
    GotoXY(1 , Y2 + 1); Write('                                                                              ');
    D := 20;
    End;
    Dec(D);
    If dx = -2 then b := -1; If dx = 2 then b := 1;
    If dy = -1 then c := -1; If dy = 1 then c := 1;
    TextColor(F); TextBackGround(1);
    GotoXY(x - dx + b, y - dy - 1) ; If Dy = -1 then Write('‹‹');
    GotoXY(x - dx + b, y - dy)     ; If Dy =  1 then Write('‹‹');
    GotoXY(x - dx + b, y - dy + c) ; If Dy =  1 then Write('ﬂﬂ');
    GotoXY(x - dx + b, y - dy)     ; If Dy = -1 then Write('ﬂﬂ');
    For Dummy := 1 to 250000 Do;
    TextColor(1);
    GotoXY(x - dx + b, y - dy + c) ; Write('€€');
    GotoXY(x - dx + b, y - dy)     ; Write('€€');
    TextColor(F); GotoXY(X, Y); Write('€€');
    If X < X1 + 2 then DX := -DX; If X > X2 - 2 then DX := -DX;
    If Y < Y1 + 1 then DY := -DY; If Y > Y2 - 1 then DY := -DY;
    For Dummy := 1 to 250000 Do;
    TextColor(1); GotoXY(X, Y); Write('€€');
    X := X + DX; Y := Y + DY;
  Until X = 0;
End.
