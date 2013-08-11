Program Zufall;

Uses Crt;

Const Feld1 : array[1..10] of String[20] = ('Rieke','Carina','Mirco','Mo','Marcus','Basti','Martin','Gregor','Zoro','Oli');

Var A, B, Index, Oldindex : Byte;
    Feld2 : array[1..10] of String;

Begin;
  ClrScr;

  For A := 1 to 10 Do
      Begin;
        For B := 1 to 10 Do
            If Feld1[B] >= Feld1[Index] Then Index := B;
        For B := 1 to 10 Do
            If (Feld1[B] <= Feld1[Index]) and (Feld1[B] > Feld1[OldIndex]) Then Index := B;
        GotoXY(1, A); Write('Feld1(',A,') = ', Feld1[A]);
        Feld2[A] := Feld1[Index];
        GotoXY(40, A); Write('Feld2(',A,') = ', Feld2[A]);
        OldIndex := Index;
      End;

  Repeat;
  Until KeyPressed;
End.