unit SMScount_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo: TMemo;
    Label1: TLabel;
    Count: TLabel;
    procedure MemoChange(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.MemoChange(Sender: TObject);
begin

  count.caption := Inttostr(Length(Memo.Lines.Text));
end;

end.
