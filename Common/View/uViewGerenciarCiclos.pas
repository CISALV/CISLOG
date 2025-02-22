unit uViewGerenciarCiclos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, Data.DB, uMasterFrame,
  uframeSearch, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,uInterfaces,
  uControllerHabilitacao;

type
  TformViewGerenciarCiclo = class(TformMaster)
    PageControl1: TPageControl;
    tabHabilitação: TTabSheet;
    Panel1: TPanel;
    speedHabilitar: TSpeedButton;
    speedSelection: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    frameSearch1: TframeSearch;
    frameSearch2: TframeSearch;
  private
    FController : ISearchController;
    FDataSource : TDataSource;
  public
    constructor Create;
  end;

var
  formViewGerenciarCiclo: TformViewGerenciarCiclo;

implementation

{$R *.dfm}

{ TformViewGerenciarCiclo }

constructor TformViewGerenciarCiclo.Create;
begin
  FController := TControllerHabilitacao.Create;

  FDataSource := TDataSource.Create(Self);
  try
    FDataSource.DataSet := FController.GetAll;
  except
    on E: Exception do
    begin
      ShowMessage('Error: ' + E.Message);
    end;
  end;

  DbGrid1.DataSource := FDataSource;
  frameSearch1.Controller := FController;
  frameSearch1.DataSource := FDataSource;
end;

end.
