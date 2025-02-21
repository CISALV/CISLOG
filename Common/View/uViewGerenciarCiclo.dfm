inherited formViewGerenciarCiclo: TformViewGerenciarCiclo
  ClientHeight = 589
  ClientWidth = 701
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 717
  ExplicitHeight = 628
  TextHeight = 18
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 701
    Height = 589
    ActivePage = tabGerenciar
    Align = alClient
    TabOrder = 0
    object tabGerenciar: TTabSheet
      Caption = 'Gerenciar'
      object Panel1: TPanel
        Left = 537
        Top = 177
        Width = 156
        Height = 379
        Align = alRight
        Caption = 'Panel1'
        TabOrder = 0
        ExplicitLeft = 535
        ExplicitHeight = 371
        object speedHabilitar: TSpeedButton
          Left = 1
          Top = 41
          Width = 154
          Height = 32
          Align = alTop
          Caption = 'Habilitar'
          ExplicitWidth = 98
        end
        object speedSelection: TSpeedButton
          Left = 1
          Top = 1
          Width = 154
          Height = 40
          Align = alTop
          Caption = 'Selecionar Todos'
          ExplicitWidth = 98
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 41
        Width = 693
        Height = 96
        Align = alTop
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 177
        Width = 537
        Height = 379
        Align = alClient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
      end
      inline frameSearch1: TframeSearch
        Left = 0
        Top = 0
        Width = 693
        Height = 41
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitWidth = 691
        ExplicitHeight = 41
        inherited pnlSearch: TPanel
          Width = 693
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 691
          inherited edSearch: TEdit
            Width = 534
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 532
          end
          inherited cbFilter: TComboBox
            Visible = False
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
      inline frameSearch2: TframeSearch
        Left = 0
        Top = 137
        Width = 693
        Height = 40
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ExplicitTop = 137
        ExplicitWidth = 691
        ExplicitHeight = 40
        inherited pnlSearch: TPanel
          Width = 693
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 691
          inherited edSearch: TEdit
            Width = 534
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 532
          end
          inherited cbFilter: TComboBox
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
    end
  end
end
