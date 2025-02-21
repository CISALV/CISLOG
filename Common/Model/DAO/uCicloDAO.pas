unit uCicloDAO;

interface

uses uCiclo, uMasterDAO,FireDAC.Comp.Client,System.SysUtils, Vcl.Dialogs, Vcl.Forms,
  uDataConService;

type
 TDAOCiclo = class(TDAOMaster<TCiclo>)
   public
   constructor Create;
   procedure SetupInsertParams(StoredProc: TFDStoredProc; AEntity: TCiclo); override;
    procedure SetupUpdateParams(StoredProc: TFDStoredProc; AEntity: TCiclo); override;
    procedure SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer); override;

    function Insert(AEntity: TCiclo): Integer;
 end;

implementation

{ TDAOCiclo }


constructor TDAOCiclo.Create;
begin
  FStoredProcName := 'PROC_CICLO';
  FTableName := 'CICLO';
  FConnection := TDataConService.GetInstance.GetConnection;
end;

function TDAOCiclo.Insert(AEntity: TCiclo): Integer;
var
  StoredProc: TFDStoredProc;
begin
  StoredProc := TFDStoredProc.Create(nil);
  try
    StoredProc.Connection := FConnection;
    StoredProc.StoredProcName := FStoredProcName;

    FConnection.TxOptions.AutoCommit := False;
    FConnection.StartTransaction;
    try
      StoredProc.Prepare;
      StoredProc.ParamByName('modo').AsString := 'I';
      SetupInsertParams(StoredProc, AEntity);
      StoredProc.ExecProc;
      FConnection.Commit;
      Result := 1;
    except
      on E: Exception do
      begin

        ShowMessage('Error: ' + E.Message);

        FConnection.Rollback;
        Result := 0;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

procedure TDAOCiclo.SetupDeleteParams(StoredProc: TFDStoredProc; AID: Integer);
begin
  inherited;

end;

procedure TDAOCiclo.SetupInsertParams(StoredProc: TFDStoredProc;
  AEntity: TCiclo);
begin
  inherited;
  StoredProc.ParamByName('nome_e').AsString    := AEntity.Nome;
  StoredProc.ParamByName('tipo_e').AsString    := AEntity.Tipo;

end;

procedure TDAOCiclo.SetupUpdateParams(StoredProc: TFDStoredProc;
  AEntity: TCiclo);
begin
  inherited;

end;

end.
