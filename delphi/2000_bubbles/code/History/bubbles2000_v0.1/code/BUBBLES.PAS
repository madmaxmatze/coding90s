Program Bubbles;

Uses Crt;

Var Feld                              : Array[0..10, 0..7] of Byte;
    FillFeld                          : Array[1..2, 1..30] of Byte;
    X, Y, A, B, C, D, E, Index, Taste : Integer;

Begin;
  Randomize;
  ClrScr;
  For X := 10 downto 1 Do
      For Y := 7 downto 1 Do
          Begin;
            Feld[X, Y] := Random(5) + 1;
            GotoXY(X * 4, Y * 2); Textcolor(Feld[X, Y]); Write(Feld[X, Y]);
          End;

  Repeat;
    TextColor(Feld[X, Y]); TextBackground(7); GotoXY(X * 4 - 1, Y * 2); Write(' ',Feld[X, Y],' '); TextBackground(0);

    TextColor(8); GotoXY(50,1); Write('Taste = ', Taste,'   X = ',X,'   Y = ',Y,'  ');

    Taste := Ord(ReadKey);

    TextColor(Feld[X, Y]); GotoXY(X * 4 - 1, Y * 2); Write(' ',Feld[X, Y],' ');

    Case Taste of
         80 : If Y < 7 then Inc(Y);
         72 : If Y > 1 then Dec(Y);
         77 : If X < 10 then Inc(X);
         75 : If X > 1 then Dec(X);
         32 : Begin;
                Index := 0;
                For A := 1 to 300 Do
                    Begin;
                      C := X; D:= Y;
                      Repeat
                        For E := 1 to Index Do
                            If (C = FillFeld[1, E]) and (D = FillFeld[2, E]) then B := 10;
                        If B <> 10 then Begin;
                                          Inc(Index);
                                          FillFeld[1, Index] := C;
                                          FillFeld[2, Index] := D;
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

                     Textcolor(8); GotoXY(50, 3); Write('Index = ', Index);

                     For A := 1 to Index Do
                         Begin;
                           GotoXY(61, A + 2); Write('=>   ',  FillFeld[1, A],'-',FillFeld[2, A]);
                           TextBackground(7);
                           GotoXY(FillFeld[1, A] * 4 - 1, FillFeld[2, A] * 2);
                           Write(' ',Feld[FillFeld[1, A], FillFeld[2, A]],' ');
                           TextBackground(0);
                         End;

                     If ReadKey = ' ' then For A := 1 to Index Do
                        Feld[FillFeld[1, A], FillFeld[2, A]] := 0;

                     ClrScr;

                     For A := 1 to 10 Do
                         For B := 1 to 7 Do
                             If Feld[A, B] = 0 then
                                For C := B downto 1 Do
                                    Feld[A, C] := Feld[A, C - 1];

                     For A := 1 to 10 Do
                         Begin;
                           C := 0;
                           For B := 1 to 7 Do
                               If Feld[A, B] = 0 then Inc(C);
                                  If C = 7 then
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
                               GotoXY(A * 4, B * 2); Textcolor(Feld[A, B]); Write(Feld[A, B]);
                             End;
                End;
              End;
    End;
  Until Ord(Taste) = 27;
End.
