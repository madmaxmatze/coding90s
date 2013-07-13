unit send_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMsmtp, StdCtrls, ComCtrls, Buttons;

type
  TSend = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Betreff: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Text: TMemo;
    Status: TStatusBar;
    An: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure AnExit(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

const day : Array[1..7] of string = ('So','Mo','Di','Mi','Do','Fr','Sa');

var
  Send: TSend;

implementation

uses User_Unit, main_Unit, adressbuch_Unit;

{$R *.DFM}

procedure TSend.Button1Click(Sender: TObject);
begin
  main.smtp.Host := user.smtpserver.text;
  if user.Konto.text <> '' then main.smtp.UserID := user.Konto.text else main.smtp.UserID := user.adresse.Text;
  main.smtp.PostMessage.ToAddress.Add(An.text);
  main.smtp.PostMessage.Subject := Betreff.Text;
  main.smtp.PostMessage.Body.Add(Text.text);
  main.smtp.PostMessage.date := Day[DayOfWeek(date)] + ', ' + datetostr(date) + ' - '+ timetostr(Time);
  main.smtp.PostMessage.ReplyTo := user.adresse.text;
  main.smtp.PostMessage.FromAddress := user.adresse.text;
  main.smtp.PostMessage.FromName := user.name.text;
  main.smtp.Connect;
  main.smtp.SendMail;
  main.smtp.Disconnect;
  Status.Panels.Items[0].Text := 'Status: Mail wurde im Postausgang gespeichert!';

end;

procedure TSend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Main.enabled := True;
end;

procedure TSend.FormPaint(Sender: TObject);
var c : byte;
begin
  an.Items.Clear;
  for c := 0 to Adressbuch.ListView.Items.Count - 1 Do
  if Adressbuch.ListView.Items.Item[c].Checked = true then an.Items.Add(Adressbuch.ListView.Items.Item[c].Caption + ', ' + Adressbuch.ListView.Items.Item[c].SubItems.Strings[0]);
end;

procedure TSend.AnExit(Sender: TObject);
var c : byte;
begin
  for c := 0 to Adressbuch.ListView.Items.Count - 1 Do
     if An.Text = Adressbuch.ListView.Items.Item[c].Caption + ', ' + Adressbuch.ListView.Items.Item[c].SubItems.Strings[0] then an.text := Adressbuch.ListView.Items.Item[c].SubItems.Strings[1];
end;

end.
