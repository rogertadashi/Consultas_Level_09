unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    rgOpcoes: TRadioGroup;
    txtConsulta: TEdit;
    lblConsulta: TLabel;
    btRealizarConsulta: TButton;
    DBGrid1: TDBGrid;
    procedure rgOpcoesClick(Sender: TObject);
    procedure btRealizarConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UnitDM;

procedure TForm1.btRealizarConsultaClick(Sender: TObject);
begin
  dm.sqlConsulta.Close;
  dm.sqlConsulta.SQL.Clear;
    if (rgOpcoes.ItemIndex	= 0) then
      begin
        dm.sqlConsulta.SQL.Add('SELECT * FROM clientes WHERE nome LIKE :pConsulta');
        dm.sqlConsulta.ParamByName('pConsulta').AsString := txtConsulta.Text+'%';
      end;

    if (rgOpcoes.ItemIndex	= 1) then
      begin
               dm.sqlConsulta.SQL.Add('SELECT * FROM clientes WHERE bairro LIKE :pConsulta');
        dm.sqlConsulta.ParamByName('pConsulta').AsString := txtConsulta.Text+'%';
      end;

  dm.sqlConsulta.Open;
end;

procedure TForm1.rgOpcoesClick(Sender: TObject);
begin

  if (rgOpcoes.ItemIndex	= 0) then
      begin
        lblConsulta.Caption := 'Digite o Nome';
      end;

  if (rgOpcoes.ItemIndex = 1) then
      begin
        lblConsulta.Caption := 'Digite o Bairro';
      end;



end;

end.
