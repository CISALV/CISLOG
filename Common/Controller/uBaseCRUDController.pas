unit uBaseCRUDController;

interface

uses uInterfaces, Data.DB, Vcl.Dialogs,SysUtils;

type
  TBaseCRUDController<T: class, IEntity> = class (TInterfacedObject, ICRUDController<T>,ISearchController)
  protected
  FDAO: IDAO<T>;
  public
    constructor Create(ADAO: IDAO<T>);

    function GetFiltered(const AFieldName, ASearchText: string): TDataSet;
    function GetAll :TDataSet; virtual;
    procedure Delete(EntityID: Integer); virtual;
    function Get(EntityID: Integer): T; virtual;
    procedure Save(AEntity: T); virtual;
  end;
implementation

function TBaseCRUDController<T>.GetFiltered(const AFieldName,
  ASearchText: string): TDataSet;
begin
 Result := FDAO.GetWhere(AFieldName,ASearchText);
end;

procedure TBaseCRUDController<T>.Save(AEntity: T);
var
 Entity : IEntity;
begin
Entity := AEntity;

if Entity.GetID = 0 then
    FDAO.Insert(AEntity)
  else
  begin
    ShowMessage(IntToStr(Entity.GetID));
    FDAO.Update(AEntity);
  end;
end;


function TBaseCRUDController<T>.Get(EntityID: Integer): T;
begin
  Result := FDAO.GetByID(EntityID);
end;

function TBaseCRUDController<T>.GetAll: TDataSet;
begin
 Result := FDAO.GetAll;
end;

constructor TBaseCRUDController<T>.Create(ADAO: IDAO<T>);
begin
 FDAO := ADAO;
end;

procedure TBaseCRUDController<T>.Delete(EntityID: Integer);
begin
 FDAO.Delete(EntityID);
end;

end.
