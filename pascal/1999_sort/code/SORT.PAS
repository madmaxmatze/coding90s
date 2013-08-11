Program Zufall;

Uses Crt;

Const Feld1 : array[1..10] of String[20] = ('Oli','Carina','Mirco','Robert','Gregor','Basti','Rieke','Gunna','Katja','Zo');


Var Test : LongInt;
    A,B, Index : Byte;
    Code, Buchstabe : Integer;
    s : String;
    Feld2 : array[1..10] of String;


Begin;
  ClrScr;

  For test := 1 to 10 Do
      Begin;
        GotoXY(1, Test); Write('Feld1(',Test,') = ', Feld1[Test]);
      End;

   Index := 1;
   For A := 1 to 10 Do
       Begin;
         For B := 1 to 10 Do
             If Feld1[B] <= Feld1[Index] Then If Feld1[Index] > Feld2[a-1] then Index := B;
         Feld2[A] := Feld1[Index];
       End;

       Write(Index);


{
    For Test := 32 to 126 Do
        For A := 1 to 10 Do
            Begin;
              For a := 1 to 10
              {If copy(Feld1[A], 1, 1) = Chr(Test) then
              If Feld1[A] < Feld
                 Begin;
                   Feld2[Index] := Feld1[A];
                   Index := index + 1
                 End;
            End;}



  For test := 1 to 10 Do
      Begin;
        GotoXY(40, Test); Write('Feld2(',Test,') = ', Feld2[Test]);
      End;



{  GotoXY(1, 2); Write('A(2) = ');
  Repeat;
    Inc(A[Random(3) + 1]);
    GotoXY(8, 1); Write(A[1]);
    GotoXY(8, 2); Write(A[2]);
  Until (A[1] > 100000) or (A[2] > 100000);}
  Repeat;
  Until KeyPressed;
End.