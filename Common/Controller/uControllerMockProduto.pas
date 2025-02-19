unit uControllerMockProduto;

interface

uses uMockProduto, uMasterController, uDAOMockProduto, Dialogs, uInterfaces,
  Data.DB;

type
  TControllerMockProduto = class(TMasterController<TMockProduto>)

  public
    function ReturnEntity(EntityID: Integer): TMockProduto;
    procedure PersistEntity(AEntity: TMockProduto);
    constructor Create;
    destructor Destroy;

  end;

implementation

{ TControllerMockProduto }

constructor TControllerMockProduto.Create;
begin
  inherited;
  FDAO := TDAOMockProduto.Create;
  Searchbar.ConfigureFilterFields(['APRESENTACAO','GGREM']);
end;

destructor TControllerMockProduto.Destroy;
begin
  //
  inherited;
end;

procedure TControllerMockProduto.PersistEntity(AEntity: TMockProduto);
begin
  FDAO.Insert(AEntity);
end;

function TControllerMockProduto.ReturnEntity(EntityID: Integer): TMockProduto;
begin
  FDAO.GetByID(EntityID);
end;

end.
