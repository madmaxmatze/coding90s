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
    Adresse: TEdit;
    Ok: TBitBtn;
    Abbrechen: TBitBtn;
    Vorname: TEdit;
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
begin
  If (Adresse.Text <> '') and (Nachname.Text <> '') and (Vorname.Text <> '') then Begin
       if Adressbuch.ButtonNew.Tag = 1 then Begin;
          adressbuch.ListView.Items.Insert(0).Caption := '';
          adressbuch.ListView.Items.Item[0].SubItems.add(Vorname.text);
          adressbuch.ListView.Items.Item[0].SubItems.add(Adresse.text);
          adressbuch.ListView.Items.Item[0].Caption := Nachname.text;
       End;
       if Adressbuch.ButtonNew.Tag = 0 then Begin;
         adressbuch.ListView.Items.Item[adressbuch.ListView.Selected.Index].SubItems.Strings[0] := Vorname.text;
         adressbuch.ListView.Items.Item[adressbuch.ListView.Selected.Index].SubItems.Strings[1] := Adresse.text;
         adressbuch.ListView.Items.Item[adressbuch.ListView.Selected.Index].Caption := Nachname.text;
       End;
       Close;
     End
     else
     MessageDlg('Nicht alle Felder korrekt ausgefüllt', mterror, [mbOk], 0)
end;

procedure TNeueintrag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Nachname.Text := '';
  Vorname.Text := '';
  Adresse.Text := '';
  Adressbuch.ButtonNew.tag := 0;
  Adressbuch.enabled := True;
end;

procedure TNeueintrag.AbbrechenClick(Sender: TObject);
begin
  Neueintrag.close
end;

end.
