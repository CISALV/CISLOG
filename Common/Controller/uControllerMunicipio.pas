unit uControllerMunicipio;

interface

uses uDAOMunicipio, FireDAC.Comp.Client, System.SysUtils, uMunicipio,Dialogs,uInterfaces, Data.DB;

type
  TMunicipioController = class(TInterfacedObject, IController<TMunicipio>,ISearchController)
  private
    FDAOMunicipio: TDAOMunicipio;
    FMunicipio: TMunicipio;
  public
    constructor Create;
    destructor Destroy; override;

    function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    function LoadData: TDataSet;

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
 Result := FDAOMunicipio.GetWhere(AFieldName, ASearchText);
end;

function TMunicipioController.LoadData: TDataSet;
begin
  Result := FDAOMunicipio.GetAll;
end;

function TMunicipioController.PopularView(MunicipioID: Integer): TMunicipio;
var
  Municipio: TMunicipio;
begin
  Municipio := FDAOMunicipio.GetByID(MunicipioID);

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
    ShowMessage('Todos os campos são necessários');
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
   ShowMessage('Município atualizado com sucesso!')
  else
    ShowMessage('Falha ao atualizar município.')
end;
end.
