object dm: Tdm
  OldCreateOrder = False
  Height = 411
  Width = 551
  object conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\maryd\OneDrive\'#193'rea de Trabalho\ETEC\App_Curly' +
        ' - Mary Duarte\curlybanco.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = conexaoBeforeConnect
    Left = 16
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 80
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 16
    Top = 72
  end
  object sql_userread: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM user')
    Left = 16
    Top = 144
    object sql_userreaduser_id: TIntegerField
      FieldName = 'user_id'
      Origin = 'user_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sql_userreaduser_login: TStringField
      FieldName = 'user_login'
      Origin = 'user_login'
      Size = 15
    end
    object sql_userreaduser_senha: TStringField
      FieldName = 'user_senha'
      Origin = 'user_senha'
      Size = 15
    end
  end
  object sql_caduser: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'INSERT INTO user VALUES (:cod, '#39':user'#39', '#39':senha'#39')')
    Left = 16
    Top = 192
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object sql_cidade: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'INSERT INTO cidade VALUES (:pcod, :pnome, :puf)')
    Left = 288
    Top = 312
    ParamData = <
      item
        Name = 'PCOD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PNOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PUF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object sql_cidread: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM cidade')
    Left = 192
    Top = 304
  end
end
