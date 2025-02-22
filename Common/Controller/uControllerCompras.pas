unit uControllerCompras;

interface

uses uInterfaces,Data.DB,uDAOMunicipio,uDAOMockProduto,uMockProduto;

type
 TControllerCompras= class(TInterfacedObject,ISearchController)
 private
 FDAO: TDAOMockProduto;
 public
  constructor Create;
  function GetFiltered(const AFieldName, ASearchText: string) : TDataset;
  function GetAll: TDataset;
 end;

implementation


{ TControllerCompras }


constructor TControllerCompras.Create;
begin
  FDAO := TDAOMockProduto.Create;
end;


function TControllerCompras.GetFiltered(const AFieldName, ASearchText: string): TDataset;
begin
 Result := FDAO.GetWhere(AFieldName, ASearchText);
end;

function TControllerCompras.GetAll: TDataset;
begin
  Result := FDAO.GetAll;
end;


end.
