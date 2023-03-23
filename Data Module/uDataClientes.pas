unit uDataClientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataPrincipal, uCliente;

type
  TdmClientes = class(TDataModule)
    qryClientes: TFDQuery;
    qryClientesCLI_ID: TFDAutoIncField;
    qryClientesCLI_NOME: TStringField;
    qryClientesCLI_CPF: TStringField;
    qryClientesCLI_FONE: TStringField;
    qryClientesCLI_DTNASC: TDateField;
    qryClientesCLI_CEP: TStringField;
    qryClientesCLI_LONGRADOURO: TStringField;
    qryClientesCLI_BAIRRO: TStringField;
    qryClientesCLI_CIDADE: TStringField;
    qryClientesCLI_ESTADO: TStringField;
    qryClientesCLI_COMPLEMENTO: TStringField;
    qryClientesCLI_SEXO: TStringField;
    dsClientes: TDataSource;
    qryVerificacaoCPFCliente: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function VerificarCPFCliente(ACPF: string): Boolean;
    procedure InserirClientes(ACliente: TCliente; Oper: integer);
    function RetornarCliente: TCliente;
    procedure buscarClientes(ACampo, AValor: string);
  end;

var
  dmClientes: TdmClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmClientes.buscarClientes(ACampo, AValor: string);
begin
  if AValor <> EmptyStr then
  begin
    qryClientes.Close;
    qryClientes.MacroByName('WHERE').AsRaw := ' WHERE '+ACampo+' LIKE ' +  QuotedStr(AValor+'%');
    qryClientes.Open();
  end
  else
  begin
    qryClientes.Close;
    qryClientes.MacroByName('WHERE').AsRaw := EmptyStr;
    qryClientes.Open();
  end;
end;

procedure TdmClientes.DataModuleCreate(Sender: TObject);
begin
  qryClientes.Open();
end;

procedure TdmClientes.InserirClientes(ACliente: TCliente; Oper: integer);
begin
  if oper = 0 then
    qryClientes.Insert
  else if Oper = 1 then
    qryClientes.Edit;

  qryClientesCLI_NOME.AsString        := ACliente.Nome;
  qryClientesCLI_CPF.AsString         := ACliente.CPF;
  qryClientesCLI_FONE.AsString        := ACliente.Telefone;
  qryClientesCLI_DTNASC.AsDateTime    := ACliente.DataNascimento;
  qryClientesCLI_CEP.AsString         := ACliente.CEP;
  qryClientesCLI_LONGRADOURO.AsString := ACliente.Longradouro;
  qryClientesCLI_BAIRRO.AsString      := ACliente.Bairro;
  qryClientesCLI_CIDADE.AsString      := ACliente.Cidade;
  qryClientesCLI_ESTADO.AsString      := ACliente.Estado;
  qryClientesCLI_COMPLEMENTO.AsString := ACliente.Complemento;
  qryClientesCLI_SEXO.AsString        := ACliente.Sexo;
  qryClientes.Post;
  qryClientes.Refresh;
end;

function TdmClientes.RetornarCliente: TCliente;
begin
  Result := TCliente.Create;
  Result.Nome           := qryClientesCLI_NOME.AsString;
  Result.CPF            := qryClientesCLI_CPF.AsString;
  Result.Telefone       := qryClientesCLI_FONE.AsString;
  Result.DataNascimento := qryClientesCLI_DTNASC.AsDateTime;
  Result.Sexo           := qryClientesCLI_SEXO.AsString;
  Result.CEP            := qryClientesCLI_CEP.AsString;
  Result.Longradouro    := qryClientesCLI_LONGRADOURO.AsString;
  Result.Bairro         := qryClientesCLI_BAIRRO.AsString;
  Result.Cidade         := qryClientesCLI_CIDADE.AsString;
  Result.Estado         := qryClientesCLI_ESTADO.AsString;
  Result.Complemento    := qryClientesCLI_COMPLEMENTO.AsString;
end;

function TdmClientes.VerificarCPFCliente(ACPF: string): Boolean;
begin
  qryVerificacaoCPFCliente.Close;
  qryVerificacaoCPFCliente.ParamByName('CPF').AsString := ACPF;
  qryVerificacaoCPFCliente.Open();

  Result := qryVerificacaoCPFCliente.RecordCount > 0;
end;

end.
