unit MyMessages;

interface

uses
  FMX.Messages;

type
  TResizeFormMessage = class(TMessage)
  private
    FWidth: integer;
    FHeight: integer;
    procedure SetHeight(const Value: integer);
    procedure SetWidth(const Value: integer);
  public
    property Height: integer read FHeight write SetHeight;
    property Width: integer read FWidth write SetWidth;
  end;

implementation

{ TResizeFormMessage }

procedure TResizeFormMessage.SetHeight(const Value: integer);
begin
  FHeight := Value;
end;

procedure TResizeFormMessage.SetWidth(const Value: integer);
begin
  FWidth := Value;
end;

end.
