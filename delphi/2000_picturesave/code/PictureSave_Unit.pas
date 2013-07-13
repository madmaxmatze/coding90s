unit PictureSave_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  get, put : Trect;
  X, Y : Integer;

implementation

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Form1.Visible := False;
//  Form1.WindowState := wsMaximized;
  X := 800;
  Y := 600;
//  Form1.WindowState := wsNormal;
  Canvas.TextOut(1,1, 'Auflösung :' + Inttostr(X) + ' x '+  inttostr(Y));
  Get := Rect(0 - Form1.Left, -20 - Form1.Top, X - Form1.Left ,Y - Form1.Top);
  Put := Rect(0, 0, X, Y);
  Image1.canvas.CopyRect(put, Form1.Canvas,Get);
  Image1.picture.SaveToFile('SavePic1.bmp');
  Form1.Visible := true;
  Timer1.Enabled := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Interval := trackbar1.Position;
  Timer1.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//Close;
end;

end.
