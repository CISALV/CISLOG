inherited formViewMockProduto: TformViewMockProduto
  Caption = 'formViewMockProduto'
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
      inherited MaskEdit1: TMaskEdit [0]
        TabOrder = 0
        StyleElements = [seFont, seClient, seBorder]
      end
      object PageControl1: TPageControl [1]
        Left = 1
        Top = 1
        Width = 358
        Height = 522
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
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
            TabOrder = 0
            TextHint = 'ID'
          end
          object edUnidadeFracionamento: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 334
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 1
            TextHint = 'UNIDADE DE FRACIONAMENTO'
            ExplicitTop = 288
          end
          object edQuantidadeTotal: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 242
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 2
            TextHint = 'QUANTIDADE INICIAL'
            ExplicitTop = 196
          end
          object edDescricao: TEdit
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
            TabOrder = 3
            TextHint = 'DESCRI'#199#195'O'
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
            TabOrder = 4
            TextHint = 'APRESENTA'#199#195'O'
          end
          object edValor: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 288
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 5
            TextHint = 'VALOR'
            ExplicitTop = 242
          end
          object edGGREM: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 380
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 6
            TextHint = 'GGREM'
            ExplicitTop = 334
          end
          object edCATMAT: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 426
            Width = 330
            Height = 26
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 7
            TextHint = 'CATMAT'
            ExplicitTop = 380
          end
          object edQuantidadeRestante: TEdit
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
            TabOrder = 8
            TextHint = 'QUANTIDADE RESTANTE'
          end
          object edQuantidadeMinima: TEdit
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
            TabOrder = 9
            TextHint = 'QUANTIDADE MINIMA'
            ExplicitLeft = 26
            ExplicitTop = 242
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
        end
      end
      inherited Edit1: TEdit [2]
        Top = 484
        TabOrder = 2
        StyleElements = [seFont, seClient, seBorder]
        ExplicitTop = 484
      end
    end
  end
end
