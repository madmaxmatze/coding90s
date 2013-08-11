Program Zufall;

Uses Crt;

Const Feld : array[1..15] of String[20] = ('Karim','Rukje','Dragan','Mohammed','Miroslav','SÅgur','Arkan','Harkan',
'Matthias Wiemer','Tarkan','Rahim','Vladimir','Abdul','Hassan','Slovodan');

Var A, B : Byte;
    S : String;

Begin;
  ClrScr;

  For a := 1 to 15 Do
      Begin;
        GotoXY(1, A); Write('Feld(',A,') = ', Feld[A]);
      End;

  For A := 1 to 15 Do
      For B := 1 to 14 Do
          If Feld[A] < Feld[B] then
             Begin;
               S := Feld[A];
               Feld[A] := Feld[B];
               Feld[B] := S;
             End;

  For a := 1 to 15 Do
      Begin;
        GotoXY(40, A); Write('Feld(',A,') = ', Feld[A]);
      End;

  Repeat;
  Until KeyPressed;
End.