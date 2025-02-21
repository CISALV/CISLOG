inherited formGerenciarPedido: TformGerenciarPedido
  BorderStyle = bsNone
  ClientHeight = 589
  ClientWidth = 660
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 660
  ExplicitHeight = 589
  TextHeight = 18
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 41
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 0
    object speedCiclo: TSpeedButton
      Left = 105
      Top = 1
      Width = 104
      Height = 39
      Align = alLeft
      Caption = 'Ciclos'
      OnClick = speedCicloClick
      ExplicitLeft = 1
    end
    object speedGerenciar: TSpeedButton
      Left = 1
      Top = 1
      Width = 104
      Height = 39
      Align = alLeft
      Caption = 'Gerenciar'
      OnClick = speedGerenciarClick
      ExplicitLeft = 9
      ExplicitTop = 2
    end
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 41
    Width = 660
    Height = 548
    Align = alClient
    Caption = 'Fundo'
    TabOrder = 1
  end
end
