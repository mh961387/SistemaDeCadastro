object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 262
  Width = 283
  object qryUsuarios: TFDQuery
    Connection = dmPrincipal.FDConnection
    SQL.Strings = (
      'Select * from USUARIOS'
      '!WHERE')
    Left = 224
    Top = 24
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qryUsuariosUSU_ID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USU_ID'
      Origin = 'USU_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUsuariosUSU_LOGIN: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USU_LOGIN'
      Origin = 'USU_LOGIN'
      Required = True
      Size = 30
    end
    object qryUsuariosUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
      Origin = 'USU_SENHA'
      Required = True
      Size = 30
    end
    object qryUsuariosUSU_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'USU_STATUS'
      Origin = 'USU_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 208
    Top = 88
  end
  object qryValidaLogin: TFDQuery
    Connection = dmPrincipal.FDConnection
    SQL.Strings = (
      'select * from USUARIOS'
      
        'where USU_LOGIN = :LOGIN and USU_SENHA = :SENHA and USU_STATUS =' +
        ' '#39'S'#39)
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryVerificarSenhaUsuario: TFDQuery
    Connection = dmPrincipal.FDConnection
    SQL.Strings = (
      'select * from USUARIOS'
      'where USU_SENHA = :SENHA')
    Left = 56
    Top = 72
    ParamData = <
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
