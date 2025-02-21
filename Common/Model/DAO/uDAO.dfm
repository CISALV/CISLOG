object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 300
  Width = 321
  PixelsPerInch = 120
  object dsMunicipio: TDataSource
    Left = 56
    Top = 128
  end
  object dsUsuario: TDataSource
    Left = 216
    Top = 128
  end
  object queryUsuario: TFDQuery
    Left = 56
    Top = 48
  end
  object queryMunicipio: TFDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM MUNICIPIO'
      '')
    Left = 216
    Top = 48
  end
  object FDConnection1: TFDConnection
    Left = 136
    Top = 24
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = queryMunicipio
    Left = 144
    Top = 128
  end
end
