unit uControllerProduto;

interface

uses
  uDAOProduto, System.SysUtils, uProduto, Dialogs, uInterfaces, Data.DB;

type
  TControllerProduto = class(TInterfacedObject, IController<TProduto>, ISearchController)
  private
    FDAOProduto: TDAOProduto;
    FProduto: TProduto;
  public
    constructor Create;
    destructor Destroy; override;

    function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    function LoadData: TDataSet;

    function ReturnEntity(ProdutoID: Integer): TProduto;
    procedure PersistEntity(AProduto: TProduto);
    procedure RemoveEntity(ProdutoID: Integer);
  end;

implementation

{ TControllerProduto }

constructor TControllerProduto.Create;
begin
  //FDAO := TDAOProduto.Create;
end;

destructor TControllerProduto.Destroy;
begin
  //FDAO.Free;
  inherited;
end;

function TControllerProduto.FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
begin
  Result := FDAOProduto.GetWhere(AFieldName, ASearchText);
end;

function TControllerProduto.LoadData: TDataSet;
begin
  Result := FDAOProduto.GetAll;
end;

function TControllerProduto.ReturnEntity(ProdutoID: Integer): TProduto;
var
  Produto: TProduto;
begin
  Produto := FDAOProduto.GetByID(ProdutoID);
  if (Produto <> nil) and (Produto.Id > 0) then
    Result := Produto
  else
    Result := nil;
end;

procedure TControllerProduto.PersistEntity(AProduto: TProduto);
begin
  if (AProduto.apresentacao = '') then
  begin
    ShowMessage('Todos os campos são necessários');
    Exit;
  end;

  if AProduto.Id = 0 then
    FDAOProduto.Insert(AProduto)
  else
    FDAOProduto.Update(AProduto);
end;

procedure TControllerProduto.RemoveEntity(ProdutoID: Integer);
begin
  FDAOProduto.Delete(ProdutoID);
end;

end.

