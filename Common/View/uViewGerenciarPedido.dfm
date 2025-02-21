inherited formGerenciarPedido: TformGerenciarPedido
  BorderStyle = bsNone
  ClientHeight = 589
  ClientWidth = 660
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitWidth = 660
  ExplicitHeight = 589
  TextHeight = 18
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 660
    Height = 589
    ActivePage = tabGerenciar
    Align = alTop
    TabOrder = 0
    object tabGerenciar: TTabSheet
      Caption = 'Gerenciar'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 41
        Width = 652
        Height = 96
        Align = alTop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 177
        Width = 496
        Height = 379
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
      end
      inline frameSearch1: TframeSearch
        Left = 0
        Top = 0
        Width = 652
        Height = 41
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ExplicitWidth = 652
        ExplicitHeight = 41
        inherited pnlSearch: TPanel
          Width = 652
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 652
          inherited edSearch: TEdit
            Width = 493
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 493
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
        Width = 652
        Height = 40
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitTop = 137
        ExplicitWidth = 652
        ExplicitHeight = 40
        inherited pnlSearch: TPanel
          Width = 652
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 652
          inherited edSearch: TEdit
            Width = 493
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 493
          end
          inherited cbFilter: TComboBox
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
      object Panel1: TPanel
        Left = 496
        Top = 177
        Width = 156
        Height = 379
        Align = alRight
        Caption = 'Panel1'
        TabOrder = 4
        object speedSelection: TSpeedButton
          Left = 1
          Top = 1
          Width = 154
          Height = 40
          Align = alTop
          Caption = 'Selecionar Todos'
          ExplicitWidth = 98
        end
        object speedHabilitar: TSpeedButton
          Left = 1
          Top = 41
          Width = 154
          Height = 32
          Align = alTop
          Caption = 'Habilitar'
          ExplicitWidth = 98
        end
      end
    end
    object tabCriar: TTabSheet
      Caption = 'Criar'
      ImageIndex = 1
    end
    object tabRelatorios: TTabSheet
      Caption = 'Relat'#243'rios'
      ImageIndex = 2
    end
  end
end
