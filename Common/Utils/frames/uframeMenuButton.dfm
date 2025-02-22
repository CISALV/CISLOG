inherited frameMenuButton: TframeMenuButton
  Width = 196
  Height = 40
  ExplicitWidth = 196
  ExplicitHeight = 40
  object panel: TPanel
    Left = 0
    Top = 0
    Width = 196
    Height = 40
    Align = alClient
    BevelInner = bvRaised
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object speed: TSpeedButton
      Left = 2
      Top = 2
      Width = 192
      Height = 36
      Align = alClient
      Caption = 'Text'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3618615
      Font.Height = -17
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Transparent = False
      OnMouseDown = speedMouseDown
      ExplicitLeft = 88
      ExplicitTop = 80
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
end
