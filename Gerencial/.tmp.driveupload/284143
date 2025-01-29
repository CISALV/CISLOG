unit uMunicipioCRIS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRIS, Data.DB, Vcl.ComCtrls,
  uframeSearchBar, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, uMasterFrame,
  uframeOperationsBar, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDataConService,uframeMunicipioFields, uMunicipioFieldCriar,uMunicipioFieldEditar,uFormFactory;

type
  TformMunicipioCRIS = class(TformMasterCRIS)
    procedure SearchBareditChange(Sender: TObject);
    function getFilter: String;
    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure operationsBarspeedEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    { Public declarations }
  end;

var
  formMunicipioCRIS: TformMunicipioCRIS;
  Query : TFDQuery;
  dsMunicipio: TDataSource;

implementation

{$R *.dfm}

procedure TformMunicipioCRIS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 Query.Close;
end;

procedure TformMunicipioCRIS.FormShow(Sender: TObject);
begin
  inherited;
  if TDataConService.GetInstance.GetQuery.Active then
    TDataConService.GetInstance.GetQuery.Close;

  Query := TDataConService.GetInstance.GetQuery;
  dsMunicipio := TDataSource.Create(nil);
  dsMunicipio.DataSet := Query;
  dbGridPesquisa.DataSource := dsMunicipio;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM MUNICIPIO');
  Query.Open;

end;

function TformMunicipioCRIS.getFilter: String;
begin

    case SearchBar.combox.ItemIndex of
    0: Result := 'NOME';
    1: Result := 'CNPJ';

    else result := 'NOME';
    end;

end;

procedure TformMunicipioCRIS.operationsBarspeedEditarClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TMunicipioEditar ,panelLateral);
end;

procedure TformMunicipioCRIS.operationsBarspeedNovoClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TMunicipioCriar,panelLateral);
  end;

procedure TformMunicipioCRIS.SearchBareditChange(Sender: TObject);
begin
  inherited;
  if Searchbar.edit.Text <> '' then
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('select id, nome, CNPJ from municipio where '+getFilter+' containing :parametro');
    Query.ParamByName('parametro').Value := SearchBar.Edit.Text;
    Query.Open;
  end
   else
   begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM MUNICIPIO');
    Query.Open;
  end

end;
end.
