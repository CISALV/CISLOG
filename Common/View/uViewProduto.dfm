inherited formViewProduto: TformViewProduto
  Caption = ''
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 18
  inherited panelFundo: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited cardpanelCRIS: TCardPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited cardPesquisa: TCard
        StyleElements = [seFont, seClient, seBorder]
        inherited SearchBar: TframeSearch
          inherited pnlSearch: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited edSearch: TEdit
              StyleElements = [seFont, seClient, seBorder]
              ExplicitLeft = 154
              ExplicitTop = 3
              ExplicitWidth = 297
            end
            inherited cbFilter: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
          end
        end
      end
    end
    inherited operationsBar: TframeOperationsBar
      inherited panelFooterInserir: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited panelLateral: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited Edit1: TEdit
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited MaskEdit1: TMaskEdit
        StyleElements = [seFont, seClient, seBorder]
      end
      object Fields: TPageControl
        Left = 1
        Top = 1
        Width = 358
        Height = 522
        ActivePage = tabPrincipal
        Align = alClient
        TabHeight = 40
        TabOrder = 2
        TabPosition = tpBottom
        object tabPrincipal: TTabSheet
          Caption = 'Principal'
          object lbDescrição: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 203
            Width = 330
            Height = 15
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'DESCRI'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 69
          end
          object lbApresentacao: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 41
            Width = 330
            Height = 15
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'APRESENTA'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 96
          end
          object lbGGREM: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 95
            Width = 330
            Height = 15
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'GGREM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 44
          end
          object lbCATMAT: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 149
            Width = 330
            Height = 15
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'CATMAT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 51
          end
          object edId: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 330
            Height = 28
            Margins.Left = 10
            Margins.Right = 10
            Margins.Bottom = 10
            TabStop = False
            Align = alTop
            Alignment = taCenter
            Color = clHighlight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -17
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            TextHint = 'ID'
            ExplicitTop = 10
          end
          object edDescricao: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 221
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 3
            ExplicitTop = 196
          end
          object edApresentacao: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 59
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 0
            ExplicitTop = 58
          end
          object edGGREM: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 113
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 1
            ExplicitTop = 104
          end
          object edCATMAT: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 167
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 2
            ExplicitTop = 150
          end
        end
      end
    end
  end
end
