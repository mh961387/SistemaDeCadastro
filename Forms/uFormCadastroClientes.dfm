inherited frmCadClientes: TfrmCadClientes
  Caption = 'Clientes'
  ClientHeight = 589
  ClientWidth = 665
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 671
  ExplicitHeight = 618
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 86
    Width = 42
    Height = 19
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 250
    Top = 86
    Width = 27
    Height = 19
    Caption = 'CPF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 417
    Top = 86
    Width = 61
    Height = 19
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 144
    Width = 119
    Height = 19
    Caption = 'Data Nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [4]
    Left = 164
    Top = 144
    Width = 27
    Height = 19
    Caption = 'Cep'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [5]
    Left = 366
    Top = 144
    Width = 91
    Height = 19
    Caption = 'Longradouro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel [6]
    Left = 8
    Top = 201
    Width = 42
    Height = 19
    Caption = 'Bairro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel [7]
    Left = 164
    Top = 201
    Width = 48
    Height = 19
    Caption = 'Cidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel [8]
    Left = 303
    Top = 201
    Width = 47
    Height = 19
    Caption = 'Estado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel [9]
    Left = 432
    Top = 201
    Width = 99
    Height = 19
    Caption = 'Complemento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel [10]
    Left = 584
    Top = 86
    Width = 34
    Height = 19
    Caption = 'Sexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited btnInserir: TButton
    Top = 539
    Font.Height = -16
    TabOrder = 11
    ExplicitTop = 539
  end
  inherited btnEditar: TButton
    Left = 106
    Top = 539
    Font.Height = -16
    TabOrder = 12
    ExplicitLeft = 106
    ExplicitTop = 539
  end
  inherited btnCancelar: TButton
    Left = 214
    Top = 539
    Font.Height = -16
    TabOrder = 13
    ExplicitLeft = 214
    ExplicitTop = 539
  end
  inherited btnSalvar: TButton
    Left = 582
    Top = 539
    Font.Height = -16
    TabOrder = 15
    ExplicitLeft = 582
    ExplicitTop = 539
  end
  inherited DBGridCadastro: TDBGrid
    Top = 268
    Width = 649
    DataSource = dmClientes.dsClientes
    TabOrder = 14
    Columns = <
      item
        Expanded = False
        FieldName = 'CLI_ID'
        ImeName = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_NOME'
        ImeName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_SEXO'
        ImeName = 'Sexo'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_CPF'
        ImeName = 'CPF'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_DTNASC'
        ImeName = 'Data Nascimento'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_FONE'
        ImeName = 'Telefone'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_CEP'
        ImeName = 'Cep'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_LONGRADOURO'
        ImeName = 'Longradouro'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_CIDADE'
        ImeName = 'Cidade'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_ESTADO'
        ImeName = 'Estado'
        Width = 64
        Visible = True
      end>
  end
  inherited btnDeletar: TButton
    Left = 309
    Top = 539
    Font.Height = -16
    TabOrder = 16
    ExplicitLeft = 309
    ExplicitTop = 539
  end
  inherited btnBuscar: TButton
    Left = 582
    Height = 27
    Font.Height = -16
    TabOrder = 17
    ExplicitLeft = 582
    ExplicitHeight = 27
  end
  object edtNome: TEdit [18]
    Left = 8
    Top = 111
    Width = 217
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object mskEdtCPF: TMaskEdit [19]
    Left = 250
    Top = 111
    Width = 120
    Height = 27
    EditMask = '999.999.999-99;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 1
    Text = ''
    OnExit = mskEdtCPFExit
  end
  object mskEdtFone: TMaskEdit [20]
    Left = 417
    Top = 111
    Width = 125
    Height = 27
    EditMask = '(99)99999-9999;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 2
    Text = ''
  end
  object dtpDtNascimento: TDateTimePicker [21]
    Left = 8
    Top = 166
    Width = 115
    Height = 27
    Date = 45005.974951655100000000
    Time = 45005.974951655100000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object mskEdtCep: TMaskEdit [22]
    Left = 164
    Top = 166
    Width = 94
    Height = 27
    EditMask = '99999-999;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    TabOrder = 5
    Text = ''
  end
  object btnBuscaCep: TButton [23]
    Left = 266
    Top = 166
    Width = 50
    Height = 29
    Action = actBuscarCep
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    TabStop = False
  end
  object edtLongradouro: TEdit [24]
    Left = 366
    Top = 166
    Width = 291
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object edtBairro: TEdit [25]
    Left = 8
    Top = 223
    Width = 142
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object edtCidade: TEdit [26]
    Left = 164
    Top = 223
    Width = 126
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object edtEstado: TEdit [27]
    Left = 303
    Top = 223
    Width = 115
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object edtComplemento: TEdit [28]
    Left = 432
    Top = 223
    Width = 225
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object cbSexo: TComboBox [29]
    Left = 582
    Top = 111
    Width = 73
    Height = 27
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = 'M'
    Items.Strings = (
      'M'
      'F')
  end
  object cbBuscar: TComboBox [30]
    Left = 303
    Top = 8
    Width = 76
    Height = 27
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 19
    Text = 'Nome'
    OnChange = cbBuscarChange
    Items.Strings = (
      'Nome'
      'CPF'
      'Fone'
      'Cep')
  end
  inherited mskEdtBuscar: TMaskEdit
    Left = 385
    Height = 27
    Font.Height = -16
    ParentFont = False
    TabOrder = 20
    ExplicitLeft = 385
    ExplicitHeight = 27
  end
  inherited Eventos: TApplicationEvents
    Left = 8
    Top = 0
  end
  inherited Validador: TACBrValidador
    Left = 56
    Top = 65535
  end
  inherited acao: TActionList
    Left = 96
    Top = 0
    object actBuscarCep: TAction
      Caption = 'Buscar'
      OnExecute = actBuscarCepExecute
    end
  end
end
