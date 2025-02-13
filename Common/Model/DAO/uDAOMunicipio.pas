unit uDAOMunicipio;

interface

uses
  FireDAC.Comp.Client, uMunicipio, System.SysUtils;

type
  TDAOMunicipio = class
  private
    FQuery: TFDStoredProc;
  public
    constructor Create;
    destructor Destroy; override;

    function Gravar(AMunicipio: TMunicipio): Integer;
    function Alterar(AMunicipio: TMunicipio): Integer;
    function Excluir(AId: Integer): Integer;
    function GetMunicipios: TFDQuery;
    function ProcurarMunicipios(const FilterField, FilterValue: string): TFDQuery;
    function GetMunicipioByID(MunicipioID: Integer): TMunicipio;

  end;

implementation

uses uDataConService;

constructor TDAOMunicipio.Create;
begin
  FQuery := TFDStoredProc.Create(nil);
  if TDataConService.GetInstance.GetQuery.Active then
    TDataConService.GetInstance.GetQuery.Close;
end;

destructor TDAOMunicipio.Destroy;
begin
  FQuery.Free;
  inherited;
end;

function TDAOMunicipio.GetMunicipioByID(MunicipioID: Integer): TMunicipio;
var
  Query: TFDQuery;
begin
  Query := TDataConService.GetInstance.GetQuery;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM MUNICIPIO WHERE ID = :ID');
  Query.ParamByName('ID').AsInteger := MunicipioID;
  Query.Open;

    if not Query.IsEmpty then
    begin
      Result := TMunicipio.Create(
        Query.FieldByName('id').AsInteger,
        Query.FieldByName('Nome').AsString,
        Query.FieldByName('CNPJ').AsString,
        Query.FieldByName('Email').AsString);
    end
    else
      Result := nil;
end;

function TDAOMunicipio.GetMunicipios: TFDQuery;
begin
     Result := TDataConService.GetInstance.GetQuery;
     Result.Close;
     Result.SQL.Clear;
     Result.SQL.Add('SELECT * FROM MUNICIPIO');
     Result.Open;
end;

function TDAOMunicipio.Gravar(AMunicipio: TMunicipio): Integer;
var
  DataCon: TDataConService;
  Connection: TFDConnection;
  StoredProc: TFDStoredProc;

begin
  DataCon := TDataConService.GetInstance;
  Connection := DataCon.GetConnection;
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection := Connection;
    StoredProc.StoredProcName := 'PROC_MUNICIPIO';

    Connection.TxOptions.AutoCommit := False;
    Connection.StartTransaction;

    try
      StoredProc.Prepare;
      StoredProc.ParamByName('modo').AsString := 'I';
      StoredProc.ParamByName('nome_e').AsString := AMunicipio.Nome;
      StoredProc.ParamByName('cnpj_e').AsString := AMunicipio.CNPJ;
      StoredProc.ParamByName('email_e').AsString := AMunicipio.Email;

      StoredProc.ExecProc;

      AMunicipio.Id := StoredProc.ParamByName('id_s').AsInteger;

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


function TDAOMunicipio.ProcurarMunicipios(const FilterField, FilterValue: string): TFDQuery;
begin
     Result := TDataConService.GetInstance.GetQuery;
     Result.Close;
     Result.SQL.Clear;
     Result.SQL.Add('SELECT id, nome, CNPJ FROM municipio WHERE ' + FilterField + ' containing :parametro');
     Result.ParamByName('parametro').AsString := FilterValue;
     Result.Open;

end;

function TDAOMunicipio.Alterar(AMunicipio: TMunicipio): Integer;
var
  Connection: TFDConnection;
  StoredProc: TFDStoredProc;
begin
  Connection := TDataConService.GetInstance.GetConnection;
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection := Connection;
    StoredProc.StoredProcName := 'PROC_MUNICIPIO';

    Connection.StartTransaction;
      try
        StoredProc.Prepare;
        StoredProc.ParamByName('modo').AsString := 'U';
        StoredProc.ParamByName('id_e').AsInteger := AMunicipio.Id;
        StoredProc.ParamByName('nome_e').AsString := AMunicipio.Nome;
        StoredProc.ParamByName('cnpj_e').AsString := AMunicipio.CNPJ;
        StoredProc.ParamByName('email_e').AsString := AMunicipio.Email;

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

function TDAOMunicipio.Excluir(AId: Integer): Integer;
var
  DataCon : TDataConService;
  Connection : TFDConnection;
  StoredProc : TFDStoredProc;
begin
  DataCon := TDataConService.GetInstance;
  Connection := DataCon.GetConnection;
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection := Connection;
    StoredProc.StoredProcName := 'PROC_MUNICIPIO';

    Connection.StartTransaction;
    try
      StoredProc.Prepare;
      StoredProc.ParamByName('modo').AsString := 'D';
      StoredProc.ParamByName('id_e').Value := AId;
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
