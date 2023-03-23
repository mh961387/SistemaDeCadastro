unit uCliente;

interface

uses
  System.SysUtils;

type
  TCliente = class
    private
      FBairro: string;
      FDataNascimento: TDate;
      FCPF: string;
      FCEP: string;
      FNome: string;
      FCidade: string;
      FTelefone: string;
      FLongradouro: string;
      FEstado: string;
      FComplemento: string;
    FSexo: string;
      procedure SetBairro(const Value: string);
      procedure SetCEP(const Value: string);
      procedure SetCidade(const Value: string);
      procedure SetCPF(const Value: string);
      procedure SetDataNascimento(const Value: TDate);
      procedure SetNome(const Value: string);
      procedure SetTelefone(const Value: string);
      procedure SetLongradouro(const Value: string);
      procedure SetEstado(const Value: string);
      procedure SetComplemento(const Value: string);
    procedure SetSexo(const Value: string);
    public
      property Nome     :string read FNome write SetNome;
      property CPF      :string read FCPF write SetCPF;
      property Telefone :string read FTelefone write SetTelefone;
      property DataNascimento: TDate read FDataNascimento write SetDataNascimento;
      property Sexo: string read FSexo write SetSexo;
      //Endere�o
      property CEP      :string read FCEP write SetCEP;
      property Longradouro: string read FLongradouro write SetLongradouro;
      property Bairro   :string read FBairro write SetBairro;
      property Cidade   :string read FCidade write SetCidade;
      property Estado: string read FEstado write SetEstado;
      property Complemento: string read FComplemento write SetComplemento;
  end;

implementation

{ TCliente }

procedure TCliente.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TCliente.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TCliente.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TCliente.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TCliente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCliente.SetDataNascimento(const Value: TDate);
begin
  FDataNascimento := Value;
end;

procedure TCliente.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TCliente.SetLongradouro(const Value: string);
begin
  FLongradouro := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  if Value <> EmptyStr then
    FNome := Value
  else
    raise Exception.Create('Informe o nome do Cliente!');
end;

procedure TCliente.SetSexo(const Value: string);
begin
  FSexo := Value;
end;

procedure TCliente.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
