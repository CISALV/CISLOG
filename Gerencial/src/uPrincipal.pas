unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, uMenuCadastro, uMasterForm, Vcl.StdCtrls,
  uMasterFrame, uframeMenuButton,uFormFactory,uDataConService;

type
  TformPrincipal = class(TformMaster)
    panelContainer: TPanel;
    panelBackground: TPanel;
    panelTopBar: TPanel;
    Image1: TImage;
    panelTaskbar: TPanel;
    Cadastro: TframeMenuButton;
    procedure CadastrospeedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;
  {
    this is a teste to add git lines lets see
  }

implementation

{$R *.dfm}

procedure TformPrincipal.CadastrospeedClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformMenuCadastros,panelContainer);
end;



end.
