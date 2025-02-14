unit uControllerMunicipio;

interface

uses uDAOMunicipio, FireDAC.Comp.Client, System.SysUtils, uMunicipio,Dialogs,uInterfaces, Data.DB;

type
  TMunicipioController = class(TInterfacedObject, IController,ISearchController)
  private
    FDAOMunicipio: TDAOMunicipio;
  public
    constructor Create;
    destructor Destroy; override;

    { FilterDataSet } function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    { LoadData } function LoadData: TDataSet;

    function PopularView(MunicipioID: Integer): TMunicipio;
    procedure ProcessarEntidade(AMunicipio: TMunicipio);
    procedure AtualizarEntidade(AMunicipio: TMunicipio);
    procedure RemoverEntidade(MunicipioID: Integer);

  end;
implementation

{ TMunicipioController }

constructor TMunicipioController.Create;
begin
  FDAOMunicipio := TDAOMunicipio.Create;
end;

destructor TMunicipioController.Destroy;
begin
  FDAOMunicipio.Free;
  inherited;
end;

function TMunicipioController.FilterDataSet(const AFieldName,
  ASearchText: String): TDataSet;
begin
 Result := FDAOMunicipio.Search(AFieldName, ASearchText);
end;

function TMunicipioController.LoadData: TDataSet;
begin
  Result := FDAOMunicipio.GetAll;
end;

{
function TMunicipioController.FilterDataSet(FilterIndex: Integer;
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

  Result := FDAOMunicipio.Search(FilterField, SearchValue);

end;
}

function TMunicipioController.PopularView(MunicipioID: Integer): TMunicipio;
var
  Municipio: TMunicipio;
begin
  Municipio := FDAOMunicipio.GetMunicipioByID(MunicipioID);

    if Municipio.Id > 0 then
      Result := Municipio;
end;

procedure TMunicipioController.RemoverEntidade(MunicipioID: Integer);
begin
    FDAOMunicipio.Delete(MunicipioID);
end;

procedure TMunicipioController.ProcessarEntidade(AMunicipio: TMunicipio);
var
  Municipio : TMunicipio;
begin

if (AMunicipio.Nome = '') or (AMunicipio.CNPJ = '') or (AMunicipio.Email= '') then
  begin
    ShowMessage('Todos os campos s�o necess�rios');
    Exit;
  end;

  if  AMunicipio.Id = 0 then
    FDAOMunicipio.Insert(AMunicipio)
  else
    FDAOMunicipio.Update(AMunicipio);

end;


procedure TMunicipioController.AtualizarEntidade(AMunicipio: TMunicipio);
var
  Success: Integer;
begin
  Success := FDAOMunicipio.Update(AMunicipio);
  if Success = 1 then
   ShowMessage('Munic�pio atualizado com sucesso!')
  else
    ShowMessage('Falha ao atualizar munic�pio.')
end;
end.
