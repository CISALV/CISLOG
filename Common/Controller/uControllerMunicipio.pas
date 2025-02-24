unit uControllerMunicipio;

interface

uses uDAOMunicipio, FireDAC.Comp.Client, System.SysUtils, uMunicipio,Dialogs,uInterfaces, Data.DB;

type
  TControllerMunicipio = class//(TInterfacedObject, ICRUDController<TMunicipio>,ISearchController)
  private
    FDAOMunicipio: TDAOMunicipio;
    FMunicipio: TMunicipio;
  public
    constructor Create;
    destructor Destroy; override;

    ////////
    function GetFiltered(const AFieldName, ASearchText: String): TDataSet;
    function GetAll: TDataSet;
    procedure Delete(MunicipioID: Integer);
    ////////

    function Get(MunicipioID: Integer): TMunicipio;
    procedure Save(AMunicipio: TMunicipio);
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

function TControllerMunicipio.GetFiltered(const AFieldName,
  ASearchText: String): TDataSet;
begin
 Result := FDAOMunicipio.GetWhere(AFieldName, ASearchText);
end;

function TControllerMunicipio.GetAll: TDataSet;
begin
  Result := FDAOMunicipio.GetAll;
end;

function TControllerMunicipio.Get(MunicipioID: Integer): TMunicipio;
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

procedure TControllerMunicipio.Delete(MunicipioID: Integer);
begin
    FDAOMunicipio.Delete(MunicipioID);
end;

procedure TControllerMunicipio.Save(AMunicipio: TMunicipio);
var
  Municipio : TMunicipio;
begin

  if IsNewEntity(AMunicipio) then
    FDAOMunicipio.Insert(AMunicipio)
  else
    FDAOMunicipio.Update(AMunicipio);


end;
end.
