inherited formProdutosView: TformProdutosView
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
              ExplicitLeft = 155
              ExplicitHeight = 22
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
        ExplicitLeft = 3
        ExplicitTop = -3
        object tabPrincipal: TTabSheet
          Caption = 'Principal'
          object edId: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 10
            Width = 330
            Height = 28
            Margins.Left = 10
            Margins.Top = 10
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
          end
          object edDescricao: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 196
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 3
            TextHint = 'DESCRI'#199#195'O'
            ExplicitTop = 58
          end
          object edApresentacao: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 58
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 0
            TextHint = 'APRESENTA'#199#195'O'
            ExplicitLeft = 5
            ExplicitTop = 38
          end
          object edGGREM: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 104
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 1
            TextHint = 'GGREM'
            ExplicitTop = 58
          end
          object edCATMAT: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 150
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 2
            TextHint = 'CATMAT'
            ExplicitTop = 168
          end
        end
      end
    end
  end
end
