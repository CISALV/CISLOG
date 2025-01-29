inherited frameSearchBar: TframeSearchBar
  Width = 643
  Height = 45
  Align = alTop
  ExplicitWidth = 643
  ExplicitHeight = 45
  object panelPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 45
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object combox: TComboBox
      AlignWithMargins = True
      Left = 5
      Top = 10
      Width = 172
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
      Left = 187
      Top = 10
      Width = 390
      Height = 23
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 5
      Margins.Bottom = 20
      Alignment = taCenter
      TabOrder = 1
    end
  end
end
