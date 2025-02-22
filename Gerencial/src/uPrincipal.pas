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
    Pedido: TframeMenuButton;
    procedure CadastrospeedClick(Sender: TObject);
    procedure PedidospeedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses uView_Pedidos;

procedure TformPrincipal.CadastrospeedClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformMenuCadastros,panelContainer);
end;



procedure TformPrincipal.PedidospeedClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(Tform_Pedidos,panelContainer);
end;

end.
