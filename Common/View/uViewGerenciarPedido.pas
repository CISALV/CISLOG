unit uViewGerenciarPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, Vcl.StdCtrls, Data.DB,
  uMasterFrame, uframeSearch, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.DApt, Vcl.Mask, FireDAC.Phys.FB, FireDAC.Phys.FBDef, Vcl.DBCtrls;

type
  TformGerenciarPedido = class(TformMaster)
    PageControl1: TPageControl;
    tabGerenciar: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    frameSearch1: TframeSearch;
    frameSearch2: TframeSearch;
    Panel1: TPanel;
    speedSelection: TSpeedButton;
    speedHabilitar: TSpeedButton;
    tabCriar: TTabSheet;
    tabRelatorios: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formGerenciarPedido: TformGerenciarPedido;

implementation



{$R *.dfm}

uses uDataConService;

procedure TformGerenciarPedido.FormCreate(Sender: TObject);
var
 Query: TFDQuery;
 DataSource: TDataSource;
begin
  inherited;
  Query := TDataConService.GetInstance.GetQuery;
  Query.Close;
  Query.SQL.Text := ('SELECT * FROM MUNICIPIO');
  Query.Open;
  DataSource := TDataSource.Create(nil);
  DataSource.DataSet := Query;

  //qryUsuario.Connection := TDataConService.GetInstance.GetConnection;

  dbGrid1.DataSource := DataSource;
  dbGrid1.Enabled := True;
end;

end.
