unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  StrichType = record
    x1 : integer;
    x2 : integer;
    y1 : integer;
    y2 : integer;
    c : Longword;
  End;
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  x1, x2, y1, y2, dx1, dx2, dy1, dy2, s, dc, c, maxline : Integer;
  Strich : array[0..100] of Strichtype;

implementation

{$R *.DFM}

function Zufall : Integer;
Begin;
  Zufall := Random(15) + 3
End;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Strich[1].x1 := 1;
  Strich[1].y1 := 300;
  Strich[1].x2 := 300;
  Strich[1].y2 := 1;
  Strich[1].c := 0;
  dx1 := 4;
  dx2 := 3;
  dy1 := 10;
  dy2 := 9;
  MaxLine := 200;
  dc := 1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var a : byte;
begin
  Strich[Maxline].c := 0;

  If s = 0 then Begin;
    For a := Maxline downto 2 do
      Begin;
        Canvas.pen.color := Strich[A].c;
        Canvas.moveto(strich[A].x1, strich[A].y1); Canvas.lineto(strich[A].x2,strich[A].y2);
        Strich[A] := Strich[A - 1];
      End;
      Canvas.pen.color := Strich[1].c;
      Canvas.moveto(strich[1].x1, strich[1].y1); Canvas.lineto(strich[1].x2,strich[1].y2);
    End;

  If s = 1 then
      Begin;
        Canvas.pen.color := Strich[1].c;
        Canvas.Ellipse(strich[1].X1, strich[1].Y1, strich[1].X2, strich[1].Y2);
      End;

  If s = 2 then
      Begin;
        Canvas.pen.color := Strich[1].c;
        Canvas.rectangle(strich[1].X1, strich[1].Y1, strich[1].X2, strich[1].Y2);
      End;

  Strich[1].c := Strich[1].c + dc;

  If (Strich[1].C = 255) and (dc = 1) then dc := 256;
  If (Strich[1].C = 65535) and (dc = 256) then dc := 256 * 256;
  If (Strich[1].C = 16777215) and (dc = 256 * 256) then Dc := -1;
  If (Strich[1].C = 16776960) and (dc = -1) then dc := -256;
  If (Strich[1].C = 16711680) and (dc = -256) then dc := -256 * 256;
  IF (Strich[1].C = 0) and (dc = -256 * 256) then Begin; DC := 1; Refresh; End;

  Strich[1].x1 := Strich[1].x1 + dx1;
  Strich[1].y1 := Strich[1].y1 + dy1;
  Strich[1].x2 := Strich[1].x2 + dx2;
  Strich[1].y2 := Strich[1].y2 + dy2;

  If Strich[1].x1 > form1.Width - 8 then dx1 := -1 * Zufall;
  If Strich[1].x1 < 0 then dx1 := Zufall;
  If Strich[1].x2 > form1.Width - 8 then dx2 := -1 * Zufall;
  If Strich[1].x2 < 0 then dx2 := Zufall;
  If Strich[1].y1 > form1.Height - 29 then dy1 := -1 * Zufall;
  If Strich[1].y1 < 0 then dy1 := Zufall;
  If Strich[1].y2 > form1.Height - 29 then dy2 := -1 * Zufall;
  If Strich[1].y2 < 0 then dy2 := Zufall;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #32 then Begin;
    S := s + 1;
    If s > 2 then s := 0;
    Refresh;
  End;
end;

end.


