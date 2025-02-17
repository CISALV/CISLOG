unit uMasterDAO;

interface

uses
  System.SysUtils,uInterfaces, FireDAC.Comp.Client, Data.DB;

type
  TDAOMaster<T: class> = class abstract(TInterfacedObject,IDAO<T>)
  protected
    FConnection: TFDConnection;
    FStoredProcName: string;
    FTableName: string;

    procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: T); virtual; abstract;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: T); virtual; abstract;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer); virtual; abstract;
    function CreateEntityFromQuery(Query: TFDQuery): T; virtual; abstract;

  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function Insert(AEntity: T): Integer;
    function Update(AEntity: T): Integer;
    function Delete(AID: Integer): Integer;

    function GetByID(AID: Integer): T;
    function GetAll: TDataSet;
    function GetWhere(const FilterField, FilterValue: string): TDataSet;
  end;

implementation

{ TBaseDAO<T> }

constructor TDAOMaster<T>.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

destructor TDAOMaster<T>.Destroy;
begin
  // limpar
  inherited;
end;

function TDAOMaster<T>.Insert(AEntity: T): Integer;
var
  StoredProc: TFDStoredProc;
begin
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection := FConnection;
    StoredProc.StoredProcName := FStoredProcName;

    FConnection.StartTransaction;
    try
      StoredProc.ParamByName('modo').AsString := 'I';
      SetupInsertParams(StoredProc, AEntity);
      StoredProc.ExecProc;
      FConnection.Commit;
      Result := 1;
    except
      FConnection.Rollback;
      Result := 0;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TDAOMaster<T>.Update(AEntity: T): Integer;
var
  StoredProc: TFDStoredProc;
begin
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection := FConnection;
    StoredProc.StoredProcName := FStoredProcName;

    FConnection.StartTransaction;
    try
      StoredProc.ParamByName('modo').AsString := 'U';
      SetupUpdateParams(StoredProc, AEntity);
      StoredProc.ExecProc;
      FConnection.Commit;
      Result := 1;
    except
      FConnection.Rollback;
      Result := 0;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TDAOMaster<T>.Delete(AID: Integer): Integer;
var
  StoredProc: TFDStoredProc;
begin
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.ParamByName('modo').AsString := 'D';
    StoredProc.Connection := FConnection;
    StoredProc.StoredProcName := FStoredProcName;

    FConnection.StartTransaction;
    try
      SetupDeleteParams(StoredProc, AID);
      StoredProc.ExecProc;
      FConnection.Commit;
      Result := 1;
    except
      FConnection.Rollback;
      Result := 0;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TDAOMaster<T>.GetByID(AID: Integer): T;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := Format('SELECT * FROM %s WHERE ID = :ID', [FTableName]);
    Query.ParamByName('ID').AsInteger := AID;
    Query.Open;

    if not Query.IsEmpty then
      Result := CreateEntityFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TDAOMaster<T>.GetAll: TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FConnection;
  Query.SQL.Text := Format('SELECT * FROM %s', [FTableName]);
  Query.Open;
  Result := Query;
end;

function TDAOMaster<T>.GetWhere(const FilterField, FilterValue: string): TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FConnection;
  Query.SQL.Text := Format(
    'SELECT id, nome, CNPJ FROM %s WHERE %s CONTAINING :parametro',
    [FTableName, FilterField]
  );
  Query.ParamByName('parametro').AsString := FilterValue;
  Query.Open;
  Result := Query;
end;

end.
