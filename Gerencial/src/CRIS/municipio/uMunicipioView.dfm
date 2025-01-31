inherited formMunicipioView: TformMunicipioView
  ClientHeight = 589
  ClientWidth = 964
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  ExplicitWidth = 964
  ExplicitHeight = 589
  TextHeight = 18
  inherited panelFundo: TPanel
    Width = 964
    Height = 589
    DockSite = True
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 964
    ExplicitHeight = 589
    inherited panelLateral: TPanel [0]
      Left = 603
      Height = 528
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 603
      ExplicitHeight = 528
      inherited Edit1: TEdit
        Left = 296
        Top = 410
        Width = 50
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 296
        ExplicitTop = 410
        ExplicitWidth = 50
      end
      inherited MaskEdit1: TMaskEdit
        Left = 296
        Top = 449
        Width = 49
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 296
        ExplicitTop = 449
        ExplicitWidth = 49
      end
      object Fields: TPageControl
        Left = 1
        Top = 1
        Width = 358
        Height = 526
        ActivePage = Principal
        Align = alClient
        TabHeight = 40
        TabOrder = 2
        TabPosition = tpBottom
        object Principal: TTabSheet
          Caption = 'Principal'
          ImageIndex = 1
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
          object edEmail: TEdit
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
            TabOrder = 3
            TextHint = 'E-MAIL'
          end
          object edCNPJ: TMaskEdit
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
            Text = ''
            TextHint = 'CNPJ'
            OnEnter = edCNPJEnter
            OnExit = edCNPJExit
          end
        end
      end
    end
    inherited cardpanelCRIS: TCardPanel [1]
      Width = 596
      Height = 522
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 596
      ExplicitHeight = 522
      inherited cardPesquisa: TCard
        Width = 596
        Height = 522
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 596
        ExplicitHeight = 522
        inherited SearchBar: TframeSearchBar [0]
          Width = 596
          ExplicitWidth = 596
          inherited panelPesquisa: TPanel
            Width = 596
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 596
            inherited combox: TComboBox
              Text = 'NOME'#11
              StyleElements = [seFont, seClient, seBorder]
              Items.Strings = (
                'CNPJ'
                'NOME')
            end
            inherited edit: TEdit
              Width = 380
              StyleElements = [seFont, seClient, seBorder]
              ExplicitWidth = 380
            end
          end
        end
        inherited dbgridPesquisa: TDBGrid [1]
          Width = 596
          Height = 473
        end
      end
    end
    inherited operationsBar: TframeOperationsBar [2]
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
          ExplicitLeft = 898
          ExplicitTop = -7
          ExplicitHeight = 57
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
        inherited speedExcluir: TSpeedButton
          OnClick = operationsBarspeedExcluirCick
        end
      end
    end
  end
end
