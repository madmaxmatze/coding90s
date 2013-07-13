unit Neueintrag_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TNeueintrag = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Nachname: TEdit;
    Vorname: TEdit;
    Adresse: TEdit;
    Ok: TBitBtn;
    Abbrechen: TBitBtn;
    procedure OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbbrechenClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Neueintrag: TNeueintrag;

implementation

uses adressbuch_Unit;

{$R *.DFM}

procedure TNeueintrag.OKClick(Sender: TObject);
var ListItem: TListItem;
begin
  If (Adresse.Text = '') or (Nachname.Text = '') or (Vorname.Text = '') then MessageDlg('Nicht alle Felder korrekt ausgefüllt', mterror, [mbOk], 0) else Begin;

      ListItem := adressbuch.ListView.Items.Add;
      ListItem.Caption := Nachname.text;
      ListItem.SubItems.Add(Vorname.text);

    Nachname.Text := '';
    Vorname.Text := '';
    Adresse.Text := '';
    Neueintrag.close
  End;
end;

procedure TNeueintrag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Adressbuch.enabled := True;
end;

procedure TNeueintrag.AbbrechenClick(Sender: TObject);
begin
  Neueintrag.close
end;

end.
