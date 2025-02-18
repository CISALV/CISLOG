unit uMasterController;

interface

uses Dialogs,uInterfaces, Data.DB;

type
  TMasterController<T: class> = class abstract(TInterfacedObject, IController<T>,ISearchController)
  private
    FDAO: IDAO<T>;
  public
    constructor Create; virtual; abstract;
    destructor Destroy; virtual; abstract;

    function FilterDataSet(const AFieldName, ASearchText: string): TDataSet; virtual;abstract;
    function LoadData: TDataSet; virtual; abstract;
    function PopularView(EntityID: Integer): T; virtual; abstract; { Pupulate Fields }
    procedure ProcessarEntidade(AEntity: T); virtual; abstract;
    procedure AtualizarEntidade(AEntity: T); virtual;
    procedure RemoverEntidade(EntityID: Integer); virtual;

  end;
implementation

{ TMasterController<T> }

procedure TMasterController<T>.AtualizarEntidade(AEntity: T);
var
  Success: Integer;
begin
  Success := FDAO.Update(AEntity);
  if Success = 1 then
   ShowMessage('Dados atualizados com sucesso!')
  else
    ShowMessage('Falha ao atualizar os dados.')
end;

function TMasterController<T>.FilterDataSet(const AFieldName,
  ASearchText: string): TDataSet;
begin
  FDAO.GetWhere(AFieldName,ASearchText);
end;

function TMasterController<T>.LoadData: TDataSet;
begin
 FDAO.GetAll;
end;

procedure TMasterController<T>.RemoverEntidade(EntityID: Integer);
begin
 FDAO.Delete(EntityID);
end;

end.
