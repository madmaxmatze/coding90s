program Bubbles2000;

{%ToDo 'Bubbles2000.todo'}

uses
  Forms, Windows, Dialogs,
  Bubbles2000_Unit1 in 'Bubbles2000_Unit1.pas' {frmBubbles};

{$R *.RES}

var hMutex : THandle;

begin
  hMutex := CreateMutex(nil, True, 'Bubbles 2000');
  if GetLastError = ERROR_ALREADY_EXISTS then begin;
    ShowMessage('Bubbles 2000 kann nur einmal gestartet werden.');
    Halt;
  end;
  Application.Initialize;
  Application.Title := 'Bubbles 2000';
  Application.CreateForm(TfrmBubbles, frmBubbles);
  Application.Run;
  if hMutex <> 0 then CloseHandle(hMutex);
end.

