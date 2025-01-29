unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, uMenuCadastro, uMasterForm, Vcl.StdCtrls,
  uMasterFrame, uframeMenuButton, uframeMainBar,uFormFactory,uDataConService;

type
  TformPrincipal = class(TformMaster)
    panelContainer: TPanel;
    panelBackground: TPanel;
    panelTopBar: TPanel;
    Image1: TImage;
    frameMainBar1: TframeMainBar;
    procedure CadastrospeedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

procedure TformPrincipal.CadastrospeedClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformMenuCadastros,panelContainer);
end;

end.
