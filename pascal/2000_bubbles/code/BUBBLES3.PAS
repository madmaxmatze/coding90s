Program Bubbles;

Uses Crt, Graph, Dos;

Var Feld                              : Array[0..10, 0..7] of Byte;
    FillFeld                          : Array[1..2, 1..30] of Byte;
    ZFeld                             : Array[1..20] of String;
    X, Y, A, B, C, D, E, Index, Taste, Punkte, Steine, Versuche, ZIndex: Integer;
    Mode, Driver, Size : Integer;
    Z,W : String;

Procedure Code;
  Begin;
    Inc(ZIndex);
    ZFeld[ZIndex] := Z;
    TextColor(7);
    For E := 1 to 20 Do
        Begin;
          GotoXY(45,5 + E);
          Write(ZFeld[E]);
        End;
  End;



Begin;
  TextBackground(0);
  Randomize;
  ClrScr;

  {Driver := VGA;
  Mode := VGAHI;
  InitGraph(Driver, Mode,'C:\BP\BGI\');
  SetTextStyle(1, HorizDir, Size);
  OutTextXY(250, Y, Test);}

  For X := 10 downto 1 Do
      For Y := 7 downto 1 Do
          Begin;
            Feld[X, Y] := Random(5) + 1;
            GotoXY(X * 4, Y * 2); Textcolor(Feld[X, Y]); Write(Feld[X, Y]);
          End;

  Str(Disksize(3) div 1024 div 1024, Z);
  Z := Z + ' MB sind frei auf Laufwerk C' ;
  Code;

  Str(Diskfree(3) div 1024 div 1024, Z);
  Z := Z + ' MB sind frei ';
  Code;

  Str(Lo(DosVersion), Z);
  Z := 'DosVersion: ' + Z;
  Code;

  Repeat;
    TextColor(Feld[X, Y]); TextBackground(7); GotoXY(X * 4 - 1, Y * 2); Write(' ',Feld[X, Y],' '); TextBackground(0);

    TextColor(8);
    GotoXY(50,1); Write('Taste = ', Taste,'   X = ',X,'   Y = ',Y,'  ');

    Taste := Ord(ReadKey);

    TextColor(Feld[X, Y]); GotoXY(X * 4 - 1, Y * 2); Write(' ',Feld[X, Y],' ');

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

                     Str(Index * Pred(Index), Z); Z := 'Punkte = ' + Z; Code;
                     Str(Index, Z); Z := 'Steine = ' + Z; Code;

                     For A := 1 to Index Do
                         Begin;
                           Str(FillFeld[1, A], Z); Str(FillFeld[2, A], W); Z := 'ÈÍ>  ' + Z + '-' + W; Code;

                           TextColor(Feld[FillFeld[1, A], FillFeld[2, A]]);
                           TextBackground(7);
                           GotoXY(FillFeld[1, A] * 4 - 1, FillFeld[2, A] * 2);
                           Write(' ',Feld[FillFeld[1, A], FillFeld[2, A]],' ');
                           TextBackground(0);
                         End;

                     If ReadKey = ' ' then
                        Begin;
                          Inc(Versuche);
                          Inc(steine, Index);
                          Inc(Punkte, Index * Pred(Index));
                          For A := 1 to Index Do
                              Feld[FillFeld[1, A], FillFeld[2, A]] := 0;
                          Str(Punkte, Z); Z := 'GesamtPunkte = ' + Z; Code;
                          Str(Steine, Z); Z := 'GesamtSteine = ' + Z; Code;
                          Str(Versuche, Z); Z := 'GesamtVersuche = ' + Z; Code;
                        End
                      Else
                        Begin;
                          For D := ZIndex downTo ZIndex - Index - 2 Do
                              Begin;
                                ZIndex := D; Z := '                               '; Code;
                              End;
                          Dec(ZIndex)
                        End;
                     If FELD[X, Y] = 0 then
                        Begin;
                          GotoXY(4, 19);
                          Write('Punte pro Stein: ' ,Punkte div Steine, ',',(Punkte mod Steine * 10 div Steine),' ');
                          GotoXY(4, 20);
                          Write('Punkte pro Versuch: ',Punkte div Versuche, ',',(Punkte mod Versuche * 10 div Versuche),' ');
                          GotoXY(4, 21);
                          Write('Steine pro Versuch: ',Steine div Versuche, ',',(Steine mod Versuche * 10 div Versuche),' ');
                        End;

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
                End;
              End;
    End;
  Until Ord(Taste) = 27;
End.
