unit uDAOMockProduto;

interface

uses FireDAC.Comp.Client,System.SysUtils,uMockProduto,uMasterDAO,uDataConService;

type
 TDAOMockProduto = class(TDAOMaster<TMockProduto>)
    public
    constructor Create;
    procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: TMockProduto); override;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: TMockProduto); override;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer); override;

 end;

implementation

{ TDAOMockProduto }

constructor TDAOMockProduto.Create;
var
  FStoredProc : TFDStoredProc;
begin
  inherited;

  FStoredProcName := 'PROC_MOCK_PRODUTO';
  FTableName := 'MOCK_PRODUTO';

end;

procedure TDAOMockProduto.SetupDeleteParams(StoredProc: TFDStoredProc;
  AID: Integer);
begin
//
end;

procedure TDAOMockProduto.SetupInsertParams(StoredProc: TFDStoredProc;
  AEntity: TMockProduto);
begin
  StoredProc.ParamByName('id_e').AsInteger               := AEntity.Id;
  StoredProc.ParamByName('apresentacao_e').AsString      := AEntity.Apresentacao;
  StoredProc.ParamByName('quantidade_total_e').AsInteger := AEntity.QuantidadeTotal;
  StoredProc.ParamByName('catmat_e').AsInteger           := AEntity.CatMat;
  StoredProc.ParamByName('ggrem_e').AsInteger            := AEntity.GGrem;
  StoredProc.ParamByName('quantidade_restante_e').AsInteger := AEntity.QuantidadeRestante;
  StoredProc.ParamByName('valor_e').AsFloat              := AEntity.Valor;
  StoredProc.ParamByName('unidade_fracionamento_e').AsInteger := AEntity.UnidadeFracionamento;
  StoredProc.ParamByName('quantidade_minima_e').AsFloat := AEntity.QuantidadeMinima;

end;

procedure TDAOMockProduto.SetupUpdateParams(StoredProc: TFDStoredProc;
  AEntity: TMockProduto);
begin
//
end;

end.
