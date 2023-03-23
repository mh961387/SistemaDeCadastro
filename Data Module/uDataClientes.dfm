object dmClientes: TdmClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 307
  Width = 317
  object qryClientes: TFDQuery
    Connection = dmPrincipal.FDConnection
    SQL.Strings = (
      'select * from clientes'
      '!WHERE')
    Left = 144
    Top = 136
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qryClientesCLI_ID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLI_ID'
      Origin = 'CLI_ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryClientesCLI_NOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'CLI_NOME'
      Origin = 'CLI_NOME'
      Required = True
      Size = 50
    end
    object qryClientesCLI_CPF: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CLI_CPF'
      Origin = 'CLI_CPF'
      Required = True
      Size = 15
    end
    object qryClientesCLI_FONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLI_FONE'
      Origin = 'CLI_FONE'
      Required = True
      Size = 15
    end
    object qryClientesCLI_DTNASC: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'CLI_DTNASC'
      Origin = 'CLI_DTNASC'
      Required = True
    end
    object qryClientesCLI_CEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CLI_CEP'
      Origin = 'CLI_CEP'
      Required = True
      Size = 10
    end
    object qryClientesCLI_LONGRADOURO: TStringField
      DisplayLabel = 'Longradouro'
      FieldName = 'CLI_LONGRADOURO'
      Origin = 'CLI_LONGRADOURO'
      Required = True
      Size = 100
    end
    object qryClientesCLI_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CLI_BAIRRO'
      Origin = 'CLI_BAIRRO'
      Required = True
      Size = 30
    end
    object qryClientesCLI_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CLI_CIDADE'
      Origin = 'CLI_CIDADE'
      Required = True
      Size = 30
    end
    object qryClientesCLI_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'CLI_ESTADO'
      Origin = 'CLI_ESTADO'
      Required = True
      Size = 30
    end
    object qryClientesCLI_COMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'CLI_COMPLEMENTO'
      Origin = 'CLI_COMPLEMENTO'
      Required = True
      Size = 50
    end
    object qryClientesCLI_SEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'CLI_SEXO'
      Origin = 'CLI_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 224
    Top = 88
  end
  object qryVerificacaoCPFCliente: TFDQuery
    Connection = dmPrincipal.FDConnection
    SQL.Strings = (
      'select * from CLIENTES'
      'where CLI_CPF = :CPF')
    Left = 144
    Top = 40
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
