unit uUsuario;

interface

uses
  System.SysUtils;

type
  TUsuario = class
  private
    FSenha: string;
    FLogin: string;
    Fid: Integer;
    Fstatus: string;
    procedure SetLogin(const Value: string);
    procedure SetSenha(const Value: string);
    procedure Setid(const Value: Integer);
    procedure Setstatus(const Value: string);

  public
    property id: Integer read Fid write Setid;
    property Login: string read FLogin write SetLogin;
    property Senha: string read FSenha write SetSenha;
    property status: string read Fstatus write Setstatus;
  end;

implementation

{ TUsuario }

procedure TUsuario.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TUsuario.SetLogin(const Value: string);
begin
  if Value <> EmptyStr then
    FLogin := Value
  else
    raise Exception.Create('Informe o login do usu�rio!');
end;

procedure TUsuario.SetSenha(const Value: string);
begin
  if Value <> EmptyStr then
    FSenha := Value
  else
    raise Exception.Create('Informe a senha do usu�rio!');
end;

procedure TUsuario.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.
