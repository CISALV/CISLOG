unit uMenuCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus,uMunicipioCRIS,
  Vcl.StdCtrls, uMasterFrame, uframeMenuButton,uFunctions;

type
  TformMenuCadastros = class(TformMaster)
    panelFundo: TPanel;
    gridMenu: TGridPanel;
    speedMunicipio: TSpeedButton;
    panelGRID: TPanel;
    procedure speedMunicipioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMenuCadastros: TformMenuCadastros;

implementation

{$R *.dfm}

procedure TformMenuCadastros.speedMunicipioClick(Sender: TObject);
begin
  inherited;
  CreateAndShowForm(TformMunicipioCRIS,panelFundo);
end;

end.
