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
        inherited dbgridPesquisa: TDBGrid
          DataSource = DataSource1
        end
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
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 400
    Top = 280
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM MOCK_PRODUTO')
    Left = 388
    Top = 212
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\database\CISALV-3-2-1.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 380
    Top = 140
  end
end
