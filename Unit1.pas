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
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function Encode(Texto: string): string;
    function Decode(Texto: string): string;
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit1.Text := Decode(Edit2.Text);
  Edit2.Text := '';
end;

function TForm1.Decode(Texto: string): string;
const
  AlfaNumerico: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  i, x: Integer;
begin
  Texto := UpperCase(Texto);
  for i := 1 to Length(Texto) do
    if (Pos(Texto[i], AlfaNumerico) <> 0) then
    begin
      x := Pos(Texto[i], AlfaNumerico) + 1;
      if (x >= 23) then
        x := 1;
      Texto[i] := AlfaNumerico[x];
    end;
  Result := Texto;

end;

function TForm1.Encode(Texto: string): string;
const
  AlfaNumerico: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
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

end.
