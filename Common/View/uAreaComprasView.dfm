inherited formComprasView: TformComprasView
  BorderStyle = bsNone
  ClientHeight = 480
  ClientWidth = 640
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitLeft = 2
  ExplicitTop = 2
  TextHeight = 18
  object Tabs: TCardPanel
    Left = 0
    Top = 40
    Width = 640
    Height = 368
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ActiveCard = tabBaseVigencia
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 408
    object tabBaseVigencia: TCard
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 632
      Height = 360
      Caption = 'Base de Vigencia'
      CardIndex = 0
      TabOrder = 0
      ExplicitHeight = 400
      object dbGridProdutos: TDBGrid
        Left = 0
        Top = 0
        Width = 632
        Height = 360
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
        OnDblClick = dbGridProdutosDblClick
      end
    end
    object Carrinho: TCard
      Left = 1
      Top = 1
      Width = 638
      Height = 366
      Caption = 'Carrinho'
      CardIndex = 1
      TabOrder = 1
      ExplicitHeight = 406
      object dbGridCarrinho: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 553
        Height = 360
        Align = alClient
        DataSource = DataSource2
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 559
        Top = 0
        Width = 79
        Height = 366
        Align = alRight
        Caption = 'Panel2'
        TabOrder = 1
        ExplicitHeight = 406
        object speedLimpar: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 340
          Width = 71
          Height = 22
          Align = alBottom
          Caption = 'Limpar'
          ExplicitLeft = -12
          ExplicitTop = 76
          ExplicitWidth = 56
        end
        object speedRemoveItem: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 71
          Height = 21
          Align = alTop
          Caption = 'Remover Item'
          ExplicitWidth = 56
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 640
    Height = 72
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
    object speedCarrinho: TSpeedButton
      Left = 560
      Top = 1
      Width = 79
      Height = 70
      Align = alRight
      Caption = 'Carrinho'
      OnClick = speedCarrinhoClick
      ExplicitLeft = 464
      ExplicitTop = 8
    end
    object DBMemo1: TDBMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 181
      Height = 64
      Align = alLeft
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  inline frameSearch1: TframeSearch
    Left = 0
    Top = 0
    Width = 640
    Height = 40
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitHeight = 40
    inherited pnlSearch: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited edSearch: TEdit
        StyleElements = [seFont, seClient, seBorder]
        OnChange = frameSearch1edSearchChange
      end
      inherited cbFilter: TComboBox
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
  object DataSource1: TDataSource
    Left = 352
    Top = 416
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 249
    Top = 418
    object FDMemTable1Id: TIntegerField
      FieldName = 'Id'
    end
    object FDMemTable1Nome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable1
    Left = 224
    Top = 424
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 400
    Top = 416
  end
end
