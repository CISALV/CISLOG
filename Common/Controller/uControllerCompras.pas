unit uControllerCompras;

interface

uses uInterfaces,Data.DB,uDAOMunicipio;

type
 TControllerCompras = class(TInterfacedObject,ISearchController)
  function FilterDataSet(const AFieldName, ASearchText: string) : TDataset;
  function LoadData: TDataset;
 end;

implementation


{ TControllerCompras }

function TControllerCompras.FilterDataSet(const AFieldName, ASearchText: string): TDataset;
var
 DAO : TDAOMunicipio;
begin
 DAO := TDAOMunicipio.Create;
 Result := DAO.Search(AFieldName, ASearchText);
end;

function TControllerCompras.LoadData: TDataset;
var
  DAO : TDAOMunicipio;
begin
  DAO := TDAOMunicipio.Create;
  Result := DAO.GetAll;
end;


end.
