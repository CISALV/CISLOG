unit uControllerCiclo;

interface

uses uCiclo, uMasterController, uCicloDAO,Dialogs;

type TControllerCiclo = class(TMasterCRUDController<TCiclo>)

  public
  constructor Create;
  function ReturnEntity(AEntityId : Integer) : TCiclo;
  procedure PersistEntity(AEntity : TCiclo);
end;

implementation

{ TControllerCiclo }

constructor TControllerCiclo.Create;
begin
 FDAO := TDAOCiclo.Create;
end;

procedure TControllerCiclo.PersistEntity(AEntity: TCiclo);
begin
if (AEntity.Nome = '') or (AEntity.Tipo = '') then
  begin
    ShowMessage('Todos os campos são necessários');
    Exit;
  end;

  if AEntity.Id = 0 then
    FDAO.Insert(AEntity)
  else
    FDAO.Update(AEntity);
end;

function TControllerCiclo.ReturnEntity(AEntityId: Integer): TCiclo;
var
  Ciclo: TCiclo;
begin
  Ciclo := FDAO.GetByID(AEntityID);
  if (Ciclo <> nil) and (Ciclo.Id > 0) then
    Result := Ciclo
  else
    Result := nil;
end;

end.
