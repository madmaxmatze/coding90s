Program Zufall;

Uses Crt;

Var Feld : Array[1..3, 1..15] of LongInt;
    A, B, X, Y : LongInt;

Begin;
  ClrScr;
  Randomize;
  For A := 1 to 10000 Do
      Begin;
        X := 2; Y := 1;
        Repeat;
          B := (Random(3) - 1);
          If B = 0 then Inc(Y);
        Until B <> 0;
        Inc(Feld[X + B, Y]);
     End;
  For A := 1 To 3 Do
      For B := 1 To 15 Do
          Begin;
            Textcolor(B); GotoXY(A * 6 - 5, B); Write(Feld[A, B]);
          End;
  Repeat
  Until
  KeyPressed;
End.