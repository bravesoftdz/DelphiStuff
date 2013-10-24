program Messaging;

uses
  FMX.Forms,
  MainView in 'MainView.pas' {Form4},
  OtherView in 'OtherView.pas' {Form1},
  MyMessages in 'MyMessages.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
