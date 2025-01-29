inherited formComprasView: TformComprasView
  BorderStyle = bsNone
  ClientHeight = 480
  ClientWidth = 640
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 640
  ExplicitHeight = 480
  TextHeight = 15
  inline SearchCompras1: TSearchCompras
    Left = 0
    Top = 0
    Width = 640
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 640
    ExplicitHeight = 49
    inherited pnlFundo: TPanel
      Width = 640
      Align = alTop
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 640
      inherited edPesquisa: TEdit
        Width = 467
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 38
        ExplicitTop = 7
        ExplicitWidth = 467
      end
    end
  end
  object dbGridProdutos: TDBGrid
    Left = 0
    Top = 49
    Width = 640
    Height = 431
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
