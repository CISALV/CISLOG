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
  TSearchCompras = class(TframeSearch)
    private
    FController: TControllerCompras;

    protected
      procedure ExecFiltering(const AFilterField, ASearchText: string); override;
    public
      procedure ReloadData; override;
  end;


  TformComprasView = class(TFormMaster)
    dbGridProdutos: TDBGrid;
    Tabs: TCardPanel;
    tabBaseVigencia: TCard;
    Carrinho: TCard;
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
    speedLimpar: TSpeedButton;
    speedRemoveItem: TSpeedButton;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure dbGridProdutosDblClick(Sender: TObject);
    procedure SearchCompras1edPesquisaChange(Sender: TObject);
    procedure speedCarrinhoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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

  Tabs.ActiveCard := Carrinho;

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

procedure TformComprasView.FormShow(Sender: TObject);
begin
  inherited;
  FQuery := TDataConService.GetInstance.GetQuery;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT * FROM MUNICIPIO');
  FQuery.Open;
  DataSource1.DataSet := FQuery;

  Tabs.ActiveCard := tabBaseVigencia;
end;

procedure TformComprasView.SearchCompras1edPesquisaChange(Sender: TObject);
begin
  inherited;
  tabs.ActiveCard := TabBaseVigencia;

end;

procedure TformComprasView.speedCarrinhoClick(Sender: TObject);
begin
  inherited;
  Tabs.ActiveCard := Carrinho;
end;
procedure TformComprasView.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;

  FQuery.Close;
  FQuery.Open;

  Timer1.Enabled := True;

end;

{ TSearchCompras }

procedure TSearchCompras.ExecFiltering(const AFilterField, ASearchText: string);
begin
  inherited;
  DataSource1.DataSet :=
end;

procedure TSearchCompras.ReloadData;
begin
  inherited;

end;

end.
