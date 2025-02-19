unit uMasterController;

interface

uses Dialogs,uInterfaces, Data.DB;

type
  TMasterController<T: class> = class abstract(TInterfacedObject, IController<T>,ISearchController)
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


function TMasterController<T>.FilterDataSet(const AFieldName,
  ASearchText: string): TDataSet;
begin
 Result := FDAO.GetWhere(AFieldName,ASearchText);
end;

function TMasterController<T>.LoadData: TDataSet;
begin
 Result := FDAO.GetAll;
end;

procedure TMasterController<T>.RemoveEntity(EntityID: Integer);
begin
 FDAO.Delete(EntityID);
end;

end.
