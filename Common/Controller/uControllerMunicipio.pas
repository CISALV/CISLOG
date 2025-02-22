unit uControllerMunicipio;

interface

uses uDAOMunicipio, FireDAC.Comp.Client, System.SysUtils, uMunicipio,Dialogs,uInterfaces, Data.DB;

type
  TControllerMunicipio = class(TInterfacedObject, ICRUDController<TMunicipio>,ISearchController)
  private
    FDAOMunicipio: TDAOMunicipio;
    FMunicipio: TMunicipio;
  public
    constructor Create;
    destructor Destroy; override;

    ////////
    function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    function LoadData: TDataSet;
    procedure RemoveEntity(MunicipioID: Integer);
    ////////

    function ReturnEntity(MunicipioID: Integer): TMunicipio;
    procedure PersistEntity(AMunicipio: TMunicipio);
    function IsNewEntity(AMunicipio: TMunicipio) : Boolean;
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



function TControllerMunicipio.IsNewEntity(AMunicipio: TMunicipio): Boolean;
begin
  Result := AMunicipio.Id = 0;
end;

procedure TControllerMunicipio.RemoveEntity(MunicipioID: Integer);
begin
    FDAOMunicipio.Delete(MunicipioID);
end;

procedure TControllerMunicipio.PersistEntity(AMunicipio: TMunicipio);
var
  Municipio : TMunicipio;
begin

  if IsNewEntity(AMunicipio) then
    FDAOMunicipio.Insert(AMunicipio)
  else
    FDAOMunicipio.Update(AMunicipio);


end;
end.
