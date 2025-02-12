inherited frameMainBar: TframeMainBar
  Width = 146
  ExplicitWidth = 146
  object panelTaskbar: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 480
    Align = alLeft
    BevelOuter = bvNone
    Color = cl3DLight
    ParentBackground = False
    TabOrder = 0
    inline Cadastro: TframeMenuButton
      Left = 0
      Top = 0
      Width = 145
      Height = 40
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 185
      inherited panel: TPanel
        Width = 145
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 185
        ExplicitHeight = 40
        inherited speed: TSpeedButton
          Width = 143
          OnClick = CadastrospeedClick
          ExplicitLeft = -32
          ExplicitTop = -23
          ExplicitWidth = 194
          ExplicitHeight = 38
        end
      end
    end
  end
end
