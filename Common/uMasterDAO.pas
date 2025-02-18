unit uMasterDAO;

interface

uses
  System.SysUtils,uInterfaces, FireDAC.Comp.Client, Data.DB, uDataConService;

type
  TDAOMaster<T: class> = class abstract(TInterfacedObject,IDAO<T>)
  protected
    FConnection: TFDConnection;
    FQuery: TFDQuery;
    FStoredProcName: string;
    FTableName: string;

    procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: T); virtual; abstract;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: T); virtual; abstract;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer); virtual; abstract;
    function CreateEntityFromQuery(Query: TFDQuery): T; virtual; abstract;

  public
    constructor Create;
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

constructor TDAOMaster<T>.Create;
begin
  FConnection := TDataConService.GetInstance.GetConnection;
  FQuery := TDataConService.GetInstance.GetQuery;
end;

destructor TDAOMaster<T>.Destroy;
begin
  FConnection.Free;
  FQuery.Free;
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
begin
  try
    FQuery.SQL.Text := Format('SELECT * FROM %s WHERE ID = :ID', [FTableName]);
    FQuery.ParamByName('ID').AsInteger := AID;
    FQuery.Open;

    if not FQuery.IsEmpty then
      Result := CreateEntityFromQuery(FQuery)
    else
      Result := nil;
  finally
    FQuery.Free;
  end;
end;

function TDAOMaster<T>.GetAll: TDataSet;

begin
  FQuery := TDataConService.GetInstance.GetQuery;
  FQuery.SQL.Text := Format('SELECT * FROM %s', [FTableName]);
  FQuery.Open;
  Result := FQuery;
end;

function TDAOMaster<T>.GetWhere(const FilterField, FilterValue: string): TDataSet;
begin
  FQuery.SQL.Text := Format(
    'SELECT id, nome, CNPJ FROM %s WHERE %s CONTAINING :parametro',
    [FTableName, FilterField]
  );
  FQuery.ParamByName('parametro').AsString := FilterValue;
  FQuery.Open;
  Result := FQuery;
end;

end.
