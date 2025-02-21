unit uDAOGerenciarPedidos;

interface

uses uDataConService,FireDAC.Comp.Client, Data.DB, Dialogs;


type
TDAOGerenciarPedidos = class
FConnection: TFDConnection;
FQuery : TFDQuery;
public
  constructor Create;
  function GetAll : TDataset;


end;

implementation

{ TDAOGerenciarPedidos }

constructor TDAOGerenciarPedidos.Create;
begin
 FConnection := TDataConService.GetInstance.GetConnection;
 FQuery := TDataConService.GetInstance.GetQuery;
end;


function TDAOGerenciarPedidos.GetAll: TDataset;
begin
 FQuery.Close;
 FQuery.SQL.Clear;
 FQuery.SQL.Add( 'SELECT P.ID,P.ATIVO, M.NOME AS MUNICIPIO_NOME,');
 FQuery.SQL.Add('C.NOME AS CICLO, C.TIPO AS TIPO')
{
 FQuery.SQL.Add(FROM MOCK_PEDIDO P
LEFT JOIN MUNICIPIO M ON M.ID = P.FK_MUNICIPIO_ID
LEFT JOIN CICLO C ON C.ID = P.FK_CICLO_ID  -- Corrigido aqui!
 }
end;

end.
