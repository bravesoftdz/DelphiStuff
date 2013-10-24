unit OtherView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses
  FMX.Messages, MyMessages;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TMessageManager.DefaultManager.SendMessage(Self,
    TMessage<string>.Create('This is a string message'));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TMessageManager.DefaultManager.SendMessage(Self,
    TMessage<integer>.Create(1500));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  msg: TResizeFormMessage;
begin
  msg := TResizeFormMessage.Create;
  msg.Height := 500;
  msg.Width := 300;
  TMessageManager.DefaultManager.SendMessage(Self, msg, true);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

end.
