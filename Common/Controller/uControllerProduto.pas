unit uControllerProduto;

interface

uses
  uDAOProduto, System.SysUtils, uProduto, Dialogs, uInterfaces,
  uBaseCRUDController, Data.DB;

type
  TControllerProduto = class//(TBaseCRUDController<TProduto>)
  private
    // FProduto: TProduto;
  public
    constructor Create;
    destructor Destroy; override;

    //function Get(ProdutoID: Integer): TProduto; override;
    //procedure Save(AProduto: TProduto); override;
  end;

implementation

{ TControllerProduto }

constructor TControllerProduto.Create;
begin
  //FDAO := TDAOProduto.Create;
end;

destructor TControllerProduto.Destroy;
begin
  inherited;
end;
{
function TControllerProduto.Get(ProdutoID: Integer): TProduto;
var
  Produto: TProduto;
begin
  Produto := FDAO.GetByID(ProdutoID);

  if Produto.Id > 0 then
    Result := Produto;
end;

procedure TControllerProduto.Save(AProduto: TProduto);
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
}

end.
