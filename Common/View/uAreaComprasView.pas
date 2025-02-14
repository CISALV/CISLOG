unit uAreaComprasView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterform, uMasterFrame,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.WinXPanels, Vcl.StdCtrls, Data.FMTBcd,
  Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Buttons, uframeSearch, uControllerCompras;

type
  TformComprasView = class(TFormMaster)
    dbGridProdutos: TDBGrid;
    Tabs: TCardPanel;
    tabCompra: TCard;
    tabCarrinho: TCard;
    dbGridCarrinho: TDBGrid;
    Panel1: TPanel;
    dsBaseVigencia: TDataSource;
    DBMemo1: TDBMemo;
    memCarrinho: TFDMemTable;
    dsCarrinho: TDataSource;
    memCarrinhoId: TIntegerField;
    memCarrinhoNome: TStringField;
    speedCarrinho: TSpeedButton;
    Panel2: TPanel;
    speedVoltar: TSpeedButton;
    speedRemoverItem: TSpeedButton;
    SearchBar: TframeSearch;
    speedLimpar: TSpeedButton;
    procedure dbGridProdutosDblClick(Sender: TObject);
    procedure speedCarrinhoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SearchBaredSearchChange(Sender: TObject);
    procedure speedVoltarClick(Sender: TObject);
    procedure speedLimparClick(Sender: TObject);
    procedure speedRemoverItemClick(Sender: TObject);
  private
   FQuery : TFDQuery;
  public
    { Public declarations }
  end;

var
  formComprasView: TformComprasView;

implementation

{$R *.dfm}

uses uDataConService;


procedure TformComprasView.dbGridProdutosDblClick(Sender: TObject);
var
  i: Integer;
  IdProduto: Integer;
  baseProduto, cartProduto: TField;
  QuantityStr: string;
  Quantity: Integer;
begin
  inherited;
  IdProduto := dsBaseVigencia.Dataset.FieldByName('id').AsInteger;

  //logica de negocios irá para o Service
  memCarrinho.Open;

  if memCarrinho.Locate('Id', IdProduto, []) then
  begin
    ShowMessage('Este Produto já está no carrinho!');
    Exit;
  end;

  QuantityStr := '';
  if not InputQuery('Quantidade', 'Por favor, insira a quantidade:', QuantityStr) then
    Exit;


  if not TryStrToInt(QuantityStr, Quantity) or (Quantity <= 0) then
  begin
    ShowMessage('Quantidade inválida. Insira um número positivo.');
    Exit;
  end;

  Tabs.ActiveCard := tabCarrinho;

  memCarrinho.Append;

  //transformar isso em função(inserirProduto?)
  for i := 0 to dsBaseVigencia.DataSet.FieldCount - 1 do
  begin
    baseProduto := dsBaseVigencia.Dataset.Fields[i];
    cartProduto := memCarrinho.FindField(baseProduto.FieldName);
    if Assigned(cartProduto) then
      cartProduto.Value := baseProduto.Value;
  end;

  memCarrinho.FieldByName('ID').AsInteger := Quantity;
  // trocar para quantidade.

  memCarrinho.Post;
end;

procedure TformComprasView.FormCreate(Sender: TObject);
var
  Controller : TControllerCompras;
begin
  inherited;

  Controller := TControllerCompras.Create;

  Tabs.ActiveCard := tabCompra;

  SearchBar.Controller := Controller;
  SearchBar.DataSource := dsBaseVigencia;
  SearchBar.ConfigureFilterFields(['NOME','CNPJ']);


  dsBaseVigencia.DataSet := Controller.LoadData;

end;

procedure TformComprasView.SearchBaredSearchChange(Sender: TObject);
begin
  inherited;
  SearchBar.edSearchChange(Sender);
  Tabs.ActiveCard := tabCompra;
end;

procedure TformComprasView.speedLimparClick(Sender: TObject);
begin
  inherited;
  memCarrinho.DisableControls;
  try
    memCarrinho.EmptyDataSet;
  finally
  memCarrinho.EnableControls;
  end;
end;

procedure TformComprasView.speedRemoverItemClick(Sender: TObject);
begin
  inherited;
  { Controller > Service }
 if not memCarrinho.IsEmpty then
 memCarrinho.Delete;
end;

procedure TformComprasView.speedCarrinhoClick(Sender: TObject);
begin
  inherited;
  { Controller > Service }
  Tabs.ActiveCard := tabCarrinho;
  SearchBar.edSearch.Text := '';

end;
procedure TformComprasView.speedVoltarClick(Sender: TObject);
begin
  inherited;
 tabs.ActiveCard := tabCompra;
end;

end.
