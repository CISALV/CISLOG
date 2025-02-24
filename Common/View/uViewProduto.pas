unit uViewProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ComCtrls, uframePages,
  uInterfaces, uProduto, uBaseCRUDController, uControllerProduto, uDAOProduto;

type
  TformViewProduto = class(TformMasterCRUDView)
    tabPrincipal: TTabSheet;
    edId: TEdit;
    edDescricao: TEdit;
    edApresentacao: TEdit;
    edGGREM: TEdit;
    edCATMAT: TEdit;
    lbDescrição: TLabel;
    lbApresentacao: TLabel;
    lbGGREM: TLabel;
    lbCATMAT: TLabel;
    procedure FormShow(Sender: TObject);
    procedure operationsBarspeedNovoClick(Sender: TObject);

  private
    function WrapObject: IEntity;
  protected
    //function CreateController: ISearchController; override;
    procedure PopView(ProdutoId: Integer); override;

  public
    constructor Create(AOwner: TComponent; AController: ISearchController);
    procedure Save; override;
    procedure Delete; override;
  end;

var
  formViewProduto: TformViewProduto;

implementation

{$R *.dfm}


procedure TformViewProduto.PopView(ProdutoId: Integer);
var
  Produto: TProduto;
begin
  if ProdutoId > 0 then
  begin
    Produto := (FController as ICRUDController<TProduto>).Get(ProdutoId);
    edId.Text := IntToStr(Produto.Id);
    edGGREM.Text := IntToStr(Produto.GGREM);
    edCATMAT.Text := IntToStr(Produto.CATMAT);
    edApresentacao.Text := Produto.Apresentacao;
    edDescricao.Text := Produto.Descricao;
  end
end;

constructor TformViewProduto.Create(AOwner: TComponent;
  AController: ISearchController);
begin
  inherited Create(AOwner, AController);
end;

{
function TformViewProduto.CreateController: ISearchController;
begin

end;
}
procedure TformViewProduto.Delete;
var
  Id: Integer;
begin
  inherited;
  try
    Id := StrToIntDef(edId.Text, 0);
    if Id > 0 then
    begin
      (FController as ICRUDController<TProduto>).Delete(Id);
      FController.GetAll;
    end
    else
      ShowMessage('ID inválido para exclusão.');
  except
    on E: Exception do
      ShowMessage('Erro ao excluir: ' + E.Message);
  end;
end;

procedure TformViewProduto.FormShow(Sender: TObject);

begin
  inherited;
  SearchBar.ConfigureFilterFields(['APRESENTACAO', 'GGREM', 'CATMAT']);
  end;

function TformViewProduto.WrapObject: IEntity;
var
  Produto: IEntity;
begin

    Produto := TProduto.Create(
    StrToIntDef(edId.Text, 0),
    StrToIntDef(edGGREM.Text, 0),
    StrToIntDef(edCATMAT.Text, 0),
    edApresentacao.Text,
    edDescricao.Text);

  Result := Produto;
end;

procedure TformViewProduto.operationsBarspeedNovoClick(Sender: TObject);
begin
  inherited;
  Fields.ActivePage := tabPrincipal;
  edApresentacao.SetFocus;
  LimparCampos;
end;

procedure TformViewProduto.Save;
var
  Produto: IEntity;
begin
  inherited;
  Produto := WrapObject;
  (FController as ICRUDController<TProduto>).Save(Produto as TProduto);
  FController.GetAll;
  panelLateral.Visible := False;
  operationsBar.SetButtonState(osIdle);
end;

end.
