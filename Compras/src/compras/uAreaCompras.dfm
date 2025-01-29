inherited formCompras: TformCompras
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 640
  ExplicitHeight = 480
  TextHeight = 15
  inline SearchCompras1: TSearchCompras
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    inherited pnlFundo: TPanel
      Width = 624
      Align = alTop
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 624
      inherited Edit1: TEdit
        Width = 463
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 463
        ExplicitHeight = 38
      end
    end
  end
end
