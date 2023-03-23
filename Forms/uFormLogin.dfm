inherited frmLogin: TfrmLogin
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 421
  ClientWidth = 411
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 417
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 164
    Top = 80
    Width = 87
    Height = 45
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtLogin: TEdit [1]
    Left = 109
    Top = 167
    Width = 193
    Height = 33
    Cursor = crIBeam
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtSenha: TEdit [2]
    Left = 109
    Top = 215
    Width = 193
    Height = 33
    Cursor = crIBeam
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnAcesso: TButton [3]
    Left = 150
    Top = 270
    Width = 115
    Height = 43
    Cursor = crHandPoint
    Caption = 'Acessar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAcessoClick
  end
end
