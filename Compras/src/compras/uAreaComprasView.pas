unit uAreaComprasView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterform, uMasterFrame,
  uframeSearchCompras, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.WinXPanels, Vcl.StdCtrls;

type
  TformComprasView = class(TFormMaster)
    SearchCompras1: TSearchCompras;
    dbGridProdutos: TDBGrid;
    Tabs: TCardPanel;
    tabBaseVigencia: TCard;
    Card1: TCard;
    dbGridCarrinho: TDBGrid;
    Panel1: TPanel;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formComprasView: TformComprasView;

implementation

{$R *.dfm}

end.
