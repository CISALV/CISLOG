unit uControllerProduto;

interface

uses
  uDAOProduto, System.SysUtils, uProduto, Dialogs, uInterfaces,uBaseCRUDController, Data.DB;

type
  TControllerProduto = class(TBaseCRUDController<TProduto>)
  private
    FDAOProduto: TDAOProduto;
    FProduto: TProduto;
  public
    constructor Create;
    destructor Destroy; override;

    function Get(ProdutoID: Integer): TProduto; override;
    procedure Save(AProduto: TProduto); override;
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

function TControllerProduto.Get(ProdutoID: Integer): TProduto;
var
  Produto: TProduto;
begin
  Produto := FDAOProduto.GetByID(ProdutoID);
  if (Produto <> nil) and (Produto.Id > 0) then
    Result := Produto
  else
    Result := nil;
end;

procedure TControllerProduto.Save(AProduto: TProduto);
begin
  if (AProduto.apresentacao = '') then
  begin
    ShowMessage('Todos os campos s�o necess�rios');
    Exit;
  end;

  if AProduto.Id = 0 then
    FDAO.Insert(AProduto)
  else
    FDAO.Update(AProduto);
end;

end.

