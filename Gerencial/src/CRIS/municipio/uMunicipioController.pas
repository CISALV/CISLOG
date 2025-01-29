unit uMunicipioController;

interface

uses uMunicipioDAO, FireDAC.Comp.Client, System.SysUtils, uMunicipioModel,Dialogs;

type
  TMunicipioController = class
  private
    FMunicipioDAO: TMunicipioDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function FiltrarPesquisa(FilterIndex: Integer; SearchValue: String): TFDQuery;

    function PreencherDados(MunicipioID: Integer): TMunicipio;

    function GravalterarMunicipio(AMunicipio: TMunicipio): Integer;
    function CarregarMunicipios: TFDQuery;
    procedure AtualizarMunicipio(AMunicipio: TMunicipio);
    procedure RemoverMunicipio(MunicipioID: Integer);



  end;
implementation

{ TMunicipioController }

function TMunicipioController.CarregarMunicipios: TFDQuery;
begin
  Result := FMunicipioDAO.GetMunicipios;
end;

constructor TMunicipioController.Create;
begin
  FMunicipioDAO := TMunicipioDAO.Create;
end;

destructor TMunicipioController.Destroy;
begin
  FMunicipioDAO.Free;
  inherited;
end;

function TMunicipioController.FiltrarPesquisa(FilterIndex: Integer;
  SearchValue: String): TFDQuery;
var
  FilterField: string;
begin
  case FilterIndex of

    0: FilterField := 'NOME';
    1: FilterField := 'CNPJ';
  else
    FilterField := 'NOME';
  end;

  Result := FMunicipioDAO.ProcurarMunicipios(FilterField, SearchValue);

end;

function TMunicipioController.PreencherDados(MunicipioID: Integer): TMunicipio;
var
  Municipio: TMunicipio;
begin

  Result := FMunicipioDAO.GetMunicipioByID(MunicipioID);

end;

procedure TMunicipioController.RemoverMunicipio(MunicipioID: Integer);
begin
  FMunicipioDAO.Excluir(MunicipioID);
end;

function TMunicipioController.GravalterarMunicipio(AMunicipio: TMunicipio): Integer;
begin
  if AMunicipio.Id = 0 then
    Result := FMunicipioDAO.Gravar(AMunicipio)
  else
    Result := FMunicipioDAO.Alterar(AMunicipio);
end;


procedure TMunicipioController.AtualizarMunicipio(AMunicipio: TMunicipio);
var
  Success: Integer;
begin
  Success := FMunicipioDAO.Alterar(AMunicipio);
  if Success = 1 then
   ShowMessage('Município atualizado com sucesso!')
  else
    ShowMessage('Falha ao atualizar município.')
end;
end.
