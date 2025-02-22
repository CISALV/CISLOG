inherited frameSearch: TframeSearch
  Height = 46
  ExplicitHeight = 46
  object pnlSearch: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object edSearch: TEdit
      AlignWithMargins = True
      Left = 154
      Top = 3
      Width = 476
      Height = 35
      Margins.Right = 10
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSlategray
      Font.Height = -17
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Pesquisar'
      OnChange = edSearchChange
      ExplicitLeft = 155
      ExplicitTop = 4
      ExplicitWidth = 481
      ExplicitHeight = 28
    end
    object cbFilter: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 145
      Height = 22
      Align = alLeft
      TabOrder = 1
      ExplicitLeft = 4
      ExplicitTop = 4
    end
  end
end
