unit uControllerMunicipio;

interface

uses uDAOMunicipio, FireDAC.Comp.Client, System.SysUtils, uMunicipio,Dialogs,uInterfaces, Data.DB;

type
  TControllerMunicipio = class(TInterfacedObject, ICRUDController<TMunicipio>,ISearchController)
  private
    FDAO: TDAOMunicipio;
    FMunicipio: TMunicipio;
  public
    constructor Create(ADAO: IDAO<TMunicipio>);
    destructor Destroy; override;

    ////////
    function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    function LoadData: TDataSet;
    procedure RemoveEntity(MunicipioID: Integer);
    ////////

    function ReturnEntity(MunicipioID: Integer): TMunicipio;
    procedure PersistEntity(AMunicipio: TMunicipio);

  end;
implementation

{ TMunicipioController }

constructor TControllerMunicipio.Create(ADAO: IDAO<TMunicipio>);
begin
  //FDAO := ADAO;
end;

destructor TControllerMunicipio.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TControllerMunicipio.FilterDataSet(const AFieldName,
  ASearchText: String): TDataSet;
begin
 Result := FDAO.GetWhere(AFieldName, ASearchText);
end;

function TControllerMunicipio.LoadData: TDataSet;
begin
  Result := FDAO.GetAll;
end;

function TControllerMunicipio.ReturnEntity(MunicipioID: Integer): TMunicipio;
var
  Municipio: TMunicipio;
begin
  Municipio := FDAO.GetByID(MunicipioID);

    if Municipio.Id > 0 then
      Result := Municipio;
end;

procedure TControllerMunicipio.RemoveEntity(MunicipioID: Integer);
begin
    FDAO.Delete(MunicipioID);
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
    FDAO.Insert(AMunicipio)
  else
    FDAO.Update(AMunicipio);

end;
end.
