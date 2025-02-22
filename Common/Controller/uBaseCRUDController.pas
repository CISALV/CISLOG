unit uBaseCRUDController;

interface

uses Dialogs,uInterfaces, Data.DB;

type
  TBaseCRUDController<T: class> = class abstract(TInterfacedObject, ICRUDController<T>,ISearchController)
  protected
  FDAO: IDAO<T>;
  public
    constructor Create; virtual; abstract;
    destructor Destroy; virtual; abstract;

    function FilterDataSet(const AFieldName, ASearchText: string): TDataSet;
    function LoadData :TDataSet; virtual;
    procedure RemoveEntity(EntityID: Integer); virtual;
    function ReturnEntity(EntityID: Integer): T; virtual; abstract;
    procedure PersistEntity(AEntity: T); virtual; abstract;

  end;
implementation

function TBaseCRUDController<T>.FilterDataSet(const AFieldName,
  ASearchText: string): TDataSet;
begin
 Result := FDAO.GetWhere(AFieldName,ASearchText);
end;

function TBaseCRUDController<T>.LoadData: TDataSet;
begin
 Result := FDAO.GetAll;
end;

procedure TBaseCRUDController<T>.RemoveEntity(EntityID: Integer);
begin
 FDAO.Delete(EntityID);
end;

end.
