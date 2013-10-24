unit MainView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses OtherView, FMX.Messages, MyMessages;

procedure TForm4.Button1Click(Sender: TObject);
var
  otherView: TForm1;
begin
  otherView := TForm1.Create(self);
  otherView.Show;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  TMessageManager.DefaultManager.SubscribeToMessage(TMessage<string>,
    procedure (const Sender: TObject; const msg: TMessage)
    begin
      if msg is TMessage<string> then
        Memo1.Lines.Add('Received ' + msg.ClassName + ': '
          + (msg as TMessage<string>).Value);
    end);

  TMessageManager.DefaultManager.SubscribeToMessage(TMessage<integer>,
    procedure (const Sender: TObject; const msg: TMessage)
    begin
      if msg is TMessage<integer> then
        Memo1.Lines.Add('Received ' + msg.ClassName + ': '
          + (msg as TMessage<integer>).Value.ToString);
    end);

  TMessageManager.DefaultManager.SubscribeToMessage(TResizeFormMessage,
    procedure (const Sender: TObject; const msg: TMessage)
    begin
      if msg is TResizeFormMessage then
      begin
        Self.Width := TResizeFormMessage(msg).Width;
        Self.Height := TResizeFormMessage(msg).Height;
      end;
    end);
end;

end.
