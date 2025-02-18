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
    function PopularView(ProdutoID: Integer): TProduto;

    procedure ProcessarEntidade(AProduto: TProduto);
    procedure AtualizarEntidade(AProduto: TProduto);
    procedure RemoverEntidade(ProdutoID: Integer);
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

function TControllerProduto.PopularView(ProdutoID: Integer): TProduto;
var
  Produto: TProduto;
begin
  Produto := FDAOProduto.GetByID(ProdutoID);
  if (Produto <> nil) and (Produto.Id > 0) then
    Result := Produto
  else
    Result := nil;
end;

procedure TControllerProduto.ProcessarEntidade(AProduto: TProduto);
begin
  if (AProduto.apresentacao = '') or (AProduto.CATMAT <= 0) then
  begin
    ShowMessage('Todos os campos são necessários');
    Exit;
  end;

  if AProduto.Id = 0 then
    FDAOProduto.Insert(AProduto)
  else
    FDAOProduto.Update(AProduto);
end;

procedure TControllerProduto.AtualizarEntidade(AProduto: TProduto);
var
  Success: Integer;
begin
  Success := FDAOProduto.Update(AProduto);
  if Success = 1 then
    ShowMessage('Produto atualizado com sucesso!')
  else
    ShowMessage('Falha ao atualizar o produto.');
end;

procedure TControllerProduto.RemoverEntidade(ProdutoID: Integer);
begin
  FDAOProduto.Delete(ProdutoID);
end;

end.

