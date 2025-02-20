unit uControllerProduto;

interface

uses
  uDAOProduto, System.SysUtils, uProduto, Dialogs, uInterfaces,uMasterController, Data.DB;

type
  TControllerProduto = class(TMasterCRUDController<TProduto>)
  private
    FProduto: TProduto;
  public
    constructor Create(ADAO: IDAO<TProduto>);

    function ReturnEntity(ProdutoID: Integer): TProduto;
    procedure PersistEntity(AProduto: TProduto);
  end;

implementation

{ TControllerProduto }

constructor TControllerProduto.Create(ADAO: IDAO<TProduto>);
begin
  FDAO := ADAO;
end;


function TControllerProduto.ReturnEntity(ProdutoID: Integer): TProduto;
var
  Produto: TProduto;
begin
  Produto := FDAO.GetByID(ProdutoID);
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
    FDAO.Insert(AProduto)
  else
    FDAO.Update(AProduto);
end;

end.

