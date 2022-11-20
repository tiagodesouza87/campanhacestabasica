object DMDadosCampanha: TDMDadosCampanha
  OldCreateOrder = False
  Height = 183
  Width = 279
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=campanha'
      'User_Name=postgres'
      'Password=adm1997'
      'DriverID=PG')
    Connected = True
    Left = 96
    Top = 16
  end
  object FDPhDriver: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\10\bin\libpq.dll'
    Left = 32
    Top = 16
  end
  object FDQueryBanco: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM CampanhaDoacao')
    Left = 32
    Top = 64
  end
  object DSCampanhaDoacao: TDataSource
    DataSet = FDQueryBanco
    Left = 128
    Top = 64
  end
end
