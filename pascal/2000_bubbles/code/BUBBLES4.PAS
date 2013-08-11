Program Bubbles;

Uses Crt;

Var Feld     : Array[0..11, 0..8] of Byte;
    FillFeld : Array[1..2, 1..70] of Byte;
    X, Y, A, B, C, D, E, Index, Taste : Integer;
    Punkte, Steine, Versuche : LongInt;

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
                   Feld[10, D] := Random(2) + 1;
               Dec(A);
             End;
           For B := 1 to 7 Do
               Begin;
                 GotoXY(A * 4 - 1, B * 2); Textcolor(Feld[A, B]); Write(' ',Feld[A, B],' ');
               End;
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
                   Index := 0;
                   For A := 1 to 5000 Do
                       Begin;
                         C := X; D:= Y;
                         Repeat
                           For E := 1 to Index Do
                               If (C = FillFeld[1, E]) and (D = FillFeld[2, E]) then B := 10;
                           If B <> 10 then
                              Begin;
                                Inc(Index);
                                FillFeld[1, Index] := C; FillFeld[2, Index] := D;
                                TextBackground(7); GotoXY(C * 4 - 1, D * 2); Write(' ',Feld[C, D],' '); TextBackground(0);
                              End;
                           B := Random(4) + 1;
                           If (B = 1) and (Feld[C, D - 1] = Feld[C, D]) then Begin; B := 0; Dec(D); End;
                           If (B = 2) and (Feld[C + 1, D] = Feld[C, D]) then Begin; B := 0; Inc(C); End;
                           If (B = 3) and (Feld[C, D + 1] = Feld[C, D]) then Begin; B := 0; Inc(D); End;
                           If (B = 4) and (Feld[C - 1, D] = Feld[C, D]) then Begin; B := 0; Dec(C); End;
                         Until B > 0;
                       End;

                   If Index > 1 then
                      Begin;
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