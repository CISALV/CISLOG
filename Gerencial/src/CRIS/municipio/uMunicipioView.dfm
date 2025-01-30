inherited formMunicipioView: TformMunicipioView
  ClientHeight = 589
  ClientWidth = 964
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 964
  ExplicitHeight = 589
  TextHeight = 15
  inherited panelFundo: TPanel
    Width = 964
    Height = 589
    DockSite = True
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 964
    ExplicitHeight = 589
    inherited cardpanelCRIS: TCardPanel
      Width = 596
      Height = 522
      DockSite = True
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 596
      ExplicitHeight = 522
      inherited cardPesquisa: TCard
        Width = 596
        Height = 522
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 596
        ExplicitHeight = 522
        inherited dbgridPesquisa: TDBGrid
          Width = 596
          Height = 473
        end
        inherited SearchBar: TframeSearchBar
          Width = 596
          ExplicitWidth = 596
          inherited panelPesquisa: TPanel
            Width = 596
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 596
            inherited combox: TComboBox
              ItemIndex = 0
              Text = 'NOME'
              StyleElements = [seFont, seClient, seBorder]
              Items.Strings = (
                'NOME'
                'CNPJ')
            end
            inherited edit: TEdit
              Width = 404
              Height = 19
              Align = alClient
              StyleElements = [seFont, seClient, seBorder]
              OnChange = SearchBareditChange
              ExplicitWidth = 404
            end
          end
        end
      end
      inherited cardNovo: TCard
        Width = 596
        Height = 522
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 596
        ExplicitHeight = 522
      end
      inherited cardEditar: TCard
        Width = 596
        Height = 522
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 596
        ExplicitHeight = 522
      end
    end
    inherited operationsBar: TframeOperationsBar
      Top = 529
      Width = 962
      ExplicitTop = 529
      ExplicitWidth = 962
      inherited panelFooterInserir: TPanel
        Width = 962
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 962
        inherited speedSalvar: TSpeedButton
          Left = 881
          ExplicitLeft = 881
        end
        inherited speedEditar: TSpeedButton
          Left = 801
          ExplicitLeft = 807
          ExplicitTop = 6
          ExplicitHeight = 57
        end
        inherited speedNovo: TSpeedButton
          Left = 721
          ExplicitLeft = 721
        end
      end
    end
    inherited panelLateral: TPanel
      Left = 603
      Height = 528
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 603
      ExplicitHeight = 528
      object Fields: TPageControl [0]
        Left = 1
        Top = 1
        Width = 358
        Height = 526
        ActivePage = Principal
        Align = alClient
        TabHeight = 40
        TabOrder = 0
        TabPosition = tpBottom
        object Principal: TTabSheet
          Caption = 'Principal'
          object edCNPJ: TMaskEdit
            AlignWithMargins = True
            Left = 10
            Top = 101
            Width = 330
            Height = 23
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 0
            Text = ''
            TextHint = 'CNPJ'
            OnEnter = edCNPJEnter
            OnExit = edCNPJExit
          end
          object edEmail: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 144
            Width = 330
            Height = 23
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 3
            TextHint = 'E-MAIL'
          end
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
            TabOrder = 1
            TextHint = 'ID'
          end
          object edNome: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 58
            Width = 330
            Height = 23
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alTop
            TabOrder = 2
            TextHint = 'NOME'
          end
        end
      end
      inherited Edit1: TEdit
        TabOrder = 1
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited MaskEdit1: TMaskEdit
        TabOrder = 2
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
end
