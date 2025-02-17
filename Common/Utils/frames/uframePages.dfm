object framePages: TframePages
  Left = 0
  Top = 0
  Width = 344
  Height = 480
  TabOrder = 0
  object Fields: TPageControl
    Left = 0
    Top = 0
    Width = 344
    Height = 480
    ActivePage = tabPrincipal
    Align = alClient
    TabHeight = 40
    TabOrder = 0
    TabPosition = tpBottom
    object tabPrincipal: TTabSheet
      Caption = 'Principal'
      object edId: TEdit
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 316
        Height = 28
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        TabStop = False
        Align = alTop
        Alignment = taCenter
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TextHint = 'ID'
        ExplicitWidth = 330
      end
    end
  end
end
