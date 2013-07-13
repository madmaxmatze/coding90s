unit main_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMpop3, StdCtrls, Grids, Db, DBTables, DBGrids, ImgList, ComCtrls,
  ToolWin, ExtCtrls, Menus, NMsmtp;

type
  TMain = class(TForm)
    ToolBar: TToolBar;
    Images: TImageList;
    ButtonUser: TToolButton;
    ButtonWrite: TToolButton;
    ButtonSend: TToolButton;
    ButtonGet: TToolButton;
    Splitter4: TToolButton;
    Splitter3: TToolButton;
    ButtonServer: TToolButton;
    TreeView: TTreeView;
    Splitter1: TSplitter;
    PopupMenu: TPopupMenu;
    ListView: TListView;
    pop3: TNMPOP3;
    Status: TStatusBar;
    Splitter2: TToolButton;
    ButtonAdressbuch: TToolButton;
    Smtp: TNMSMTP;
    ButtonGetSend: TToolButton;
    HotImages: TImageList;
    procedure ButtonServerClick(Sender: TObject);
    procedure ButtonUserClick(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure TreeViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ButtonGetClick(Sender: TObject);
    procedure ButtonAdressbuchClick(Sender: TObject);
    procedure ButtonWriteClick(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Main: TMain;
  GetMails : array[1..100] of TMailMessage;
  WriteMails : array[1..100] of TMailMessage;

implementation

uses get_Unit, User_Unit, send_Unit, adressbuch_Unit;

{$R *.DFM}

procedure TMain.ButtonServerClick(Sender: TObject);
begin
  get.Visible := true;
  Main.Enabled := false;
end;

procedure TMain.ButtonUserClick(Sender: TObject);
begin
  User.Visible := true;
  Main.Enabled := false;
end;

procedure TMain.ButtonSendClick(Sender: TObject);
begin
 { smtp.Host := user.smtpserver.text;
  if user.Konto.text <> '' then main.smtp.UserID := user.Konto.text else main.smtp.UserID := user.adresse.Text;
  smtp.PostMessage.ToAddress.Add(An.text);
  smtp.PostMessage.Subject := Betreff.Text;
  smtp.PostMessage.Body.Add(Text.text);
  smtp.PostMessage.date := Day[DayOfWeek(date)] + ', ' + datetostr(date) + ' - '+ timetostr(Time);
  smtp.PostMessage.ReplyTo := user.adresse.text;
  smtp.PostMessage.FromAddress := user.adresse.text;
  smtp.PostMessage.FromName := user.name.text;
  smtp.Connect;
  smtp.SendMail;
  smtp.Disconnect;                                                        }
  Status.Panels.Items[0].Text := 'Status: Mail wurde erfolgreich versand';
end;

procedure TMain.TreeViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Button = mbright then
    Begin;
      Popupmenu.Popup(main.Left + x + 5,main.Top + y + 82);
    End;
end;

procedure TMain.ButtonGetClick(Sender: TObject);
  var A : integer;
begin
   pop3.Host := user.pop3server.text;
   pop3.Password := user.passwort.Text;
   if user.Konto.text <> '' then main.pop3.UserID := user.Konto.text else main.pop3.UserID := user.adresse.Text;

{If pop3.connected = False then
try
   pop3.Connect;
except
   on ESockError do exit;
end;      }

pop3.Connect;

If pop3.connected = True then
Begin;
   listview.Items.Clear;
   For A := 1 to pop3.MailCount Do
   Begin;
     pop3.GetMailMessage(A);
     GetMails[A] := pop3.MailMessage;
     Listview.Items.Add.Caption := GetMails[A].Head.Values['from'];
     Listview.Items.Item[A - 1].SubItems.add(GetMails[A].Head.Values['subject']);
     Listview.Items.Item[A - 1].SubItems.add(GetMails[A].Head.Values['Date']);
     Listview.Items.Item[A - 1].ImageIndex := 0;
   End;
   pop3.Disconnect;
End;

end;

procedure TMain.ButtonAdressbuchClick(Sender: TObject);
begin
  Adressbuch.Visible := true;
  Main.Enabled := false;
end;

procedure TMain.ButtonWriteClick(Sender: TObject);
begin
  Adressbuch.Visible := true;
  Adressbuch.Visible := false;
  send.visible := true;
  Main.Enabled := false;
end;

procedure TMain.ListViewDblClick(Sender: TObject);
begin
   if ListView.Selected <> NIL then
     ShowMessage(GetMails[listview.Selected.Index + 1].Body.Text);
end;

end.
