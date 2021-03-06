unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function Encode(Texto: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit2.Text := '';
  Edit2.Text := Encode(Edit1.Text);
  Edit1.Text := '';

end;

function TForm1.Encode(Texto: string): string;
const
  AlfaNumerico: string = 'A1B2C3D4E5F6G7H8I9J1K2L3M4N5O6P7Q8R9S1T2U3V4W5X6Y7Z';
var
  i, x: Integer;
begin
  Texto := UpperCase(Texto);
  for i := 1 to Length(Texto) do
    if (Pos(Texto[i], AlfaNumerico) <> 0) then
    begin
      x := Pos(Texto[i], AlfaNumerico) - 1;
      if (x <= 0) then
        x := 23;
      Texto[i] := AlfaNumerico[x];
    end;
  Result := Texto;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    Button1Click(self);
end;

end.
