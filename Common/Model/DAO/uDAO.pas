unit uDAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Param,
  FireDAC.Phys.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider;

type
  TDataModule1 = class(TDataModule)
    dsMunicipio: TDataSource;
    dsUsuario: TDataSource;
    queryUsuario: TFDQuery;
    queryMunicipio: TFDQuery;
    FDConnection1: TFDConnection;
    DataSetProvider1: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDataConService;

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
 Connection: TFDConnection;
 DataSource: TDataSource;
begin
  inherited;
  Connection := TDataConService.GetInstance.GetConnection;


end;
end.
