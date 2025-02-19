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
    procedure UpdateEntity(AProduto: TProduto);
    procedure RemoveEntity(ProdutoID: Integer);
  end;

implementation

{ TControllerProduto }

constructor TControllerProduto.Create;
begin
  FDAOProduto := TDAOProduto.Create;
end;

destructor TControllerProduto.Destroy;
begin
  FDAOProduto.Free;
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

procedure TControllerProduto.UpdateEntity(AProduto: TProduto);
var
  Success: Integer;
begin
  Success := FDAOProduto.Update(AProduto);
  if Success = 1 then
    ShowMessage('Produto atualizado com sucesso!')
  else
    ShowMessage('Falha ao atualizar o produto.');
end;

procedure TControllerProduto.RemoveEntity(ProdutoID: Integer);
begin
  FDAOProduto.Delete(ProdutoID);
end;

end.

