unit User_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, ComCtrls;

type
  TUser = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    name: TEdit;
    Konto: TEdit;
    Passwort: TMaskEdit;
    Label6: TLabel;
    Adresse: TEdit;
    Label7: TLabel;
    TreeView1: TTreeView;
    pop3server: TComboBox;
    smtpserver: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  User: TUser;

implementation

uses main_Unit;

{$R *.DFM}

procedure TUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Main.enabled := True;
end;




end.
