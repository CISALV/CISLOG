unit uViewProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ComCtrls, uframePages,uInterfaces,uProduto;

type
  TformViewProduto = class(TformMasterCRUDView)
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
    procedure Delete; override;
  private
    function MakeObjectfromFields: TProduto;
  protected
   function CreateController : ISearchController; override;
   procedure CarregarProduto(ProdutoId: Integer);

  public
    { Public declarations }
  end;

var
  formViewProduto: TformViewProduto;

implementation

{$R *.dfm}

uses uControllerProduto;

procedure TformViewProduto.CarregarProduto(ProdutoId: Integer);
var
  Produto : TProduto;
begin
  Produto := (FController as IController<TProduto>).ReturnEntity(ProdutoID);
  if Produto.Id > 0 then
  begin
    edId.Text := IntToStr(ProdutoID);
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

procedure TformViewProduto.dbgridPesquisaDblClick(Sender: TObject);
var
ProdutoID : Integer;
begin
  inherited;
  ProdutoID := FDataSource.DataSet.FieldByName('id').AsInteger;
  CarregarProduto(ProdutoID);
end;

procedure TformViewProduto.Delete;
var
  Id: Integer;
begin
  inherited;
  Id := StrtoInt(edId.Text);
  (FController as IController<TProduto>).RemoveEntity(Id);   //this is ugly
  FController.LoadData;
end;

procedure TformViewProduto.FormShow(Sender: TObject);
begin
  inherited;
  SearchBar.Controller := FController;
  SearchBar.DataSource := FDataSource;
  SearchBar.ConfigureFilterFields(['APRESENTACAO','GGREM']);
  dbGridPesquisa.Columns.Clear;
end;

function TformViewProduto.MakeObjectfromFields: TProduto;
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
  Produto := MakeObjectfromFields;
  (FController as IController<TProduto>).PersistEntity(Produto);
  FController.LoadData;

end;

end.
