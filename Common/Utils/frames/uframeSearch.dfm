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
      TabOrder = 0
      OnChange = edSearchChange
      ExplicitHeight = 22
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
