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

    function GetFiltered(const AFieldName, ASearchText: string): TDataSet;
    function GetAll :TDataSet; virtual;
    procedure Delete(EntityID: Integer); virtual;
    function Get(EntityID: Integer): T; virtual; abstract;
    procedure Save(AEntity: T); virtual; abstract;

  end;
implementation

function TBaseCRUDController<T>.GetFiltered(const AFieldName,
  ASearchText: string): TDataSet;
begin
 Result := FDAO.GetWhere(AFieldName,ASearchText);
end;

function TBaseCRUDController<T>.GetAll: TDataSet;
begin
 Result := FDAO.GetAll;
end;

procedure TBaseCRUDController<T>.Delete(EntityID: Integer);
begin
 FDAO.Delete(EntityID);
end;

end.
