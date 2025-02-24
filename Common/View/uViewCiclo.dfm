inherited formViewCiclo: TformViewCiclo
  Caption = ''
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
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
      inherited Fields: TPageControl
        ActivePage = TabSheet1
        inherited tabhidden: TTabSheet
          ExplicitHeight = 474
          inherited Edit1: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited MaskEdit1: TMaskEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
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
          object edNome: TEdit
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
            TabOrder = 1
            TextHint = 'NOME'
          end
          object edTipo: TEdit
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
            TabOrder = 2
            TextHint = 'TIPO'
          end
        end
      end
    end
  end
end
