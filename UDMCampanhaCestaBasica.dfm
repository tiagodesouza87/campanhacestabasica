object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=campanhacestabasica'
      'User_Name=root'
      'Password=adm@1997**'
      'DriverID=MySQL')
    Left = 96
    Top = 16
  end
  object FDDbDriver: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 8.0\lib\libmysql.dll'
    Left = 24
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 32
    Top = 72
  end
end
