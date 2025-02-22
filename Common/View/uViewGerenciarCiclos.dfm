inherited formViewGerenciarCiclo: TformViewGerenciarCiclo
  BorderStyle = bsNone
  ClientHeight = 628
  ClientWidth = 717
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 717
  ExplicitHeight = 628
  TextHeight = 18
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 717
    Height = 628
    ActivePage = tabHabilitação
    Align = alClient
    TabOrder = 0
    object tabHabilitação: TTabSheet
      Caption = 'Habilita'#231#227'o'
      object Panel1: TPanel
        Left = 553
        Top = 177
        Width = 156
        Height = 418
        Align = alRight
        Caption = 'Panel1'
        TabOrder = 0
        ExplicitLeft = 537
        ExplicitHeight = 379
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
        Width = 709
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
        Width = 553
        Height = 418
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
        Width = 709
        Height = 41
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitWidth = 693
        ExplicitHeight = 41
        inherited pnlSearch: TPanel
          Width = 709
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 693
          inherited edSearch: TEdit
            Width = 545
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 534
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
        Width = 709
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
        ExplicitWidth = 693
        ExplicitHeight = 40
        inherited pnlSearch: TPanel
          Width = 709
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 693
          inherited edSearch: TEdit
            Width = 545
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 534
          end
          inherited cbFilter: TComboBox
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
    end
  end
end
