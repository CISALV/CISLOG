inherited formMasterCRUDView: TformMasterCRUDView
  BorderStyle = bsNone
  ClientHeight = 585
  ClientWidth = 829
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitWidth = 829
  ExplicitHeight = 585
  TextHeight = 15
  object panelFundo: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 585
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object cardpanelCRIS: TCardPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 461
      Height = 518
      Align = alClient
      ActiveCard = cardPesquisa
      BevelOuter = bvNone
      Caption = 'CardPanel1'
      DragKind = dkDock
      DragMode = dmAutomatic
      ParentBackground = False
      TabOrder = 0
      object cardPesquisa: TCard
        Left = 0
        Top = 0
        Width = 461
        Height = 518
        Caption = 'Pesquisa'
        CardIndex = 0
        TabOrder = 0
        object dbgridPesquisa: TDBGrid
          Left = 0
          Top = 49
          Width = 461
          Height = 469
          Cursor = crHandPoint
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = False
          DrawingStyle = gdsGradient
          FixedColor = clSkyBlue
          GradientEndColor = clBtnFace
          GradientStartColor = clBtnFace
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDblClick = dbgridPesquisaDblClick
        end
        inline SearchBar: TframeSearchBar
          Left = 0
          Top = 0
          Width = 461
          Height = 49
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitWidth = 461
          ExplicitHeight = 49
          inherited panelPesquisa: TPanel
            Width = 461
            Height = 49
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 461
            ExplicitHeight = 49
            inherited combox: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited edit: TEdit
              Height = 22
              StyleElements = [seFont, seClient, seBorder]
              ExplicitHeight = 22
            end
          end
        end
      end
      object cardNovo: TCard
        Left = 0
        Top = 0
        Width = 461
        Height = 518
        Margins.Left = 100
        Margins.Top = 50
        Margins.Right = 100
        Margins.Bottom = 50
        Caption = 'Novo'
        CardIndex = 1
        TabOrder = 1
      end
      object cardEditar: TCard
        Left = 0
        Top = 0
        Width = 461
        Height = 518
        Caption = 'Editar'
        CardIndex = 2
        TabOrder = 2
      end
    end
    inline operationsBar: TframeOperationsBar
      Left = 1
      Top = 525
      Width = 827
      Height = 59
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 525
      ExplicitWidth = 827
      ExplicitHeight = 59
      inherited panelFooterInserir: TPanel
        Width = 827
        Height = 59
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 827
        ExplicitHeight = 59
        inherited speedSalvar: TSpeedButton
          Left = 746
          Height = 57
          OnClick = operationsBarspeedSalvarClick
          ExplicitLeft = 617
          ExplicitHeight = 36
        end
        inherited speedEditar: TSpeedButton
          Left = 666
          Height = 57
          ExplicitLeft = 531
          ExplicitTop = 3
          ExplicitHeight = 36
        end
        inherited speedNovo: TSpeedButton
          Left = 586
          Height = 57
          OnClick = operationsBarspeedNovoClick
          ExplicitLeft = 460
          ExplicitHeight = 57
        end
        inherited speedCancelar: TSpeedButton
          Height = 57
          OnClick = operationsBarspeedCancelarClick
          ExplicitHeight = 36
        end
        inherited speedExcluir: TSpeedButton
          Height = 57
          OnClick = operationsBarspeedExcluirClick
          ExplicitHeight = 57
        end
      end
    end
    object panelLateral: TPanel
      Left = 468
      Top = 1
      Width = 360
      Height = 524
      Align = alRight
      Caption = 'Lateral'
      DockSite = True
      TabOrder = 2
      Visible = False
    end
  end
end
