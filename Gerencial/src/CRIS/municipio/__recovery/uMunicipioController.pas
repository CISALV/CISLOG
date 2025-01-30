unit uMunicipioController;

interface

uses uMunicipioDAO, FireDAC.Comp.Client, System.SysUtils, uMunicipioModel,Dialogs,uMunicipioDTO;

type
  TMunicipioController = class
  private
    FMunicipioDAO: TMunicipioDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function FiltrarPesquisa(FilterIndex: Integer; SearchValue: String): TFDQuery;

    function PopularView(MunicipioID: Integer): TMunicipioDTO;

    procedure ProcessarMunicipio(AMunicipioDTO: TMunicipioDTO);
    function  CarregarDados: TFDQuery;
    procedure AtualizarMunicipio(AMunicipio: TMunicipio);
    procedure RemoverMunicipio(MunicipioID: Integer);


  end;
implementation

{ TMunicipioController }

constructor TMunicipioController.Create;
begin
  FMunicipioDAO := TMunicipioDAO.Create;
end;

destructor TMunicipioController.Destroy;
begin
  FMunicipioDAO.Free;
  inherited;
end;

function TMunicipioController.CarregarDados: TFDQuery;
begin
  Result := FMunicipioDAO.GetMunicipios;
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

function TMunicipioController.PopularView(MunicipioID: Integer): TMunicipioDTO;
var
  Municipio: TMunicipio;
  MunicipioDTO: TMunicipioDTO;
begin
  Municipio := FMunicipioDAO.GetMunicipioByID(MunicipioID);
  FillChar(MunicipioDTO, SizeOf(TMunicipioDTO), 0);

  try
    if Municipio.Id > 0 then
    begin
      MunicipioDTO.Id := Municipio.Id;
      MunicipioDTO.Nome := Municipio.Nome;
      MunicipioDTO.CNPJ := Municipio.CNPJ;
      MunicipioDTO.Email := Municipio.Email;
    end;

    Result := MunicipioDTO;
  finally
    FreeAndNil(Municipio);
  end;
end;



procedure TMunicipioController.RemoverMunicipio(MunicipioID: Integer);
begin
  FMunicipioDAO.Excluir(MunicipioID);
end;

procedure TMunicipioController.ProcessarMunicipio(AMunicipioDTO: TMunicipioDTO);
var
  Municipio : TMunicipio;
  DTO : TMunicipioDTO
begin

  DTO := AMunicipioDTO
 Municipio.Create(DTO.Id,DTO.Nome,DTO.CNPJ,DTO.Email);

try

  if  Municipio.Id = 0 then
    FMunicipioDAO.Gravar(Municipio)
  else
    FMunicipioDAO.Alterar(Municipio);

finally
 Municipio.Free;
end;

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
