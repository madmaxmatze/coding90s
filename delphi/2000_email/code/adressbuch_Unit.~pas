unit adressbuch_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, ToolWin, StdCtrls;

type
  TAdressbuch = class(TForm)
    ToolBar1: TToolBar;
    ButtonNew: TToolButton;
    ButtonEdit: TToolButton;
    ButtonClear: TToolButton;
    ListView: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonNewClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Adressbuch: TAdressbuch;

implementation

uses main_Unit, Neueintrag_Unit;

{$R *.DFM}

procedure TAdressbuch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Main.enabled := true;
end;

procedure TAdressbuch.ButtonClearClick(Sender: TObject);
begin
  if listview.SelCount = 1 then listview.Selected.Destroy;
end;

procedure TAdressbuch.ButtonNewClick(Sender: TObject);
begin
  Adressbuch.ButtonNew.Tag := 1;
  neueintrag.Visible := true;
  Adressbuch.Enabled := false;
end;

procedure TAdressbuch.ButtonEditClick(Sender: TObject);
begin
  If listview.SelCount = 1 then Begin
     neueintrag.Visible := true;
     Adressbuch.Enabled := false;
     neueintrag.Nachname.Text := listview.Items.Item[listview.Selected.index].Caption;
     neueintrag.Vorname.Text := listview.Items.Item[listview.Selected.index].SubItems.Strings[0];
     neueintrag.Adresse.Text := listview.Items.Item[listview.Selected.index].SubItems.Strings[1];
  End;
end;

end.
