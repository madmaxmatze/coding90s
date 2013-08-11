uses WinDos, Crt;

Const
  Days : array [0..6] of String[15] = ('Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag');

Var
  J, M, T, TdW, SaveJ, SaveM, SaveT : Word;

Begin
  TextBackground(0);
  ClrScr;

  GetDate(J, M, T, TdW);
  SaveJ := J; SaveM := M; SaveT := T;

  TextColor(14); GotoXY(24, 2); Write('Heute ist ', Days[TdW],' der ', T, '.', M, '.', J);

  TextColor(15); GotoXY(27, 4); Write('Tag   (1 - 31)      : ');
                 GotoXY(27, 5); Write('Monat (1 - 12)      : ');
                 GotoXY(27, 6); Write('Jahr  (1980 - 2099) : ');
                 GotoXY(49, 4); Read(T);
                 GotoXY(49, 5); Read(M);
                 GotoXY(49, 6); Read(J);

  SetDate(J, M, T);

  GetDate(J, M, T, TdW);

  If T = SaveT then
     If M = SaveM then
        If J = SaveJ then
           Begin;
             TextColor(4);
             GotoXY(21, 8); WriteLn('Au·erhalb des zulÑssigen Bereichs !!!');
           End;

  TextColor(15); GotoXY(25, 9); Write('Der ');
  TextColor(10); Write(T, '.', M, '.', J);
  TextColor(15); Write(' ist ein ');
  TextColor(10); Write(Days[TdW]);
  TextColor(15); Write('.');

  SetDate(SaveJ, SaveM, SaveT);

  GotoXY(21, 11); Write('Taste drÅcken um zu DOS zurÅckzukehren.');

  Repeat
  Until KeyPressed

end.
