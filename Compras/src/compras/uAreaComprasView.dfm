inherited formComprasView: TformComprasView
  BorderStyle = bsNone
  ClientHeight = 480
  ClientWidth = 640
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inline SearchCompras1: TSearchCompras
    Left = 0
    Top = 0
    Width = 640
    Height = 49
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 640
    ExplicitHeight = 49
    inherited pnlFundo: TPanel
      Width = 640
      Align = alTop
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 640
      ExplicitHeight = 47
      inherited edPesquisa: TEdit
        Width = 580
        Height = 27
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 580
        ExplicitHeight = 22
      end
    end
  end
  object Tabs: TCardPanel
    Left = 0
    Top = 49
    Width = 640
    Height = 359
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ActiveCard = tabBaseVigencia
    TabOrder = 1
    object tabBaseVigencia: TCard
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 632
      Height = 351
      Caption = 'Base de Vigencia'
      CardIndex = 0
      TabOrder = 0
      object dbGridProdutos: TDBGrid
        Left = 0
        Top = 0
        Width = 632
        Height = 351
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object Carrinho: TCard
      Left = 1
      Top = 1
      Width = 638
      Height = 357
      Caption = 'Carrinho'
      CardIndex = 1
      TabOrder = 1
      object dbGridCarrinho: TDBGrid
        Left = 0
        Top = 0
        Width = 638
        Height = 357
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
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
    TabOrder = 2
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 185
      Height = 64
      Align = alLeft
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
  end
  object DataSource1: TDataSource
    Left = 584
    Top = 424
  end
  object DataSource2: TDataSource
    Left = 504
    Top = 424
  end
end
