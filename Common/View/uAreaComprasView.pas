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
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    FDMemTable1: TFDMemTable;
    DataSource2: TDataSource;
    FDMemTable1Id: TIntegerField;
    FDMemTable1Nome: TStringField;
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
  srcField, destField: TField;
begin
  inherited;
  IdProduto := DataSource1.Dataset.FieldByName('id').AsInteger;

  FDMemTable1.Open;

    if FDMemTable1.Locate('Id', IdProduto, []) then
  begin
    ShowMessage('Este Produto já está no carrinho!');
    Exit
  end;

  Tabs.ActiveCard := tabCarrinho;

  FDMemTable1.Append;

  for i := 0 to DataSource1.DataSet.FieldCount - 1 do
  begin
    srcField := DataSource1.Dataset.Fields[i];
    destField := FDMemTable1.FindField(srcField.FieldName);
    if Assigned(destField) then
      destField.Value := srcField.Value;
  end;

  FDMemTable1.Post;


end;

procedure TformComprasView.FormCreate(Sender: TObject);
var
  Controller : TControllerCompras;
begin
  inherited;

  Controller := TControllerCompras.Create;

  Tabs.ActiveCard := tabCompra;

  SearchBar.Controller := Controller;
  SearchBar.DataSource := DataSource1;
  SearchBar.ConfigureFilterFields(['NOME','CNPJ']);


  DataSource1.DataSet := Controller.LoadData;

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
