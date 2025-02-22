unit uInterfaces;

interface

uses FireDAC.Comp.Client,uMunicipio,Data.DB;

type
  ICRUDController<T> = interface
    ['{3322955C-5B9E-4495-ACCE-D260473497BF}']
    //function FilterDataSet(const AFieldName, ASearchText: string): TDataSet;
    //function LoadData: TDataSet;

    function ReturnEntity(EntityID: Integer): T;
    procedure PersistEntity(AEntity: T);
    procedure RemoveEntity(EntityID: Integer);
    function IsNewEntity(AMunicipio: TMunicipio) : Boolean;
  end;

  ISearchController = interface
    ['{4378C8BB-2A9D-4011-ADFF-540F0CFAD085}']
    function FilterDataSet(const AFieldName, ASearchText: string): TDataSet;
    function LoadData: TDataSet;
  end;

  type
  IDAO<T: class> = interface
    ['{DA7CA435-8F5C-4143-806A-2D4F0D301D21}']

    function Insert(AEntity: T): Integer;
    function Update(AEntity: T): Integer;
    function Delete(AID: Integer): Integer;

    function GetByID(AID: Integer): T;
    function GetAll: TDataSet;
    function GetWhere(const FilterField, FilterValue: string): TDataSet;
  end;


implementation

end.
