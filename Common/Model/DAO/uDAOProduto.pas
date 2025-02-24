unit uDAOProduto;

interface

uses
  FireDAC.Comp.Client, uProduto, System.SysUtils,uBaseDAO;

type
  TDAOProduto = class(TBaseDAO<TProduto>)
  protected
    function GetObjectFromQuery(Query : TFDQuery): TProduto; override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: TProduto); override;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: TProduto); override;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer); override;


  end;

implementation

constructor TDAOProduto.Create;
var
  FStoredProc : TFDStoredProc;
begin
  inherited;
  FStoredProcName := 'PROC_PRODUTO';
  FTableName := 'PRODUTO';
end;

procedure TDAOProduto.SetupInsertParams(StoredProc: TFDStoredProc;
  AEntity: TProduto);
begin
  StoredProc.ParamByName('id_e').AsInteger := AEntity.Id;
  StoredProc.ParamByName('descricao_e').AsString    := AEntity.Descricao;
  StoredProc.ParamByName('apresentacao_e').AsString := AEntity.Apresentacao;
  StoredProc.ParamByName('catmat_e').AsInteger      := AEntity.CATMAT;
  StoredProc.ParamByName('ggrem_e').AsInteger       := AEntity.GGREM;
end;

procedure TDAOProduto.SetupUpdateParams(StoredProc: TFDStoredProc;
  AEntity: TProduto);
begin
  StoredProc.ParamByName('id_e').AsInteger := AEntity.Id;
  StoredProc.ParamByName('descricao_e').AsString    := AEntity.Descricao;
  StoredProc.ParamByName('apresentacao_e').AsString := AEntity.Apresentacao;
  StoredProc.ParamByName('catmat_e').AsInteger      := AEntity.CATMAT;
  StoredProc.ParamByName('ggrem_e').AsInteger       := AEntity.GGREM;

end;

procedure TDAOProduto.SetupDeleteParams(StoredProc: TFDStoredProc;
  AID: Integer);
begin
  inherited;
  StoredProc.ParamByName('id_e').AsInteger := AID;
end;

destructor TDAOProduto.Destroy;
begin
  inherited;
end;

function TDAOProduto.GetObjectFromQuery(Query: TFDQuery): TProduto;
begin
Result := TProduto.Create(
      Query.FieldByName('id').AsInteger,
      Query.FieldByName('ggrem').AsInteger,
      Query.FieldByName('catmat').AsInteger,
      Query.FieldByName('Apresentacao').AsString,
      Query.FieldByName('Descricao').AsString
    );
end;

end.

