unit uViewProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ComCtrls, uframePages,uInterfaces,uProduto;

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
    procedure Save; override;
    procedure Delete; override;
  private
    function WrapObject: TProduto;
  protected
   function CreateController : ISearchController; override;
   procedure PopView(ProdutoId: Integer); override;

  public
    { Public declarations }
  end;

var
  formViewProduto: TformViewProduto;

implementation

{$R *.dfm}

uses uControllerProduto;

procedure TformViewProduto.PopView(ProdutoId: Integer);
var
  Produto : TProduto;
begin
  if ProdutoId > 0 then
   begin
    Produto := (FController as ICRUDController<TProduto>).Get(ProdutoId);
    edGGREM.Text := IntToStr(Produto.GGREM);
    edCATMAT.Text := IntToStr(Produto.CATMAT);
    edApresentacao.Text := Produto.Apresentacao;
    edDescricao.Text := Produto.Descricao;
  end
end;


function TformViewProduto.CreateController: ISearchController;
begin
Result := TControllerProduto.Create;
end;


procedure TformViewProduto.Delete;
var
  Id: Integer;
begin
  inherited;
  Id := StrtoInt(edId.Text);
  (FController as ICRUDController<TProduto>).Delete(Id);
  FController.GetAll;
end;

procedure TformViewProduto.FormShow(Sender: TObject);
begin
  inherited;
  SearchBar.ConfigureFilterFields(['APRESENTACAO','GGREM','CATMAT']);

end;

function TformViewProduto.WrapObject: TProduto;
var
  Produto : TProduto;
begin
  FillChar(Result, SizeOf(TProduto), 0);

  Produto := TProduto.Create(
  StrToIntDef(edId.Text,0),
  StrToIntDef(edGGREM.Text,0),
  StrToIntDef(edCATMAT.Text,0),
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
  Produto: TProduto;
begin
    inherited;
  Produto := WrapObject;
  (FController as ICRUDController<TProduto>).Save(Produto);
  FController.GetAll;

end;

end.
