program PictureSave;

uses
  Forms,
  PictureSave_Unit in 'PictureSave_Unit.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
