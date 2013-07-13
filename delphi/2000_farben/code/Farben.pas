unit Farben;

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

implementation

{$R *.DFM}

Procedure Farbe_malen;
Begin;
  Form1.Farbe.Caption := '$00' + Hex(BlueBar.Position) + Hex(GreenBar.Position) + Hex(RedBar.Position);
end;

procedure TForm1.BluebarChange(Sender: TObject);
begin
  Blue.Caption := Inttostr(Bluebar.position);
end;

procedure TForm1.GreenBarChange(Sender: TObject);
begin
  Green.Caption := Inttostr(Greenbar.position);
end;

procedure TForm1.RedBarChange(Sender: TObject);
begin
  Red.Caption := Inttostr(Redbar.position);
end;

end.
