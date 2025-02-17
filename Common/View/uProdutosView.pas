unit uProdutosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ComCtrls, uframePages,uInterfaces;

type
  TformProdutosView = class(TformMasterCRUDView)
    Fields: TPageControl;
    tabPrincipal: TTabSheet;
    edId: TEdit;
    edDescricao: TEdit;
    edApresentacao: TEdit;
    edGGREM: TEdit;
    edCATMAT: TEdit;
    procedure FormShow(Sender: TObject);
  private
  protected
   function CreateController : IController; override;
  public
    { Public declarations }
  end;

var
  formProdutosView: TformProdutosView;

implementation

{$R *.dfm}

function TformProdutosView.CreateController: IController;
begin
  Result := TProdutosController.Create;
end;

procedure TformProdutosView.FormShow(Sender: TObject);
begin
  inherited;
  SearchBar.ConfigureFilterFields(['APRESENTACAO','GGREM']);
  dbGridPesquisa.Columns.Clear;
end;

end.
