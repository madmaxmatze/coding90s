Program Bubbles;

Uses Crt;

Var Feld     : Array[0..11, 0..8] of Byte;
    FillFeld : Array[1..2, 1..70] of Byte;
    X, Y, A, B, C, D, E, F, Index, Taste : Integer;
    Punkte, Steine, Versuche : LongInt;
    Test : array[1..2, 1..5] Of Byte;

Begin;
  TextBackground(0);
  Randomize;
  ClrScr;
  X:=1; Y:= 1;

  Repeat;
    TextColor(7);
    GotoXY(4, 18); Write('Punkte             : ',Punkte);
    GotoXY(4, 19); Write('Steine             : ', Steine);
    GotoXY(4, 20); Write('Versuche           : ', Versuche);
    GotoXY(4, 21);
    If Versuche > 0 then Write('Steine pro Versuch : ',Steine div Versuche, ',',(Steine mod Versuche * 10 div Versuche),' ');

    For A := 1 to 10 Do
        Begin;
          For B := 1 to 7 Do
              If Feld[A, B] = 0 then
                 For C := B downto 1 Do
                     Feld[A, C] := Feld[A, C - 1];

          If Feld[A, 7] = 0 then
             Begin;
               For C := A + 1 to 10 do
                   For D := 1 to 7 do
                       Feld[C - 1, D] := Feld[C, D];
               For D := 1 to 7 Do
                   Feld[10, D] := Random(5) + 1;
               Dec(A);
             End;
        End;
    For A := 1 to 10 Do
        For B := 1 to 7 Do
            Begin;
              GotoXY(A * 4 - 1, B * 2); Textcolor(Feld[A, B]); Write(' ',Feld[A, B],' ');
            End;

    TextColor(Feld[X, Y]); TextBackground(7); GotoXY(X * 4 - 1, Y * 2); Write(' ',Feld[X, Y],' '); TextBackground(0);

    Taste := Ord(ReadKey);

    Case Taste of
         80 : If Y < 7 then Inc(Y);
         72 : If Y > 1 then Dec(Y);
         77 : If X < 10 then Inc(X);
         75 : If X > 1 then Dec(X);
         32 : If Feld[X, Y] > 0 then
                 Begin;
                   C := X; D:= Y; Index := 0;
                   For A := 1 to 1000 Do
                       Begin;
                         B := 0; F:= 0;
                         If (Feld[C, D - 1] = Feld[C, D]) then Begin; Inc(B); Test[1, B] := C; Test[2, B] := D - 1; End;
                         If (Feld[C + 1, D] = Feld[C, D]) then Begin; Inc(B); Test[1, B] := C + 1; Test[2, B] := D; End;
                         If (Feld[C, D + 1] = Feld[C, D]) then Begin; Inc(B); Test[1, B] := C; Test[2, B] := D + 1; End;
                         If (Feld[C - 1, D] = Feld[C, D]) then Begin; Inc(B); Test[1, B] := C - 1; Test[2, B] := D; End;

                         If B > 0 then
                            Begin;
                              B := Random(B) + 1;
                              For E := 1 to Index Do
                                  If (C = FillFeld[1, E]) and (D = FillFeld[2, E]) then F := 1;
                              If F = 0 then
                                 Begin;
                                   Inc(Index);
                                   FillFeld[1, Index] := C; FillFeld[2, Index] := D;
                                 End;
                              C := Test[1, B]; D := Test[2, B];
                         End;
                      End;
                   If Index > 1 then
                      Begin;
                        For A := 1 to Index Do
                            Begin;
                              TextBackground(7); GotoXY(FillFeld[1, A] * 4 - 1, FillFeld[2, A] * 2);
                              Write(' ',Feld[FillFeld[1, A], FillFeld[2, A]],' '); TextBackground(0);
                            End;
                        Textcolor(7);
                        GotoXY(4, 16); Write('Steine = ', Index,'    Punkte = ', Index * Pred(Index),'  ');
                        If ReadKey = ' ' then
                           Begin;
                             Inc(Versuche);
                             Inc(Steine, Index);
                             Inc(Punkte, Index * Pred(Index));
                             For A := 1 to Index Do
                                 Feld[FillFeld[1, A], FillFeld[2, A]] := 0;
                           End;
                        ClrScr;
                      End;
                 End;
    End;
  Until Ord(Taste) = 27;
End.