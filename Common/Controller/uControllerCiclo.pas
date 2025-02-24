unit uControllerCiclo;

interface

uses uCiclo, uBaseCRUDController, uCicloDAO,Dialogs;

type TControllerCiclo = class//(TBaseCRUDController<TCiclo>)

  public
  constructor Create;
  //function Get(AEntityId : Integer) : TCiclo;
  //procedure Save(AEntity : TCiclo); override;
end;

implementation

{ TControllerCiclo }

constructor TControllerCiclo.Create;
begin
 //FDAO := TDAOCiclo.Create;
end;
{
procedure TControllerCiclo.Save(AEntity: TCiclo);
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

function TControllerCiclo.Get(AEntityId: Integer): TCiclo;
var
  Ciclo: TCiclo;
begin
  Ciclo := FDAO.GetByID(AEntityID);
  if (Ciclo <> nil) and (Ciclo.Id > 0) then
    Result := Ciclo
  else
    Result := nil;
end;
}
end.


