program Bubbles2000;

{%ToDo 'Bubbles2000.todo'}

uses
  Forms,
  Bubbles2000_Unit in 'Bubbles2000_Unit.pas' {frmBubbles};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Bubbles 2000';
  Application.CreateForm(TfrmBubbles, frmBubbles);
  Application.Run;
end.
