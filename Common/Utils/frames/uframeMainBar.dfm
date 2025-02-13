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
      ExplicitTop = 40
      ExplicitWidth = 145
      inherited panel: TPanel
        Width = 145
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 145
        inherited speed: TSpeedButton
          Width = 141
          OnClick = CadastrospeedClick
          ExplicitLeft = 18
          ExplicitTop = -14
          ExplicitWidth = 141
          ExplicitHeight = 36
        end
      end
    end
  end
end
