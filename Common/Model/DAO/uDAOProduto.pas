unit uDAOProduto;

interface

uses
  FireDAC.Comp.Client, uProduto, System.SysUtils;

type
  TDAOProduto = class
  private
    FStoredProc: TFDStoredProc;
  public
    constructor Create;
    destructor Destroy; override;

    function Insert(AProduto: TProduto): Integer;
    function Update(AProduto: TProduto): Integer;
    function Delete(AID: Integer): Integer;

    function GetAll: TFDQuery;
    function GetWhere(const FilterField, FilterValue: string): TFDQuery;
    function GetByID(ProdutoID: Integer): TProduto;
  end;

implementation

uses
  uDataConService;

constructor TDAOProduto.Create;
begin
  FStoredProc := TFDStoredProc.Create(nil);
  if TDataConService.GetInstance.GetQuery.Active then
    TDataConService.GetInstance.GetQuery.Close;
end;

destructor TDAOProduto.Destroy;
begin
  FStoredProc.Free;
  inherited;
end;

function TDAOProduto.GetByID(ProdutoID: Integer): TProduto;
var
  Query: TFDQuery;
begin
  Query := TDataConService.GetInstance.GetQuery;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM PRODUTO WHERE ID = :ID');
  Query.ParamByName('ID').AsInteger := ProdutoID;
  Query.Open;

  if not Query.IsEmpty then
  begin
    Result := TProduto.Create(
    Query.FieldByName('id').AsInteger,
    Query.FieldByName('ggrem').AsInteger,
    Query.FieldByName('catmat').AsInteger,
    Query.FieldByName('apresentacao').AsString //,
    //Query.FieldByName('descricao').AsString)
    )

  end
  else
    Result := nil;
end;

function TDAOProduto.GetAll: TFDQuery;
begin
  Result := TDataConService.GetInstance.GetQuery;
  Result.Close;
  Result.SQL.Clear;
  Result.SQL.Add('SELECT * FROM PRODUTO');
  Result.Open;
end;

function TDAOProduto.GetWhere(const FilterField, FilterValue: string): TFDQuery;
begin
  Result := TDataConService.GetInstance.GetQuery;
  Result.Close;
  Result.SQL.Clear;
  Result.SQL.Add('SELECT id, descricao, apresentacao FROM PRODUTO WHERE ' +
    FilterField + ' containing :parametro');
  Result.ParamByName('parametro').AsString := FilterValue;
  Result.Open;
end;

function TDAOProduto.Insert(AProduto: TProduto): Integer;
var
  Connection: TFDConnection;
  StoredProc: TFDStoredProc;
begin
  Connection := TDataConService.GetInstance.GetConnection;
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection     := Connection;
    StoredProc.StoredProcName := 'PROC_PRODUTO';

    Connection.TxOptions.AutoCommit := False;
    Connection.StartTransaction;
    try
      StoredProc.Prepare;

      StoredProc.ParamByName('modo').AsString         := 'I';
      //StoredProc.ParamByName('descricao_e').AsString    := AProduto.Descricao;
      StoredProc.ParamByName('apresentacao_e').AsString := AProduto.Apresentacao;
      StoredProc.ParamByName('catmat_e').AsInteger      := AProduto.CATMAT;
      StoredProc.ParamByName('ggrem_e').AsInteger       := AProduto.GGREM;

      StoredProc.ExecProc;

      AProduto.Id := StoredProc.ParamByName('id_s').AsInteger;

      Connection.Commit;
      Result := 1;
    except
      Connection.Rollback;
      Result := 0;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TDAOProduto.Update(AProduto: TProduto): Integer;
var
  Connection: TFDConnection;
  StoredProc: TFDStoredProc;
begin
  Connection := TDataConService.GetInstance.GetConnection;
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection     := Connection;
    StoredProc.StoredProcName := 'PROC_PRODUTO';

    Connection.StartTransaction;
    try
      StoredProc.Prepare;
      StoredProc.ParamByName('modo').AsString         := 'U';
      StoredProc.ParamByName('id_e').AsInteger          := AProduto.Id;
      //StoredProc.ParamByName('descricao_e').AsString    := AProduto.Descricao;
      StoredProc.ParamByName('apresentacao_e').AsString := AProduto.Apresentacao;
      StoredProc.ParamByName('catmat_e').AsInteger      := AProduto.CATMAT;
      StoredProc.ParamByName('ggrem_e').AsInteger       := AProduto.GGREM;

      StoredProc.ExecProc;

      Connection.Commit;
      Result := 1;
    except
      Connection.Rollback;
      Result := 0;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TDAOProduto.Delete(AID: Integer): Integer;
var
  Connection: TFDConnection;
  StoredProc: TFDStoredProc;
begin
  Connection := TDataConService.GetInstance.GetConnection;
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection     := Connection;
    StoredProc.StoredProcName := 'PROC_PRODUTO';

    Connection.StartTransaction;
    try
      StoredProc.Prepare;
      StoredProc.ParamByName('modo').AsString := 'D';
      StoredProc.ParamByName('id_e').AsInteger  := AID;

      StoredProc.ExecProc;

      Connection.Commit;
      Result := 1;
    except
      Connection.Rollback;
      Result := 0;
    end;
  finally
    StoredProc.Free;
  end;
end;

end.

