unit uControllerMunicipio;

interface

uses uDAOMunicipio, FireDAC.Comp.Client, System.SysUtils, uMunicipio,Dialogs,uInterfaces;

type
  TMunicipioController = class(TInterfacedObject,IController)
  private
    FMunicipioDAO: TDAOMunicipio;
  public
    constructor Create;
    destructor Destroy; override;

    function FiltrarPesquisa(FilterIndex: Integer; SearchValue: String): TFDQuery;

    function PopularView(MunicipioID: Integer): TMunicipioDTO;
    function CarregarDados: TFDQuery;
    procedure ProcessarEntidade(AMunicipioDTO: TMunicipioDTO);
    procedure AtualizarEntidade(AMunicipio: TMunicipio);
    procedure RemoverEntidade(MunicipioID: Integer);


  end;
implementation

{ TMunicipioController }

constructor TMunicipioController.Create;
begin
  FMunicipioDAO := TDAOMunicipio.Create;
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
    Municipio.Free;
  end;
end;



procedure TMunicipioController.RemoverEntidade(MunicipioID: Integer);
begin
    FMunicipioDAO.Excluir(MunicipioID);
end;

procedure TMunicipioController.ProcessarEntidade(AMunicipioDTO: TMunicipioDTO);
var
  Municipio : TMunicipio;
begin

if (AMunicipioDTO.Nome = '') or (AMunicipioDTO.CNPJ = '') or (AMunicipioDTO.Email= '') then
  begin
    ShowMessage('Todos os campos são necessários');
    Exit;
  end;

 Municipio := TMunicipio.Create(
   AMunicipioDTO.Id,
   AMunicipioDTO.Nome,
   AMunicipioDTO.CNPJ,
   AMunicipioDTO.Email
 );

try
  if  Municipio.Id = 0 then
    FMunicipioDAO.Gravar(Municipio)
  else
    FMunicipioDAO.Alterar(Municipio);

finally
 Municipio.Free;
end;

end;


procedure TMunicipioController.AtualizarEntidade(AMunicipio: TMunicipio);
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
