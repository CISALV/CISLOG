inherited MunicipioFieldCriar: TMunicipioFieldCriar
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 438
  ClientWidth = 377
  DragKind = dkDock
  DragMode = dmAutomatic
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 377
  ExplicitHeight = 438
  TextHeight = 18
  inline frameMunicipioField1: TframeMunicipioField
    Left = 0
    Top = 0
    Width = 377
    Height = 438
    Align = alClient
    DragKind = dkDock
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 377
    ExplicitHeight = 438
    inherited Panel1: TPanel
      Width = 377
      Height = 438
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 377
      ExplicitHeight = 438
      inherited PageControl1: TPageControl
        Width = 375
        Height = 395
        ExplicitWidth = 375
        ExplicitHeight = 395
        inherited tabCampos: TTabSheet
          ExplicitWidth = 361
          ExplicitHeight = 341
          inherited Edit1: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited Edit2: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited Edit6: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited email: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
      inherited Panel2: TPanel
        Width = 375
        Caption = 'Novo Munic'#237'pio'
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 375
      end
    end
  end
end
