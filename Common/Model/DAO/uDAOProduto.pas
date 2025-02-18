unit uDAOProduto;

interface

uses
  uMasterDAO, uProduto,uInterfaces, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TDAOProduto = class(TDAOMaster<TProduto>)
  protected
    procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: TProduto); override;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: TProduto); override;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer); override;
    function CreateEntityFromQuery(Query: TFDQuery): TProduto; override;

  public
    constructor Create;
  end;

implementation

{ TDAOProduto }

constructor TDAOProduto.Create;
begin
  inherited Create;
  FStoredProcName := 'PROC_PRODUTO';
  FTableName := 'PRODUTO';
end;

procedure TDAOProduto.SetupInsertParams(StoredProc: TFDStoredProc; AEntity: TProduto);
begin
  StoredProc.ParamByName('descricao_e').AsString := AEntity.Descricao;
  StoredProc.ParamByName('apresentacao_e').AsString := AEntity.Apresentacao;
  StoredProc.ParamByName('catmat_e').AsInteger := AEntity.CATMAT;
  StoredProc.ParamByName('ggrem_e').AsInteger := AEntity.GGREM;
end;

procedure TDAOProduto.SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: TProduto);
begin

  StoredProc.ParamByName('id_e').AsInteger := AEntity.Id;
  StoredProc.ParamByName('descricao_e').AsString := AEntity.Descricao;
  StoredProc.ParamByName('apresentacao_e').AsString := AEntity.Apresentacao;
  StoredProc.ParamByName('catmat_e').AsInteger := AEntity.CATMAT;
  StoredProc.ParamByName('ggrem_e').AsInteger := AEntity.GGREM;
end;

procedure TDAOProduto.SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer);
begin
  StoredProc.ParamByName('id_e').AsInteger := AID;
end;

function TDAOProduto.CreateEntityFromQuery(Query: TFDQuery): TProduto;
begin
  Result := TProduto.Create;
  try
    Result.Id := Query.FieldByName('id').AsInteger;
    Result.Descricao := Query.FieldByName('descricao').AsString;
    Result.Apresentacao := Query.FieldByName('apresentacao').AsString;
    Result.CATMAT := Query.FieldByName('catmat').AsInteger;
    Result.GGREM := Query.FieldByName('ggrem').AsInteger;
  except
    Result.Free;
    raise;
  end;
end;

end.
