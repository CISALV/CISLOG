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
      Width = 156
      Height = 22
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 5
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 0
      ExplicitTop = 23
    end
    object edit: TEdit
      AlignWithMargins = True
      Left = 171
      Top = 10
      Width = 801
      Height = 35
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 15
      Margins.Bottom = 10
      Align = alClient
      Alignment = taCenter
      TabOrder = 1
      ExplicitHeight = 22
    end
  end
end
