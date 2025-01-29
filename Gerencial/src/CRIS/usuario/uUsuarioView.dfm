inherited formUsuarioCRIS: TformUsuarioCRIS
  Caption = ''
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 18
  inherited panelFundo: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited cardpanelCRIS: TCardPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited cardPesquisa: TCard
        StyleElements = [seFont, seClient, seBorder]
        inherited SearchBar: TframeSearchBar
          inherited panelPesquisa: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited combox: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited edit: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
        end
      end
      inherited cardNovo: TCard
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited cardEditar: TCard
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited operationsBar: TframeOperationsBar
      inherited panelFooterInserir: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited speedSalvar: TSpeedButton
          ExplicitLeft = 620
          ExplicitHeight = 57
        end
        inherited speedEditar: TSpeedButton
          ExplicitLeft = 540
          ExplicitHeight = 57
        end
        inherited speedCancelar: TSpeedButton
          ExplicitHeight = 57
        end
      end
    end
    inherited panelLateral: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
end
