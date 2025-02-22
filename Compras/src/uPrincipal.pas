unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, uMasterForm,
  Vcl.Imaging.pngimage, uAreaComprasView, uControllerCompras, uDAOMockProduto,
  uMockProduto, uInterfaces;

type
  TformPrincipal = class(TformMaster)
    pnlFundo: TPanel;
    panelTopBar: TPanel;
    speedCompra: TSpeedButton;
    Image1: TImage;
    speedHome: TSpeedButton;
    procedure speedCompraClick(Sender: TObject);
    procedure speedHomeClick(Sender: TObject);
  private
    Form: Tform;
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses uFormFactory;

procedure TformPrincipal.speedCompraClick(Sender: TObject);
var
  ControllerProduto : ISearchController;
begin
  inherited;
  //ControllerProduto := TControllerCompras<TMockProduto>.Create(TDAOMockProduto.Create);
  Form := TFormComprasView.Create(pnlFundo);
  Form.Parent := pnlFundo;
  Form.Align := AlClient;
  Form.Show;

end;

procedure TformPrincipal.speedHomeClick(Sender: TObject);
begin
  inherited;
  if Assigned(Form) then
    Form.Close;
end;

end.
