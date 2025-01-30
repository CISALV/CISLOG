inherited frameSearchBar: TframeSearchBar
  Width = 987
  Height = 55
  Align = alTop
  ExplicitWidth = 987
  ExplicitHeight = 55
  object panelPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 987
    Height = 55
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object combox: TComboBox
      AlignWithMargins = True
      Left = 5
      Top = 10
      Width = 196
      Height = 23
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 5
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 0
    end
    object edit: TEdit
      AlignWithMargins = True
      Left = 211
      Top = 10
      Width = 771
      Height = 25
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 5
      Margins.Bottom = 20
      Align = alClient
      Alignment = taCenter
      TabOrder = 1
      ExplicitLeft = 256
      ExplicitWidth = 726
    end
  end
end
