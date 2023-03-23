unit uFormCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroAncestral, Data.DB,
  System.Actions, Vcl.ActnList, ACBrBase, ACBrValidador, Vcl.AppEvnts,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, uUsuario, uDataUsuarios, Vcl.Mask;

type
  TfrmCadUsuario = class(TfrmCadAncestral)
    Label1: TLabel;
    edtCadLogin: TEdit;
    Label2: TLabel;
    edtCadSenha: TEdit;
    lblCadRepSenha: TLabel;
    edtCadRepSenha: TEdit;
    cbStatus: TComboBox;
    Label3: TLabel;
    procedure edtCadSenhaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure DBGridCadastroDblClick(Sender: TObject);
    procedure actBuscarExecute(Sender: TObject);
  private
    { Private declarations }
    FUsuario: TUsuario;
    procedure LimparDados; override;
    procedure PreencherUsuario;
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

procedure TfrmCadUsuario.actBuscarExecute(Sender: TObject);
begin
  inherited;
  dmUsuarios.BuscarUsurio(Trim(mskEdtBuscar.Text));
end;

procedure TfrmCadUsuario.actEditarExecute(Sender: TObject);
begin
  if FUsuario.Senha <> edtCadSenha.Text then
    if dmUsuarios.VerificarSenhaExiste(edtCadSenha.Text) then
      raise Exception.Create('A senha informada ja pertence a um usu�rio!');

  PreencherUsuario;
  dmUsuarios.InserirUsuarios(FUsuario, 1);
  inherited;
end;

procedure TfrmCadUsuario.actSalvarExecute(Sender: TObject);
begin
  PreencherUsuario;

  if dmUsuarios.VerificarSenhaExiste(FUsuario.Senha) then
    raise Exception.Create('A senha informada ja pertence a um usu�rio!');

  dmUsuarios.InserirUsuarios(FUsuario);
  inherited;
end;

procedure TfrmCadUsuario.DBGridCadastroDblClick(Sender: TObject);
begin
  inherited;
  FUsuario := dmUsuarios.RetornarUsuario;
  edtCadLogin.Text := FUsuario.Login;
  edtCadSenha.Text := FUsuario.Senha;
  edtCadRepSenha.Text := FUsuario.Senha;

  if FUsuario.status = 'S' then
    cbStatus.ItemIndex := 0
  else
    cbStatus.ItemIndex := 1;
end;

procedure TfrmCadUsuario.edtCadSenhaChange(Sender: TObject);
begin
  inherited;
  if edtCadSenha.Text <> EmptyStr then
  begin
    edtCadRepSenha.Visible := true;
    lblCadRepSenha.Visible := True;
  end
  else
  begin
    edtCadRepSenha.Visible := false;
    lblCadRepSenha.Visible := false;
  end;
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmUsuarios) then
    dmUsuarios := TdmUsuarios.Create(frmCadUsuario);
end;

procedure TfrmCadUsuario.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dmUsuarios) then
    FreeAndNil(dmUsuarios);
end;

procedure TfrmCadUsuario.LimparDados;
begin
  inherited;
  ClicBotoes(0);
  if Assigned(FUsuario) then
    FreeAndNil(FUsuario);
end;

procedure TfrmCadUsuario.PreencherUsuario;
begin
  if not Assigned(FUsuario) then
    FUsuario := TUsuario.Create;

  FUsuario.Login := edtCadLogin.Text;
  FUsuario.status := cbStatus.Text;
  if edtCadSenha.Text = edtCadRepSenha.Text then
    FUsuario.Senha := edtCadSenha.Text
  else
  begin
    raise Exception.Create('As senhas informadas n�o conferem!');
  end;
end;

end.
