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
  Vcl.DBCtrls, Vcl.Buttons, uframeSearch, uControllerCompras, uInterfaces;

type
  TformComprasView = class(TformMaster)
    dbGridProdutos: TDBGrid;
    dbGridCarrinho: TDBGrid;
    pnlFooter: TPanel;
    dsBaseVigencia: TDataSource;
    memCart: TFDMemTable;
    dsCarrinho: TDataSource;
    pnlCartOptions: TPanel;
    speedVoltar: TSpeedButton;
    speedRemoverItem: TSpeedButton;
    SearchBar: TframeSearch;
    speedLimpar: TSpeedButton;
    memCartquantidade: TIntegerField;
    memCartApresentacao: TStringField;
    memCartValor: TFloatField;
    lblTotalValue: TLabel;
    Label2: TLabel;
    memoDescricao: TDBMemo;
    pnlCart: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    pnlTotal: TPanel;
    pnlTopCart: TPanel;
    procedure dbGridProdutosDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SearchBaredSearchChange(Sender: TObject);
    procedure speedVoltarClick(Sender: TObject);
    procedure speedLimparClick(Sender: TObject);
    procedure speedRemoverItemClick(Sender: TObject);
    procedure UpdateTotal;
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);

    function ConfirmationDialog(const Msg: string): Boolean;

  private
   FQuery : TFDQuery;
   FController : ISearchController;

  procedure InsertProduct(Quantity: Integer);
  public
  end;

var
  formComprasView: TformComprasView;

implementation

{$R *.dfm}

uses uDataConService;


function TformComprasView.ConfirmationDialog(const Msg: string): Boolean;
begin
 Result := MessageDlg(msg,mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;



procedure TformComprasView.dbGridProdutosDblClick(Sender: TObject);
var
  IdProduto: string;
  QuantityStr: string;
  Quantity: Integer;
begin
  inherited;
  IdProduto := dsBaseVigencia.Dataset.FieldByName('Apresentacao').AsString;
  Searchbar.Clear;


  //logica de negocios irá para o Service
  memCart.Open;

  if memCart.Locate('Apresentacao', IdProduto, []) then
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


  memCart.Append;
  InsertProduct(Quantity);
end;


procedure TformComprasView.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
  var
    Col : TColumn;
  begin
  inherited;

end;

procedure TformComprasView.InsertProduct(Quantity: Integer);
var
  i: Integer;
  baseProduto: TField;
  cartProduto: TField;
begin

  for i := 0 to dsBaseVigencia.DataSet.FieldCount - 1 do
  begin
    baseProduto := dsBaseVigencia.Dataset.Fields[i];
    cartProduto := memCart.FindField(baseProduto.FieldName);
    if Assigned(cartProduto) then
      cartProduto.Value := baseProduto.Value;
  end;
  memCart.FieldByName('quantidade').AsInteger := Quantity;
  memCart.Post;
  UpdateTotal;
end;

procedure TformComprasView.FormCreate(Sender: TObject);

begin
  inherited;

  FController := TControllerCompras.Create;

  SearchBar.Controller := FController;
  SearchBar.DataSource := dsBaseVigencia;
  SearchBar.ConfigureFilterFields(['APRESENTACAO','GGREM']);
  dsBaseVigencia.DataSet := FController.GetAll;

end;

procedure TformComprasView.FormShow(Sender: TObject);
var
Col : TColumn;
f : TFloatField;
begin
  inherited;
    dbGridProdutos.Columns.Clear;
    f := dsBaseVigencia.Dataset.FieldByName('Valor') as TFloatField;
    f.DisplayFormat := 'R$#,##0.00';

    memCartValor.DisplayFormat := 'R$#,##0.00';

  Col := dbGridProdutos.Columns.Add;
  Col.FieldName := 'Apresentacao';
  Col.Title.Caption := 'Descrição';
  Col.Width := Round(DbGridProdutos.ClientWidth * 0.4);

  Col := dbGridProdutos.Columns.Add;
  Col.FieldName := 'Valor';
  Col.Title.Caption := 'Valor';
  Col.Width := Round(DbGridProdutos.ClientWidth * 0.1);

  Col := dbGridProdutos.Columns.Add;
  Col.FieldName := 'Quantidade_restante';
  Col.Title.Caption := 'Quantidade Disponível';
  Col.Width := Round(DbGridProdutos.ClientWidth * 0.3);


end;

procedure TformComprasView.SearchBaredSearchChange(Sender: TObject);
begin
  inherited;
  SearchBar.edSearchChange(Sender);
end;

procedure TformComprasView.speedLimparClick(Sender: TObject);
begin
  inherited;
  memCart.DisableControls;
  if ConfirmationDialog('Isto irá excluir todos os itens do pedido. Deseja Confirmar a Operação?') then
  try
    memCart.EmptyDataSet;
    UpdateTotal;
  finally
  memCart.EnableControls;

  end;
end;

procedure TformComprasView.speedRemoverItemClick(Sender: TObject);
begin
  inherited;
  { Controller > Service }
 if ConfirmationDialog('Isto irá remover o item selecionado. Deseja Confirmar a Operação?') and not memCart.IsEmpty then
 memCart.Delete;
 UpdateTotal;
end;

procedure TformComprasView.speedVoltarClick(Sender: TObject);
begin
  inherited;
 SearchBar.Clear;
end;

procedure TformComprasView.UpdateTotal;
var
Total : Double;
begin
 Total := 0;
 memCart.DisableControls;
 try
  memCart.First;
  while not memCart.Eof do
  begin
    Total := Total + (memCart.FieldByName('Valor').AsFloat *
    memCart.FieldByName('quantidade').AsInteger);
    memCart.Next;
  end;
 finally
 memCart.EnableControls;
 end;
  lblTotalValue.Caption := FormatFloat('0.00', Total);
end;

end.
