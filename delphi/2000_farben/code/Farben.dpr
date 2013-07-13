program Farben;

uses
  Forms,
  Farben_unit in 'Farben_unit.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
