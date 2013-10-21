unit uTextToTreeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
  stringStream: TStringStream;
begin
  TreeView1.Items.Clear;
  stringStream := TStringStream.Create;
  try
    stringStream.WriteString(Memo1.Lines.Text);
    stringStream.Seek(0, 0);
    TreeView1.LoadFromStream(stringStream);
  finally
    stringStream.Free;
  end;
end;

end.
