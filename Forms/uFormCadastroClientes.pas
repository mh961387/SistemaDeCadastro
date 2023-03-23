unit uFormCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroAncestral, Data.DB,
  Vcl.ComCtrls, Vcl.Mask, Vcl.StdCtrls, System.Actions, Vcl.ActnList, ACBrBase,
  ACBrValidador, Vcl.AppEvnts, Vcl.Grids, Vcl.DBGrids, System.JSON, FireDAC.Comp.Client, REST.Client, IPPeerClient,
  uCliente, uDataClientes;

type
  TfrmCadClientes = class(TfrmCadAncestral)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtNome: TEdit;
    mskEdtCPF: TMaskEdit;
    mskEdtFone: TMaskEdit;
    dtpDtNascimento: TDateTimePicker;
    mskEdtCep: TMaskEdit;
    btnBuscaCep: TButton;
    edtLongradouro: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEstado: TEdit;
    edtComplemento: TEdit;
    actBuscarCep: TAction;
    cbSexo: TComboBox;
    Label11: TLabel;
    cbBuscar: TComboBox;
    procedure actEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskEdtCPFExit(Sender: TObject);
    procedure actBuscarCepExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridCadastroDblClick(Sender: TObject);
    procedure actBuscarExecute(Sender: TObject);
    procedure cbBuscarChange(Sender: TObject);
  private
    { Private declarations }
    FCliente : TCliente;
    procedure LimparDados; override;
    procedure BuscarCep(ACep: string);
    procedure PreencherCliente;
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

procedure TfrmCadClientes.actBuscarCepExecute(Sender: TObject);
begin
  inherited;
  if (not ValidarDocumento(mskEdtCep.Text, 1)) and
     (Trim(removerMascaras(mskEdtCep.Text)) <> EmptyStr) then
  begin
    MessageDlg('CEP informado esta invalido!', mtWarning, [mbOK], 0);
    mskEdtCep.Clear;
  end
  else
    BuscarCep(removerMascaras(mskEdtCep.Text));
end;

procedure TfrmCadClientes.actBuscarExecute(Sender: TObject);
begin
  inherited;
  case cbBuscar.ItemIndex of
    0:
    begin
      dmClientes.buscarClientes('CLI_NOME', mskEdtBuscar.Text);
    end;
    1:
    begin
      dmClientes.buscarClientes('CLI_CPF', mskEdtBuscar.Text);
    end;
    2:
    begin
      dmClientes.buscarClientes('CLI_FONE', mskEdtBuscar.Text);
    end;
    3:
    begin
      dmClientes.buscarClientes('CLI_CEP', mskEdtBuscar.Text);
    end;
  end;
end;

procedure TfrmCadClientes.actEditarExecute(Sender: TObject);
begin
  if FCliente.CPF <> mskEdtCPF.Text then
    if (removerMascaras(mskEdtCPF.Text) <> EmptyStr) and dmClientes.VerificarCPFCliente(mskEdtCPF.Text) then
      raise Exception.Create('O CPF informada ja pertence a um cliente!');

  PreencherCliente;
  dmClientes.InserirClientes(FCliente, 1);
  inherited;
end;

procedure TfrmCadClientes.actSalvarExecute(Sender: TObject);
begin
  if (removerMascaras(mskEdtCPF.Text) <> EmptyStr) and dmClientes.VerificarCPFCliente(removerMascaras(mskEdtCPF.Text)) then
    raise Exception.Create('O CPF informada ja pertence a um cliente!');

  PreencherCliente;
  dmClientes.InserirClientes(FCliente, 0);
  inherited;
end;

procedure TfrmCadClientes.BuscarCep(ACep: string);
var
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + ACep + '/json';
  RESTRequest1.Execute;
  data := RESTResponse1.JSONValue as TJSONObject;
  try
    if Assigned(data) then
    begin
        try
          edtLongradouro.Text := data.Values['logradouro'].Value;
        except
        on Exception do
            edtLongradouro.Clear;
        end;
        try
          edtBairro.Text := data.Values['bairro'].Value;
        except
        on Exception do
           edtBairro.Clear;
        end;
        try
          edtEstado.Text := data.Values['uf'].Value;
        except
        on Exception do
           edtEstado.Clear;
        end;
        try
          edtCidade.Text := data.Values['localidade'].Value;
        except
        on Exception do
           edtCidade.Clear;
        end;
        try
          edtComplemento.Text := data.Values['complemento'].Value;
        except
        on Exception do
           edtComplemento.Clear;
        end;
    end;
  finally
    FreeAndNil(data);
  end;
end;

procedure TfrmCadClientes.cbBuscarChange(Sender: TObject);
begin
  inherited;
  case cbBuscar.ItemIndex of
    0:
    begin
      mskEdtBuscar.EditMask := EmptyStr;
    end;
    1:
    begin
      mskEdtBuscar.EditMask := '999.999.999-99;0;_';
    end;
    2:
    begin
      mskEdtBuscar.EditMask := '(99)99999-9999;0;_';
    end;
    3:
    begin
      mskEdtBuscar.EditMask := '99999-999;0;_';
    end;
  end;
end;

procedure TfrmCadClientes.DBGridCadastroDblClick(Sender: TObject);
begin
  inherited;
  FCliente := dmClientes.RetornarCliente;
  edtNome.Text := FCliente.Nome;
  edtLongradouro.Text := FCliente.Longradouro;
  edtBairro.Text := FCliente.Bairro;
  edtCidade.Text := FCliente.Cidade;
  edtEstado.Text := FCliente.Estado;
  edtComplemento.Text := FCliente.Complemento;
  mskEdtCPF.Text := FCliente.CPF;
  mskEdtFone.Text := FCliente.Telefone;
  mskEdtCep.Text := FCliente.CEP;
  dtpDtNascimento.DateTime := FCliente.DataNascimento;

  if FCliente.Sexo = 'M' then
    cbSexo.ItemIndex := 0
  else
    cbSexo.ItemIndex := 1;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmClientes) then
    dmClientes := TdmClientes.Create(frmCadClientes);
end;

procedure TfrmCadClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dmClientes) then
    FreeAndNil(dmClientes);
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  inherited;
  LimparDados;
end;

procedure TfrmCadClientes.LimparDados;
begin
  inherited;
  ClicBotoes(0);
  if not Assigned(FCliente) then
    FreeAndNil(FCliente);
end;

procedure TfrmCadClientes.mskEdtCPFExit(Sender: TObject);
begin
  inherited;
  if (not ValidarDocumento(mskEdtCPF.Text, 0)) and
     (Trim(removerMascaras(mskEdtCPF.Text)) <> EmptyStr) then
  begin
    MessageDlg('CPF informado esta invalido!', mtWarning, [mbOK], 0);
    mskEdtCPF.SetFocus;
  end;
end;

procedure TfrmCadClientes.PreencherCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCliente.Create;

    FCliente.Nome           := edtNome.Text;
    FCliente.CPF            := mskEdtCPF.Text;
    FCliente.Telefone       := mskEdtFone.Text;
    FCliente.Sexo           := cbSexo.Text;
    FCliente.DataNascimento := dtpDtNascimento.Date;
    FCliente.CEP            := mskEdtCep.Text;
    FCliente.Longradouro    := edtLongradouro.Text;
    FCliente.Bairro         := edtBairro.Text;
    FCliente.Cidade         := edtCidade.Text;
    FCliente.Estado         := edtEstado.Text;
    FCliente.Complemento    := edtComplemento.Text;
end;

end.
