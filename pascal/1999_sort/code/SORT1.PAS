Program Zufall;

Uses Crt;

Const Feld1 : array[1..10] of String[20] = ('Oli','Carina','Mirco','Robert','Gregor','Basti','Rieke','Gunna','Katja','Zo');


Var A,B, Index, Oldindex, Startindex : Byte;
    Feld2 : array[1..10] of String;

Begin;
  ClrScr;

  For A := 1 to 10 Do
      Begin;
        GotoXY(1, A); Write('Feld1(',a,') = ', Feld1[A]);
      End;


   Index := 1;
   For B := 1 to 10 Do
       If (Feld1[B] >= Feld1[index]) Then Index := B;
   Startindex := index;


   For A := 1 to 10 Do
       Begin;
         Index := Startindex;
         For B := 1 to 10 Do
             If (Feld1[B] <= Feld1[index]) and (Feld1[B] > Feld1[oldindex]) Then
                Begin;
                  Index := B;
                End;
         Feld2[A] := Feld1[Index];
         Write(Index);
         Oldindex := index;
        End;

  For A := 1 to 10 Do
      Begin;
        GotoXY(40, A); Write('Feld2(',A,') = ', Feld2[A]);
      End;
  Repeat;
  Until KeyPressed;
End.