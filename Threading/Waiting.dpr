program Waiting;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  DSharp.Core.Threading;

var
  task1, task2: TTask<string>;
begin
  try
    task1 := TTask<string>.Create(
      function: string
      begin
        sleep(2000);
        result := 'Heisenberg';
      end);

    task2 := TTask<string>.Create(
      function: string
      begin
        sleep(1000);
        result := 'danger'
      end);

    task2.Start;
    task1.Start;

    // the code below will only print if task1 and task2 have
    // finished their tasks
    // task1 takes 2 seconds, task2 takes 1 second
    WriteLn(task1.Value + ' is the ' + task2.Value +'!');

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
