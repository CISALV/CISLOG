unit uProdutoDAO;

interface

uses FireDAC.Comp.Client, System.SysUtils, uProduto;

  type ProdutoDAO = class
    private

      FConnection: TFDConnection;
      FStoredProc: TFDStoredProc;

    public
      constructor Create;
      destructor Destroy; override;

      function Insert(const AProduto: TProduto) : Integer;
      function Read(const Id: Integer) : TProduto;
      procedure Update(const AProduto: TProduto);
      procedure Delete(const Id: Integer);

      end;

implementation

{ ProdutoDAO }

uses uDataConService;

constructor ProdutoDAO.Create;
begin
  inherited;
  FConnection := TDataConService.GetInstance.GetConnection;
  FStoredProc := TFDStoredProc.Create(nil);

  FStoredProc.Connection := FConnection;
  FStoredProc.StoredProcName := 'PROC_PRODUTO';

end;

procedure ProdutoDAO.Delete(const Id: Integer);
begin


end;

destructor ProdutoDAO.Destroy;
begin

end;

function ProdutoDAO.Insert(const AProduto: TProduto): Integer;
begin
  FConnection.StartTransaction;
  try
    with FStoredProc do
    begin
    Prepare;
    ParamByName('modo').AsString := 'I';

    ParamByName('apresentacao_e').AsString := AProduto.Apresentacao;
    ParamByName('CATMAT_e').AsInteger := AProduto.CATMAT;
    ParamByName('descricao_e').AsString := AProduto.Descricao;
    ParamByName('GGREM_e').AsInteger := AProduto.GGREM;
    end;

    AProduto.Id := FStoredProc.ParamByName('id_s').AsInteger;

  finally

  end;

end;

function ProdutoDAO.Read(const Id: Integer): TProduto;
begin

end;

procedure ProdutoDAO.Update(const AProduto: TProduto);
begin

end;

end.
