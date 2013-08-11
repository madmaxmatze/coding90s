Program Grafik;

Uses Crt, Graph;

Var Mode, Driver,Y, Size : Integer;
    S : Word;
    P : pointer;

Begin;
  ClrScr;
  Driver := Detect;

  InitGraph(Driver, Mode,'C:\BP\BGI\');
  Arc(100,100,0,180,100);

  Bar3D(0,200,200,250,10,TopOn);

  Ellipse(100, 100, 0, 270, 90, 20);

  For size := 0 to 9 Do
      Begin;
        SetFillStyle(Size + 1, Size + 1);
        Sector(120, 350, size * 36, (Size + 1) * 36, 120, 60);
      End;

  SetFillStyle(XHatchFill, 10);
  Floodfill(1,1,15);

  Y := 0;
  for Size := 1 to 9 do
      begin
        SetTextStyle(GothicFont, HorizDir, Size);
        OutTextXY(250, Y, 'Size = ' + Chr(Size + 48));
        Inc(Y, TextHeight('H') + 1);
      end;

  S := ImageSize(0, 0, 100, 100);
  GetMem(P, Size);
  GetImage(0, 0, 100, 100, P^);
  PutImage(400, 0, P^, NormalPut);

  Readln;

End.