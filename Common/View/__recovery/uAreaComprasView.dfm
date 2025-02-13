inherited formComprasView: TformComprasView
  BorderStyle = bsNone
  ClientHeight = 480
  ClientWidth = 640
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
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
    ActiveCard = tabCarrinho
    TabOrder = 0
    object tabCompra: TCard
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 632
      Height = 360
      Caption = 'Base de Vigencia'
      CardIndex = 0
      TabOrder = 0
      object dbGridProdutos: TDBGrid
        Left = 0
        Top = 0
        Width = 632
        Height = 360
        Align = alClient
        DataSource = dsBDV
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
        OnDblClick = dbGridProdutosDblClick
      end
    end
    object tabCarrinho: TCard
      Left = 1
      Top = 1
      Width = 638
      Height = 366
      Caption = 'tabCarrinho'
      CardIndex = 1
      TabOrder = 1
      object dbGridCarrinho: TDBGrid
        AlignWithMargins = True
        Left = 140
        Top = 3
        Width = 495
        Height = 360
        Align = alClient
        DataSource = dsCarrinho
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 137
        Height = 366
        Align = alLeft
        Caption = 'Panel2'
        TabOrder = 1
        object speedVoltar: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 129
          Height = 22
          Align = alTop
          Caption = 'Voltar'
          OnClick = speedVoltarClick
          ExplicitLeft = 19
          ExplicitTop = 3
        end
        object speedRemoveItem: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 32
          Width = 129
          Height = 21
          Align = alTop
          Caption = 'Remover Item'
          ExplicitTop = 4
          ExplicitWidth = 56
        end
        object SpeedButton1: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 59
          Width = 129
          Height = 22
          Align = alTop
          Caption = 'Limpar'
          ExplicitLeft = -12
          ExplicitTop = 76
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
    ExplicitLeft = 8
    ExplicitTop = 416
    object speedCarrinho: TSpeedButton
      Left = 188
      Top = 1
      Width = 79
      Height = 70
      Align = alLeft
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
      DataSource = dsBDV
      TabOrder = 0
    end
  end
  inline SearchBar: TframeSearch
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
        OnChange = SearchBaredSearchChange
      end
      inherited cbFilter: TComboBox
        Visible = False
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
  object dsBDV: TDataSource
    Left = 456
    Top = 424
  end
  object memCarrinho: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 369
    Top = 418
    object memCarrinhoId: TIntegerField
      FieldName = 'Id'
    end
    object memCarrinhoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object dsCarrinho: TDataSource
    DataSet = memCarrinho
    Left = 312
    Top = 424
  end
end
