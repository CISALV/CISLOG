object formPrincipal: TformPrincipal
  Left = 0
  Top = 0
  Caption = 'CISALV'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 41
    Width = 624
    Height = 400
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 392
  end
  object panelTopBar: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clHighlight
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 622
    object speedCompra: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 81
      Height = 35
      Align = alLeft
      Caption = 'Compra'
      OnClick = speedCompraClick
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 41
    end
  end
end
