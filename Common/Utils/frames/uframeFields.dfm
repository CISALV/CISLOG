inherited frameFields: TframeFields
  Width = 393
  Align = alClient
  ExplicitWidth = 393
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 41
    Align = alTop
    Caption = 'Titulo'
    TabOrder = 0
    ExplicitLeft = 200
    ExplicitTop = 208
    ExplicitWidth = 185
  end
  object Tabs: TPageControl
    Left = 0
    Top = 41
    Width = 393
    Height = 439
    ActivePage = Principal
    Align = alClient
    TabHeight = 50
    TabOrder = 1
    TabPosition = tpBottom
    object Principal: TTabSheet
      Caption = 'Principal'
    end
    object Endereço: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
    end
  end
end
