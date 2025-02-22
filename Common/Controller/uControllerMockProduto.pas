unit uControllerMockProduto;

interface

uses uMockProduto, uBaseCRUDController, uDAOMockProduto, Dialogs, uInterfaces,
  Data.DB;

type
  TControllerMockProduto = class(TBaseCRUDController<TMockProduto>)

  public
    function Get(EntityID: Integer): TMockProduto;
    procedure Save(AEntity: TMockProduto);
    constructor Create;

  end;

implementation

{ TControllerMockProduto }

constructor TControllerMockProduto.Create;
begin
  inherited;
  FDAO := TDAOMockProduto.Create;
end;

procedure TControllerMockProduto.Save(AEntity: TMockProduto);
begin
    if  AEntity.GGREM = 0 then
    FDAO.Insert(AEntity)
  else
    FDAO.Update(AEntity);
end;

function TControllerMockProduto.Get(EntityID: Integer): TMockProduto;
begin
  FDAO.GetByID(EntityID);
end;

end.
