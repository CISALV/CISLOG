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

 end;

implementation

{ TDAOCiclo }


constructor TDAOCiclo.Create;
var
  FStoredProc : TFDStoredProc;
begin
  inherited;
  FStoredProcName := 'PROC_CICLO';
  FTableName := 'CICLO';

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
