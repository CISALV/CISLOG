unit uAreaComprasView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterform, uMasterFrame,
  uframeSearchCompras, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TformComprasView = class(TFormMaster)
    SearchCompras1: TSearchCompras;
    dbGridProdutos: TDBGrid;
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
