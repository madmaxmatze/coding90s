unit Farben_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    RedBar: TScrollBar;
    GreenBar: TScrollBar;
    Bluebar: TScrollBar;
    label0: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    FarbBox: TPanel;
    red: TLabel;
    green: TLabel;
    blue: TLabel;
    Label3: TLabel;
    Farbe: TLabel;
    procedure BluebarChange(Sender: TObject);
    procedure GreenBarChange(Sender: TObject);
    procedure RedBarChange(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  Blau, Rot, Grun : String;

implementation

{$R *.DFM}

Function Hex(A : Integer) : String;
Var R : Integer;
    S : String;
Begin
  S := '';
  Repeat
    R := A mod 16;
    A := A div 16;
    If R > 9 then R := R + 55 else R := R + 48;
    S := Chr(R) + S;
  Until A = 0;
 If length(S) < 2 then S := '0' + S;
 Hex := S;
End;

Procedure Farbe_malen;
Begin;
  Form1.FarbBox.color := RGB(Form1.RedBar.Position, Form1.greenBar.Position, Form1.BlueBar.Position);
  Form1.Farbe.Caption := Inttostr(Form1.FarbBox.color);
end;

procedure TForm1.BluebarChange(Sender: TObject);
begin
  Farbe_Malen;
  Blue.Caption := Inttostr(Bluebar.position);
end;

procedure TForm1.GreenBarChange(Sender: TObject);
begin
  Farbe_Malen;
  Green.Caption := Inttostr(Greenbar.position);
end;

procedure TForm1.RedBarChange(Sender: TObject);
begin
  Farbe_Malen;
  Red.Caption := Inttostr(Redbar.position);
end;

end.
