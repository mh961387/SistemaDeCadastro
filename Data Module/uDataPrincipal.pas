unit uDataPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  System.IniFiles, Vcl.Dialogs, Vcl.Forms;

type
  TdmPrincipal = class(TDataModule)
    FDConnection: TFDConnection;
    fdphysmysqldrvrlnk: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LerConfigBanco;
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPrincipal }

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  LerConfigBanco;
end;

procedure TdmPrincipal.LerConfigBanco;
var
  arquivoIni: TIniFile;
begin
  try
    if not FileExists(GetCurrentDir + '\ConfigBanco.ini') then
    begin
      arquivoIni := TIniFile.Create(GetCurrentDir + '\ConfigBanco.ini');
      ArquivoINI.WriteString('CONFIGURACOES','SERVER','');
      ArquivoINI.WriteString('CONFIGURACOES','DATABASE','');
      ArquivoINI.WriteString('CONFIGURACOES','USERNAME','');
      ArquivoINI.WriteString('CONFIGURACOES','PASSWORD','');
      ArquivoINI.WriteString('CONFIGURACOES','PORT','');
      ArquivoINI.WriteString('CONFIGURACOES','DLL','');
      ArquivoINI.Free;
    end;

    arquivoIni := TIniFile.Create(GetCurrentDir + '\ConfigBanco.ini');
    with FDConnection do
    begin
      Params.Clear;
      Params.Values['DriverID']    := 'MySQL';
      Params.Values['Server']      := arquivoIni.ReadString('CONFIGURACOES', 'SERVER', Params.Values['Server']);
      Params.Values['Database']    := arquivoIni.ReadString('CONFIGURACOES', 'DATABASE', Params.Values['Database']);
      Params.Values['User_name']   := arquivoIni.ReadString('CONFIGURACOES', 'USERNAME', Params.Values['User_name']);
      Params.Values['Password']    := arquivoIni.ReadString('CONFIGURACOES', 'PASSWORD', Params.Values['Password']);
      Params.Values['Port']        := arquivoIni.ReadString('CONFIGURACOES', 'PORT', Params.Values['Port']);
      fdphysmysqldrvrlnk.VendorLib := arquivoIni.ReadString('CONFIGURACOES', 'DLL', fdphysmysqldrvrlnk.VendorLib);
      Connected := True;
    end;
  except on E: Exception do
    begin
      MessageDlg('Ocorreu uma Falha na configuração do Banco de dados!' + sLineBreak +
                 'verifique o arquivo: '+ arquivoIni.FileName + sLineBreak + sLineBreak +
                 'Erro original: '+ E.Message, mtError, [mbOK], 0);
      Application.Terminate;
    end;
  end;
end;

end.
