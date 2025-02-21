inherited frameSearch: TframeSearch
  Height = 56
  ExplicitHeight = 56
  object pnlSearch: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    TabOrder = 0
    object edSearch: TEdit
      AlignWithMargins = True
      Left = 155
      Top = 4
      Width = 481
      Height = 33
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
      ExplicitHeight = 28
    end
    object cbFilter: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 145
      Height = 22
      Align = alLeft
      TabOrder = 1
    end
  end
end
