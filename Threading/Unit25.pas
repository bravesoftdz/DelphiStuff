unit Unit25;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  DSharp.Core.Threading, FMX.Edit, FMX.Layouts, FMX.Memo, Generics.Collections;

type
  TMyThread = class(TThread)
  private
    fTask: TTask;
  public
    procedure Execute; override;
    procedure Cancel;
  end;

  TForm25 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fMyThread: TMyThread;
    fThreadList: TList<TMyThread>;
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

{$R *.fmx}

procedure TForm25.Button1Click(Sender: TObject);
begin
  fMyThread := TMyThread.Create(true);
  fMyThread.FreeOnTerminate := true;
  fThreadList.Add(fMyThread);

  fMyThread.Start;

end;

{ TMyThread }

procedure TMyThread.Cancel;
begin
  if not fTask.Canceled then
  begin
    fTask.Cancel;
  end;
end;

procedure TMyThread.Execute;
begin
  fTask := TTask.Create(
    procedure
    begin
      Sleep(2000);
    end);
  fTask.Start;

  Synchronize(
    procedure
    var
      i, j: integer;
    begin
      i := -1;
      while not fTask.Finished do
      begin
        if i > -1 then
        begin
          j := Length(Form25.Memo1.Lines[i]);
          if Form25.Memo1.Lines[i].EndsWith('/') then
            Form25.Memo1.Lines[i]:= Form25.Memo1.Lines[i].Replace('/', '\', [])
          else
            Form25.Memo1.Lines[i] := Form25.Memo1.Lines[i].Replace('\', '/', []);
        end
        else
          i := Form25.Memo1.Lines.Add('Thread id: ' + Self.ThreadID.ToString + ' Inner task is running. /');

        Application.ProcessMessages;
        if fTask.Canceled then
        begin
          Form25.Memo1.Lines[i] := Form25.Memo1.Lines[i] + ' canceled';
          break;
        end;
      end;

      if not fTask.Canceled then
      begin
        if i > -1 then
          Form25.Memo1.Lines[i] := Form25.Memo1.Lines[i] + ' done.'
        else
          Form25.Memo1.Lines.Add('Done ' + Self.ThreadID.ToString);
        Form25.Memo1.Repaint;
        Application.ProcessMessages;
      end;
    end);
end;

procedure TForm25.Button2Click(Sender: TObject);
var
  t: TMyThread;
begin
  for t in fThreadList do
    if t <> nil then
      t.Cancel;
end;

procedure TForm25.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm25.FormCreate(Sender: TObject);
begin
  fThreadList := TList<TMyThread>.Create;
end;

procedure TForm25.FormDestroy(Sender: TObject);
begin
  fThreadList.Free;
end;

end.
