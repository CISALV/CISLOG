unit uControllerCompras;

interface

uses uInterfaces,Data.DB,uDAOMunicipio,uDAOMockProduto;

type
 TControllerCompras = class(TInterfacedObject,ISearchController)
 private
 FDAO: TDAOMockProduto;
 public
  constructor Create;
  destructor Destroy;
  function FilterDataSet(const AFieldName, ASearchText: string) : TDataset;
  function LoadData: TDataset;
 end;

implementation


{ TControllerCompras }


constructor TControllerCompras.Create;
begin
  FDAO := TDAOMockProduto.Create;
end;

destructor TControllerCompras.Destroy;
begin
 FDAO.Free;
end;

function TControllerCompras.FilterDataSet(const AFieldName, ASearchText: string): TDataset;
begin
 Result := FDAO.GetWhere(AFieldName, ASearchText);
end;

function TControllerCompras.LoadData: TDataset;
begin
  Result := FDAO.GetAll;
end;


end.
