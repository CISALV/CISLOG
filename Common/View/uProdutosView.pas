unit uProdutosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ComCtrls, uframePages,uInterfaces,uProduto;

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
    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure dbgridPesquisaDblClick(Sender: TObject);
    procedure Save; override;
  private
    function MakeObjectfromFields: TProduto;
  protected
   function CreateController : ISearchController; override;
   procedure CarregarProduto(ProdutoId: Integer);

  public
    { Public declarations }
  end;

var
  formProdutosView: TformProdutosView;

implementation

{$R *.dfm}

uses uControllerProduto;

procedure TformProdutosView.CarregarProduto(ProdutoId: Integer);
var
  Produto : TProduto;
begin
  Produto := (FController as IController<TProduto>).PopularView(ProdutoID);
  if Produto.Id > 0 then
  begin
    edId.Text := IntToStr(ProdutoID);
    edGGREM.Text := IntToStr(Produto.GGREM);
    edCATMAT.Text := IntToStr(Produto.CATMAT);
    edApresentacao.Text := Produto.Apresentacao;
    //edDescricao.Text := Produto.Descricao;

  end
end;

function TformProdutosView.CreateController: ISearchController;
begin
Result := TControllerProduto.Create;
end;

procedure TformProdutosView.dbgridPesquisaDblClick(Sender: TObject);
var
ProdutoID : Integer;
begin
  inherited;
  ProdutoID := FDataSource.DataSet.FieldByName('id').AsInteger;
  CarregarProduto(ProdutoID);
end;

procedure TformProdutosView.FormShow(Sender: TObject);
begin
  inherited;
  SearchBar.Controller := FController;
  SearchBar.DataSource := FDataSource;
  SearchBar.ConfigureFilterFields(['APRESENTACAO','GGREM']);
  dbGridPesquisa.Columns.Clear;
end;

function TformProdutosView.MakeObjectfromFields: TProduto;
var
  Produto : TProduto;
begin
  FillChar(Result, SizeOf(TProduto), 0);
  Produto := TProduto.Create(
  StrToIntDef(edId.Text,0),
  StrToIntDef(edGGREM.Text,0),
  StrToIntDef(edCATMAT.Text,0),
  edApresentacao.Text//,
  //edDescricao.Text)
  )
end;
procedure TformProdutosView.operationsBarspeedNovoClick(Sender: TObject);
begin
  inherited;
    Fields.ActivePage := tabPrincipal;
    edApresentacao.SetFocus;
    LimparCampos;
end;

procedure TformProdutosView.Save;
var
  Produto: TProduto;
begin
    inherited;
  Produto := MakeObjectfromFields;
  (FController as IController<TProduto>).ProcessarEntidade(Produto);
  FController.LoadData;

end;

end.
