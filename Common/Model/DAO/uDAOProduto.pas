unit uDAOProduto;

interface

uses
  FireDAC.Comp.Client, uProduto, System.SysUtils,uMasterDAO;

type
  TDAOProduto = class(TDAOMaster<TProduto>)
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: TProduto); override;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: TProduto); override;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer); override;

  end;

implementation

uses
  uDataConService;

constructor TDAOProduto.Create;
begin
  FStoredProcName := 'PROC_PRODUTO';
  FTableName := 'PRODUTO';
end;

procedure TDAOProduto.SetupInsertParams(StoredProc: TFDStoredProc;
  AEntity: TProduto);
begin
  StoredProc.ParamByName('descricao_e').AsString    := AEntity.Descricao;
  StoredProc.ParamByName('apresentacao_e').AsString := AEntity.Apresentacao;
  StoredProc.ParamByName('catmat_e').AsInteger      := AEntity.CATMAT;
  StoredProc.ParamByName('ggrem_e').AsInteger       := AEntity.GGREM;
end;

procedure TDAOProduto.SetupUpdateParams(StoredProc: TFDStoredProc;
  AEntity: TProduto);
begin
  StoredProc.ParamByName('descricao_e').AsString    := AEntity.Descricao;
  StoredProc.ParamByName('apresentacao_e').AsString := AEntity.Apresentacao;
  StoredProc.ParamByName('catmat_e').AsInteger      := AEntity.CATMAT;
  StoredProc.ParamByName('ggrem_e').AsInteger       := AEntity.GGREM;

end;

procedure TDAOProduto.SetupDeleteParams(StoredProc: TFDStoredProc;
  AID: Integer);
begin
  inherited;

end;

destructor TDAOProduto.Destroy;
begin
  inherited;
end;

end.

