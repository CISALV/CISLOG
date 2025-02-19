unit uControllerCompras;

interface

uses uInterfaces,Data.DB,uDAOMunicipio,uDAOMockProduto;

type
 TControllerCompras = class(TInterfacedObject,ISearchController)
 private
 FDAO: TDAOMockProduto;
 public
  function FilterDataSet(const AFieldName, ASearchText: string) : TDataset;
  function LoadData: TDataset;
 end;

implementation


{ TControllerCompras }


function TControllerCompras.FilterDataSet(const AFieldName, ASearchText: string): TDataset;
begin
 FDAO := TDAOMockProduto.Create;
 Result := FDAO.GetWhere(AFieldName, ASearchText);
end;

function TControllerCompras.LoadData: TDataset;
begin
  FDAO := TDAOMockProduto.Create;
  Result := FDAO.GetAll;
end;


end.
