object DM: TDM
  Height = 480
  Width = 640
  object conexao: TFDConnection
    Params.Strings = (
      'Database=agendabancodedados'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 72
  end
  object sqlConsulta: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'SELECT *'
      'FROM  clientes;')
    Left = 248
    Top = 72
    ParamData = <
      item
        Name = 'pConsulta'
        ParamType = ptInput
      end>
  end
  object dsSqlConsulta: TDataSource
    DataSet = sqlConsulta
    Left = 376
    Top = 56
  end
end
