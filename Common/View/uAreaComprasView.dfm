inherited formComprasView: TformComprasView
  BorderStyle = bsNone
  ClientHeight = 480
  ClientWidth = 640
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitWidth = 640
  ExplicitHeight = 480
  TextHeight = 15
  object Tabs: TCardPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 408
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ActiveCard = tabBaseVigencia
    TabOrder = 0
    ExplicitTop = 49
    ExplicitHeight = 359
    object tabBaseVigencia: TCard
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 632
      Height = 400
      Caption = 'Base de Vigencia'
      CardIndex = 0
      TabOrder = 0
      ExplicitHeight = 351
      object dbGridProdutos: TDBGrid
        Left = 0
        Top = 0
        Width = 632
        Height = 400
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbGridProdutosDblClick
      end
    end
    object Carrinho: TCard
      Left = 1
      Top = 1
      Width = 638
      Height = 406
      Caption = 'Carrinho'
      CardIndex = 1
      TabOrder = 1
      ExplicitHeight = 357
      object dbGridCarrinho: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 553
        Height = 400
        Align = alClient
        DataSource = DataSource2
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 559
        Top = 0
        Width = 79
        Height = 406
        Align = alRight
        Caption = 'Panel2'
        TabOrder = 1
        ExplicitHeight = 357
        object speedLimpar: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 380
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
  inline frameMaster11: TframeSearch
    Left = 0
    Top = 0
    Width = 640
    Height = 408
    Align = alClient
    TabOrder = 2
    ExplicitTop = 8
    inherited pnlPesquisa: TPanel
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 640
      inherited ed: TEdit
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 155
        ExplicitTop = 4
        ExplicitWidth = 481
      end
      inherited cb: TComboBox
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 4
        ExplicitTop = 4
      end
    end
  end
  object DataSource1: TDataSource
    Left = 376
    Top = 424
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 265
    Top = 426
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
    Left = 320
    Top = 424
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 440
    Top = 424
  end
end
