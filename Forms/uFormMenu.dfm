inherited frmMenu: TfrmMenu
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsNone
  Caption = 'u'
  ClientHeight = 544
  ClientWidth = 447
  Position = poMainFormCenter
  ExplicitWidth = 447
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  object btnClientes: TButton [0]
    Left = 111
    Top = 40
    Width = 266
    Height = 89
    Cursor = crHandPoint
    Action = actCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnUsuarios: TButton [1]
    Left = 111
    Top = 212
    Width = 266
    Height = 89
    Cursor = crHandPoint
    Action = actUsuarios
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnFechar: TButton [2]
    Left = 111
    Top = 384
    Width = 266
    Height = 89
    Cursor = crHandPoint
    Action = actFechar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  inherited Eventos: TApplicationEvents
    Left = 24
    Top = 16
  end
  inherited acao: TActionList
    Left = 24
    Top = 152
    object actCliente: TAction
      Caption = 'Cadastro de Clientes'
      OnExecute = actClienteExecute
    end
    object actUsuarios: TAction
      Caption = 'Cadastro de Usu'#225'rios'
      OnExecute = actUsuariosExecute
    end
    object actFechar: TAction
      Caption = 'Fechar Sistemas'
      OnExecute = actFecharExecute
    end
  end
end
