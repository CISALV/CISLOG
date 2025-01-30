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
    inherited Panel1: TPanel
      Width = 962
      Height = 288
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 962
      ExplicitHeight = 288
      inherited SearchBar: TframeSearchBar
        Width = 962
        ExplicitWidth = 962
        inherited panelPesquisa: TPanel
          Width = 962
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 962
          inherited combox: TComboBox
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited edit: TEdit
            Width = 746
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
    end
    inherited Panel3: TPanel
      Top = 508
      Width = 962
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 508
      ExplicitWidth = 962
      inherited operationsBar: TframeOperationsBar
        Width = 960
        ExplicitWidth = 960
        inherited panelFooterInserir: TPanel
          Width = 960
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 960
          inherited speedSalvar: TSpeedButton
            Left = 879
            ExplicitLeft = 881
          end
          inherited speedEditar: TSpeedButton
            Left = 799
            ExplicitLeft = 807
            ExplicitTop = 6
            ExplicitHeight = 57
          end
          inherited speedNovo: TSpeedButton
            Left = 719
            ExplicitLeft = 721
          end
        end
      end
    end
    inherited Panel2: TPanel
      Top = 289
      Width = 962
      Height = 219
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 289
      ExplicitWidth = 962
      ExplicitHeight = 457
      inherited panelLateral: TPanel [0]
        Left = 687
        Height = 217
        TabOrder = 0
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 687
        ExplicitHeight = 455
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
          Width = 272
          Height = 215
          ActivePage = Principal
          Align = alClient
          TabHeight = 40
          TabOrder = 2
          TabPosition = tpBottom
          ExplicitLeft = 2
          ExplicitTop = 2
          object Principal: TTabSheet
            Caption = 'Principal'
            ImageIndex = 1
            object edNome: TEdit
              AlignWithMargins = True
              Left = 10
              Top = 144
              Width = 244
              Height = 23
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Align = alTop
              TabOrder = 0
              TextHint = 'NOME'
            end
            object edId: TEdit
              AlignWithMargins = True
              Left = 10
              Top = 10
              Width = 244
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
            object edEmail: TEdit
              AlignWithMargins = True
              Left = 10
              Top = 101
              Width = 244
              Height = 23
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Align = alTop
              TabOrder = 2
              TextHint = 'E-MAIL'
            end
            object edCNPJ: TMaskEdit
              AlignWithMargins = True
              Left = 10
              Top = 58
              Width = 244
              Height = 23
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Align = alTop
              TabOrder = 3
              Text = ''
              TextHint = 'CNPJ'
              OnEnter = edCNPJEnter
              OnExit = edCNPJExit
            end
          end
        end
      end
      inherited dbgridPesquisa: TDBGrid [1]
        Width = 686
        Height = 217
        TabOrder = 1
      end
    end
  end
end
