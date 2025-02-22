unit uBaseDAO;

interface

uses
  System.SysUtils, uInterfaces, FireDAC.Comp.Client, Data.DB, Dialogs,
  uDataConService;

type
  TBaseDAO<T: class> = class abstract(TInterfacedObject, IDAO<T>)
  protected
    FConnection: TFDConnection;
    FQuery: TFDQuery;
    FStoredProcName: string;
    FTableName: string;

    procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: T);
      virtual; abstract;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: T);
      virtual; abstract;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer);
      virtual; abstract;
    function CreateEntityFromQuery(Query: TFDQuery): T; virtual; abstract;

  public
    constructor Create;


    function Insert(AEntity: T): Integer; virtual;
    function Update(AEntity: T): Integer; virtual;
    function Delete(AID: Integer): Integer; virtual;

    function GetByID(AID: Integer): T;
    function GetAll: TDataSet;
    function GetWhere(const FilterField, FilterValue: string): TDataSet;
  end;

implementation

{ TBaseDAO<T> }

constructor TBaseDAO<T>.Create;
begin
  FConnection := TDataConService.GetInstance.GetConnection;
  FQuery := TDataConService.GetInstance.GetQuery;
end;


function TBaseDAO<T>.Insert(AEntity: T): Integer;
var
  StoredProc: TFDStoredProc;
begin
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection := FConnection;
    StoredProc.StoredProcName := FStoredProcName;
    FConnection.TxOptions.AutoCommit := False;
    FConnection.StartTransaction;
    try
      StoredProc.Prepare;
      StoredProc.ParamByName('modo').AsString := 'I';
      SetupInsertParams(StoredProc, AEntity);
      StoredProc.ExecProc;
      FConnection.Commit;
      Result := 1;
    except
      on E: Exception do
      begin

        ShowMessage('Error: ' + E.Message);

        FConnection.Rollback;
        Result := 0;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TBaseDAO<T>.Update(AEntity: T): Integer;
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

function TBaseDAO<T>.Delete(AID: Integer): Integer;
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

function TBaseDAO<T>.GetByID(AID: Integer): T;
begin

    FQuery.SQL.Text := Format('SELECT * FROM %s WHERE ID = :ID', [FTableName]);
    FQuery.ParamByName('ID').AsInteger := AID;
    FQuery.Open;

    if not FQuery.IsEmpty then
      Result := CreateEntityFromQuery(FQuery)
    else
      Result := nil;

end;

function TBaseDAO<T>.GetAll: TDataSet;

begin
  FQuery := TDataConService.GetInstance.GetQuery;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Text := Format('SELECT * FROM %s', [FTableName]);
  FQuery.Open;
  Result := FQuery;

end;

function TBaseDAO<T>.GetWhere(const FilterField, FilterValue: string)
  : TDataSet;
begin
  FQuery.SQL.Text :=
    Format('SELECT * FROM %s WHERE %s CONTAINING :parametro',
    [FTableName, FilterField]);
  FQuery.ParamByName('parametro').AsString := FilterValue;
  FQuery.Open;
  Result := FQuery;
end;

end.
