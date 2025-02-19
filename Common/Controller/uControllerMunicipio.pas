unit uControllerMunicipio;

interface

uses uDAOMunicipio, FireDAC.Comp.Client, System.SysUtils, uMunicipio,Dialogs,uInterfaces, Data.DB;

type
  TControllerMunicipio = class(TInterfacedObject, IController<TMunicipio>,ISearchController)
  private
    FDAOMunicipio: TDAOMunicipio;
    FMunicipio: TMunicipio;
  public
    constructor Create;
    destructor Destroy; override;

    function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    function LoadData: TDataSet;

    function ReturnEntity(MunicipioID: Integer): TMunicipio;

    procedure PersistEntity(AMunicipio: TMunicipio);
    procedure UpdateEntity(AMunicipio: TMunicipio);
    procedure RemoveEntity(MunicipioID: Integer);

  end;
implementation

{ TMunicipioController }

constructor TControllerMunicipio.Create;
begin
  FDAOMunicipio := TDAOMunicipio.Create;
end;

destructor TControllerMunicipio.Destroy;
begin
  FDAOMunicipio.Free;
  inherited;
end;

function TControllerMunicipio.FilterDataSet(const AFieldName,
  ASearchText: String): TDataSet;
begin
 Result := FDAOMunicipio.GetWhere(AFieldName, ASearchText);
end;

function TControllerMunicipio.LoadData: TDataSet;
begin
  Result := FDAOMunicipio.GetAll;
end;

function TControllerMunicipio.ReturnEntity(MunicipioID: Integer): TMunicipio;
var
  Municipio: TMunicipio;
begin
  Municipio := FDAOMunicipio.GetByID(MunicipioID);

    if Municipio.Id > 0 then
      Result := Municipio;
end;

procedure TControllerMunicipio.RemoveEntity(MunicipioID: Integer);
begin
    FDAOMunicipio.Delete(MunicipioID);
end;

procedure TControllerMunicipio.PersistEntity(AMunicipio: TMunicipio);
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

procedure TControllerMunicipio.UpdateEntity(AMunicipio: TMunicipio);
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
