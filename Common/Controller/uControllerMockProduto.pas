unit uControllerMockProduto;

interface

uses uMockProduto, uBaseCRUDController, uDAOMockProduto, Dialogs, uInterfaces,
  Data.DB;

type
  TControllerMockProduto = class(TBaseCRUDController<TMockProduto>)

  public
    function ReturnEntity(EntityID: Integer): TMockProduto;
    procedure PersistEntity(AEntity: TMockProduto);
    constructor Create;

  end;

implementation

{ TControllerMockProduto }

constructor TControllerMockProduto.Create;
begin
  inherited;
  FDAO := TDAOMockProduto.Create;
end;

procedure TControllerMockProduto.PersistEntity(AEntity: TMockProduto);
begin
    if  AEntity.GGREM = 0 then
    FDAO.Insert(AEntity)
  else
    FDAO.Update(AEntity);
end;

function TControllerMockProduto.ReturnEntity(EntityID: Integer): TMockProduto;
begin
  FDAO.GetByID(EntityID);
end;

end.
