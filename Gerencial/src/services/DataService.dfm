object moduleDatabase: TmoduleDatabase
  Height = 222
  Width = 242
  PixelsPerInch = 120
  object cDatabase: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\database\CISALV-3-2-1.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 64
  end
end
