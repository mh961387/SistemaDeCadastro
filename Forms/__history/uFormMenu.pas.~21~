unit uFormMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormAncestral, Vcl.AppEvnts, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls;

type
  TfrmMenu = class(TfrmAncestral)
    btnClientes: TButton;
    btnUsuarios: TButton;
    btnFechar: TButton;
    actCliente: TAction;
    actUsuarios: TAction;
    actFechar: TAction;
    procedure actClienteExecute(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses
   uFormCadastroClientes, uFormCadastroUsuarios;

{$R *.dfm}

procedure TfrmMenu.actClienteExecute(Sender: TObject);
begin
  inherited;
  try
    if not Assigned(frmCadClientes) then
      frmCadClientes := Tfrmcadclientes.Create(frmMenu);
    frmCadClientes.ShowModal;
  finally
    FreeAndNil(frmCadClientes);
  end;
end;

procedure TfrmMenu.actFecharExecute(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmMenu.actUsuariosExecute(Sender: TObject);
begin
  inherited;
  try
    if not Assigned(frmCadUsuario) then
      frmCadUsuario := TfrmCadUsuario.Create(frmMenu);
    frmCadUsuario.ShowModal;
  finally
    FreeAndNil(frmCadUsuario);
  end;
end;

end.
