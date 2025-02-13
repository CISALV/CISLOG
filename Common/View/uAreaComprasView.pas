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
    speedRemoveItem: TSpeedButton;
    SearchBar: TframeSearch;
    SpeedButton1: TSpeedButton;
    procedure dbGridProdutosDblClick(Sender: TObject);
    //procedure SearchCompras1edPesquisaChange(Sender: TObject);
    procedure speedCarrinhoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SearchBaredSearchChange(Sender: TObject);
    procedure speedVoltarClick(Sender: TObject);
    //procedure AdicionarPruduto();
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
  baseProduto, carrtProduto: TField;
begin
  inherited;
  IdProduto := dsBaseVigencia.Dataset.FieldByName('id').AsInteger;

  memCarrinho.Open;

    if memCarrinho.Locate('Id', IdProduto, []) then
  begin
    ShowMessage('Este Produto já está no carrinho!');
    Exit
  end;

  Tabs.ActiveCard := tabCarrinho;

  memCarrinho.Append;

  for i := 0 to dsBaseVigencia.DataSet.FieldCount - 1 do
  begin
    baseProduto := dsBaseVigencia.Dataset.Fields[i];
    carrtProduto := memCarrinho.FindField(baseProduto.FieldName);
    if Assigned(carrtProduto) then
      carrtProduto.Value := baseProduto.Value;
  end;

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

procedure TformComprasView.speedCarrinhoClick(Sender: TObject);
begin
  inherited;
  Tabs.ActiveCard := tabCarrinho;
  SearchBar.edSearch.Text := '';

end;
procedure TformComprasView.speedVoltarClick(Sender: TObject);
begin
  inherited;
 tabs.ActiveCard := tabCompra;
end;

end.
