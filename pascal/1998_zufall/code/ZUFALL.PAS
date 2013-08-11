Program Zufall;

Uses Crt;


Var Test : LongInt;
    A : array[1..2] of LongInt;

Begin;
  Randomize;
  ClrScr;
  Repeat
    Inc(A[Random(3)]);
  Until A[1] > 1000000;

  For Test := 1 to 2 Do
      Begin;
        GotoXY(1, Test); Write('A(',Test,') = ', A[Test]);
      End;

  Repeat;
  Until KeyPressed;
End.