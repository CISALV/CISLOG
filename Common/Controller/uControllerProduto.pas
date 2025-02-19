unit uControllerProduto;

interface

uses
  uDAOProduto, System.SysUtils, uProduto, Dialogs, uInterfaces,uMasterController, Data.DB;

type
  TControllerProduto = class(TMasterCRUDController<TProduto>)
  private
    FDAOProduto: TDAOProduto;
    FProduto: TProduto;
  public
    constructor Create;
    destructor Destroy; override;

    function ReturnEntity(ProdutoID: Integer): TProduto;
    procedure PersistEntity(AProduto: TProduto);
  end;

implementation

{ TControllerProduto }

constructor TControllerProduto.Create;
begin
  FDAO := TDAOProduto.Create;
end;

destructor TControllerProduto.Destroy;
begin
  //FDAO.Free;
  inherited;
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
    ShowMessage('Todos os campos s�o necess�rios');
    Exit;
  end;

  if AProduto.Id = 0 then
    FDAOProduto.Insert(AProduto)
  else
    FDAOProduto.Update(AProduto);
end;

end.

