inherited formMasterCRUDView: TformMasterCRUDView
  BorderStyle = bsNone
  Caption = 's'
  ClientHeight = 585
  ClientWidth = 829
  StyleElements = [seFont, seClient, seBorder]
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 829
  ExplicitHeight = 585
  TextHeight = 18
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
          TabStop = False
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
          TitleFont.Height = -15
          TitleFont.Name = 'Roboto'
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
              TabStop = False
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited edit: TEdit
              Width = 275
              Height = 29
              TabStop = False
              StyleElements = [seFont, seClient, seBorder]
              OnChange = SearchBareditChange
              ExplicitWidth = 275
            end
          end
        end
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
      object Edit1: TEdit
        Left = 48
        Top = 418
        Width = 257
        Height = 26
        TabOrder = 0
        Text = 'Edit1'
        Visible = False
      end
      object MaskEdit1: TMaskEdit
        Left = 48
        Top = 457
        Width = 257
        Height = 26
        TabOrder = 1
        Text = 'MaskEdit1'
        Visible = False
      end
    end
  end
end
