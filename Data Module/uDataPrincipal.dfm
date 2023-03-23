object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 247
  Width = 286
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 168
    Top = 48
  end
  object fdphysmysqldrvrlnk: TFDPhysMySQLDriverLink
    Left = 56
    Top = 24
  end
end
