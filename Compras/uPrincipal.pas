unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,uMasterForm;

type
  TformPrincipal = class(TFormMaster)
    pnlFundo: TPanel;
    panelTopBar: TPanel;
    speedCompra: TSpeedButton;
    procedure speedCompraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses uFormFactory, uAreaComprasView;

procedure TformPrincipal.speedCompraClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformComprasView,pnlFundo)
end;

end.
