unit uControllerHabilitacao;

interface

uses Data.DB,uInterfaces, uDAOGerenciarPedidos;

type
 TControllerHabilitacao = class(TInterfacedObject, ISearchController)
 private
 FDAO: TDAOGerenciarPedidos;
 public
 constructor Create;
 destructor Destroy;

  function FilterDataSet(const AFieldName, ASearchText: string) : TDataset;
  function LoadData: TDataSet;
 end;


implementation

{ TControllerHabilitacao }


function TControllerHabilitacao.LoadData: TDataSet;
begin
  Result := FDAO.GetAll;
end;

{ TControllerHabilitacao }

constructor TControllerHabilitacao.Create;
begin
  FDAO := TDAOGerenciarPedidos.Create;
end;

destructor TControllerHabilitacao.Destroy;
begin

end;

function TControllerHabilitacao.FilterDataSet(const AFieldName,
  ASearchText: string): TDataset;
begin

end;

end.
