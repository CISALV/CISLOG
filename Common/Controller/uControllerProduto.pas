unit uControllerProduto;

interface

uses uMasterController, uProduto, uDAOProduto,uInterfaces,System.SysUtils,Dialogs;

type
TControllerProduto = class(TMasterController<TProduto>)
private
 FDAO: IDAO<TProduto>;
 public
 constructor Create; override;
 destructor Destroy; override;

    function PopularView(EntityID: Integer): TProduto; override;
    procedure ProcessarEntidade(AEntity: TProduto); override;

end;
implementation

{ TControllerProdutos }

constructor TControllerProduto.Create;
begin
  inherited;
  FDAO := TDAOProduto.Create;
end;

destructor TControllerProduto.Destroy;
begin
  inherited;
end;

function TControllerProduto.PopularView(EntityID: Integer): TProduto;
var
 Produto : TProduto;
begin
  Produto := FDAO.GetByID(EntityID);
  if EntityID > 0 then
    Result := Produto;
end;

procedure TControllerProduto.ProcessarEntidade(AEntity: TProduto);
begin
  inherited;
  if (AEntity.apresentacao = '') or (AEntity.CATMAT <= 0) then
  begin
    ShowMessage('Todos os campos são necessários');
    Exit;
  end;

  if  AEntity.id = 0 then
    FDAO.Insert(AEntity)
  else
    FDAO.Update(AEntity);

end;

end.
