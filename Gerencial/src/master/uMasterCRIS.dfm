inherited formMasterCRIS: TformMasterCRIS
  BorderStyle = bsNone
  Caption = 'formMasterCRIS'
  ClientHeight = 564
  ClientWidth = 703
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitWidth = 703
  ExplicitHeight = 564
  TextHeight = 18
  object panelFundo: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 564
    Align = alClient
    TabOrder = 0
    inline operationsBar: TframeOperationsBar
      Left = 1
      Top = 504
      Width = 701
      Height = 59
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 504
      ExplicitWidth = 701
      ExplicitHeight = 59
      inherited panelFooterInserir: TPanel
        Width = 701
        Height = 59
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 701
        ExplicitHeight = 44
        inherited speedSalvar: TSpeedButton
          Left = 617
          Height = 51
          ExplicitLeft = 617
          ExplicitHeight = 36
        end
        inherited speedEditar: TSpeedButton
          Left = 531
          Height = 51
          OnClick = operationsBarspeedEditarClick
          ExplicitLeft = 531
          ExplicitTop = 3
          ExplicitHeight = 36
        end
        inherited speedNovo: TSpeedButton
          Height = 51
          OnClick = operationsBarspeedNovoClick
          ExplicitHeight = 36
        end
        inherited speedCancelar: TSpeedButton
          Height = 51
          OnClick = operationsBarspeedCancelarClick
          ExplicitHeight = 36
        end
      end
    end
    object cardpanelCRIS: TCardPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 695
      Height = 497
      Align = alClient
      ActiveCard = cardPesquisa
      BevelOuter = bvNone
      Caption = 'CardPanel1'
      TabOrder = 1
      ExplicitHeight = 512
      object cardPesquisa: TCard
        Left = 0
        Top = 0
        Width = 695
        Height = 497
        Caption = 'Pesquisa'
        CardIndex = 0
        TabOrder = 0
        ExplicitHeight = 512
        object dbgridPesquisa: TDBGrid
          Left = 0
          Top = 49
          Width = 695
          Height = 448
          Align = alClient
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'Roboto'
          TitleFont.Style = []
          OnDblClick = dbgridPesquisaDblClick
        end
        inline SearchBar: TframeSearchBar
          Left = 0
          Top = 0
          Width = 695
          Height = 49
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitWidth = 695
          ExplicitHeight = 49
          inherited panelPesquisa: TPanel
            Width = 695
            Height = 49
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 695
            ExplicitHeight = 49
            inherited comboxCategoria: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited editPesquisa: TEdit
              Height = 19
              StyleElements = [seFont, seClient, seBorder]
            end
          end
        end
      end
      object cardCampos: TCard
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 695
        Height = 491
        Margins.Left = 0
        Margins.Right = 0
        Caption = 'Campos'
        CardIndex = 1
        CardVisible = False
        TabOrder = 1
        ExplicitHeight = 506
        object paginas: TPageControl
          AlignWithMargins = True
          Left = 0
          Top = 20
          Width = 607
          Height = 451
          Margins.Left = 0
          Margins.Top = 20
          Margins.Right = 100
          Margins.Bottom = 20
          ActivePage = tabPrimarios
          Align = alLeft
          TabOrder = 0
          TabPosition = tpBottom
          ExplicitTop = 0
          ExplicitHeight = 506
          object tabPrimarios: TTabSheet
            Caption = 'Campos Prim'#225'rios'
          end
        end
      end
    end
  end
end
