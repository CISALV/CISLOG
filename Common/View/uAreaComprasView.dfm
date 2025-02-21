inherited formComprasView: TformComprasView
  BorderStyle = bsNone
  ClientHeight = 631
  ClientWidth = 640
  StyleElements = [seFont, seClient, seBorder]
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 640
  ExplicitHeight = 631
  TextHeight = 18
  object Splitter1: TSplitter
    Left = 0
    Top = 294
    Width = 640
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    Color = clHighlight
    ParentColor = False
    ExplicitLeft = -1
    ExplicitTop = 299
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 559
    Width = 640
    Height = 72
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 561
    object memoDescricao: TDBMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 261
      Height = 64
      Align = alLeft
      DataField = 'APRESENTACAO'
      DataSource = dsBaseVigencia
      TabOrder = 0
    end
    object pnlTotal: TPanel
      AlignWithMargins = True
      Left = 271
      Top = 4
      Width = 141
      Height = 64
      Align = alLeft
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 188
      ExplicitTop = 1
      ExplicitHeight = 70
      object Label2: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 62
        Height = 56
        Align = alLeft
        Alignment = taCenter
        Caption = 'Total: R$'
        ExplicitHeight = 18
      end
      object lblTotalValue: TLabel
        AlignWithMargins = True
        Left = 72
        Top = 4
        Width = 83
        Height = 56
        Align = alLeft
        Caption = '0.00'
        ExplicitLeft = 553
        ExplicitTop = 2
        ExplicitHeight = 64
      end
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
    TabOrder = 1
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
  object pnlCart: TPanel
    Left = 0
    Top = 298
    Width = 640
    Height = 261
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 40
    ExplicitTop = 300
    object pnlCartOptions: TPanel
      Left = 1
      Top = 42
      Width = 120
      Height = 218
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 10
      ExplicitTop = 41
      object speedVoltar: TSpeedButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 112
        Height = 22
        Align = alTop
        Caption = 'Voltar'
        Visible = False
        OnClick = speedVoltarClick
        ExplicitLeft = 19
        ExplicitTop = 3
        ExplicitWidth = 129
      end
      object speedRemoverItem: TSpeedButton
        AlignWithMargins = True
        Left = 4
        Top = 32
        Width = 112
        Height = 21
        Align = alTop
        Caption = 'Remover Item'
        OnClick = speedRemoverItemClick
        ExplicitTop = 4
        ExplicitWidth = 56
      end
      object speedLimpar: TSpeedButton
        AlignWithMargins = True
        Left = 4
        Top = 59
        Width = 112
        Height = 22
        Align = alTop
        Caption = 'Limpar'
        OnClick = speedLimparClick
        ExplicitLeft = -12
        ExplicitTop = 76
        ExplicitWidth = 56
      end
    end
    object dbGridCarrinho: TDBGrid
      AlignWithMargins = True
      Left = 124
      Top = 45
      Width = 465
      Height = 212
      Margins.Right = 50
      Align = alClient
      DataSource = dsCarrinho
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
    end
    object pnlTopCart: TPanel
      Left = 1
      Top = 1
      Width = 638
      Height = 41
      Align = alTop
      Caption = 'Carrinho'
      TabOrder = 2
      ExplicitLeft = 123
      ExplicitWidth = 516
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 640
    Height = 254
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 3
    ExplicitHeight = 252
    object dbGridProdutos: TDBGrid
      Left = 1
      Top = 1
      Width = 638
      Height = 252
      Align = alClient
      DataSource = dsBaseVigencia
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      OnDblClick = dbGridProdutosDblClick
    end
  end
  object dsBaseVigencia: TDataSource
    Left = 520
    Top = 568
  end
  object memCart: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 473
    Top = 570
    object memCartquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object memCartApresentacao: TStringField
      FieldName = 'Apresentacao'
    end
    object memCartValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object dsCarrinho: TDataSource
    DataSet = memCart
    Left = 424
    Top = 568
  end
end
