unit uFormCadastroAncestral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormAncestral, System.Actions,
  Vcl.ActnList, Vcl.AppEvnts, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  ACBrBase, ACBrValidador, Vcl.Mask, Vcl.ComCtrls;

type
  TfrmCadAncestral = class(TfrmAncestral)
    btnInserir: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    DBGridCadastro: TDBGrid;
    btnDeletar: TButton;
    Validador: TACBrValidador;
    actInserir: TAction;
    actEditar: TAction;
    actCancelar: TAction;
    actDeletar: TAction;
    actSalvar: TAction;
    btnBuscar: TButton;
    actBuscar: TAction;
    mskEdtBuscar: TMaskEdit;
    procedure actInserirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actDeletarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure DBGridCadastroDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actBuscarExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClicBotoes(CodBotao: integer);
    function removerMascaras(ADados: string): string;
    function ValidarDocumento(ADocumento: string; codDocumento: Integer): Boolean;
    procedure BloquearCaixaDeTextos(Bloquear: boolean);
  public
    { Public declarations }
  end;

var
  frmCadAncestral: TfrmCadAncestral;

implementation

{$R *.dfm}

{ TfrmCadAncestral }

procedure TfrmCadAncestral.actBuscarExecute(Sender: TObject);
begin
  inherited;
  ClicBotoes(0);
  BloquearCaixaDeTextos(False);
end;

procedure TfrmCadAncestral.actCancelarExecute(Sender: TObject);
begin
  inherited;
  LimparDados;
  DBGridCadastro.DataSource.DataSet.Cancel;
  BloquearCaixaDeTextos(false);
end;

procedure TfrmCadAncestral.actDeletarExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja deletar o registro selecionado?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    DBGridCadastro.DataSource.DataSet.Delete;

  LimparDados;
  BloquearCaixaDeTextos(false);
  ClicBotoes(0);
end;

procedure TfrmCadAncestral.actEditarExecute(Sender: TObject);
begin
  inherited;
  ClicBotoes(0);
  LimparDados;
  BloquearCaixaDeTextos(false);
  MessageDlg('Registro editado com sucesso!', mtInformation, [mbOK], 0);
end;

procedure TfrmCadAncestral.actInserirExecute(Sender: TObject);
begin
  inherited;
  LimparDados;
  ClicBotoes(1);
  BloquearCaixaDeTextos(true);
end;

procedure TfrmCadAncestral.actSalvarExecute(Sender: TObject);
begin
  inherited;
  LimparDados;
  BloquearCaixaDeTextos(False);
  MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
end;

procedure TfrmCadAncestral.BloquearCaixaDeTextos(Bloquear: boolean);
var
   i: Integer;
begin
    for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TEdit) then
          (Components[i] as TEdit).Enabled := Bloquear;
      if (Components[i] is TMaskEdit) then
        if Pos('Buscar',(Components[i] as TMaskEdit).Name) = 0 then
          (Components[i] as TMaskEdit).Enabled := Bloquear;
      if (Components[i] is TDateTimePicker) then
          (Components[i] as TDateTimePicker).Enabled := Bloquear;
      if (Components[i] is TComboBox) then
        if Pos('Buscar',(Components[i] as TComboBox).Name) = 0 then
          (Components[i] as TComboBox).Enabled := Bloquear;
    end;
end;

procedure TfrmCadAncestral.ClicBotoes(CodBotao: integer);
begin
  case CodBotao of
    0:  //Inicio
    begin
      actInserir.Enabled  := true;
      actEditar.Enabled   := false;
      actCancelar.Enabled := false;
      actDeletar.Enabled  := false;
      actSalvar.Enabled   := false;
    end;
    1:  //Inserir
    begin
      actInserir.Enabled  := false;
      actEditar.Enabled   := false;
      actCancelar.Enabled := true;
      actDeletar.Enabled  := false;
      actSalvar.Enabled   := true;
    end;
    2: //clic na grid
    begin
      actInserir.Enabled  := false;
      actEditar.Enabled   := true;
      actCancelar.Enabled := true;
      actDeletar.Enabled  := true;
      actSalvar.Enabled   := false;
    end;
  end;
end;

procedure TfrmCadAncestral.DBGridCadastroDblClick(Sender: TObject);
begin
  inherited;
  ClicBotoes(2);
  BloquearCaixaDeTextos(true);
end;

procedure TfrmCadAncestral.FormShow(Sender: TObject);
begin
  inherited;
  ClicBotoes(0);
  BloquearCaixaDeTextos(false);
  LimparDados;
end;

function TfrmCadAncestral.removerMascaras(ADados: string): string;
var
  SemMascara: string;
begin
  SemMascara := StringReplace(ADados, '.', '', [rfReplaceAll, rfIgnoreCase]);
  SemMascara := StringReplace(SemMascara, '-', '', [rfReplaceAll, rfIgnoreCase]);
  SemMascara := StringReplace(SemMascara, '(', '', [rfReplaceAll, rfIgnoreCase]);
  SemMascara := StringReplace(SemMascara, ')', '', [rfReplaceAll, rfIgnoreCase]);
  Result := Trim(SemMascara);
end;

function TfrmCadAncestral.ValidarDocumento(ADocumento: string;
  codDocumento: Integer): Boolean;
begin
  case codDocumento of
    0: Validador.TipoDocto := docCPF;
    1: Validador.TipoDocto := docCEP;
  end;
  Validador.Documento := removerMascaras(ADocumento);

  Result := Validador.Validar;
end;

end.
