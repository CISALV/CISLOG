unit uDataConService;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TDataConService = class(TComponent)
  strict protected
    class var FInstance: TDataConService;
  private
    FConnection: TFDConnection;
    FQuery: TFDQuery;
    constructor CreatePrivate;
  public
    function GetConnection: TFDConnection;
    function ExecuteQuery(sql: String): TFDQuery;
    function GetQuery: TFDQuery;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TDataConService;
    class procedure ReleaseInstance;
  end;

implementation

{ TDataConService }

constructor TDataConService.Create(AOwner: TComponent);
begin
  raise Exception.Create('Essa classe é um Singleton! Use o método GetInstance.');
end;

constructor TDataConService.CreatePrivate;
begin
  inherited Create(nil);
  FQuery := TFDQuery.Create(nil);
  //FQuery.Connection

  {
   FConnection := TFDConnection.Create(Self);
  FQuery := TFDQuery.Create(Self);
  try
    FConnection.DriverName := 'FB';
    FConnection.Params.Add('Server=192.168.0.223');
    FConnection.Params.Add('Port=3050');
    FConnection.Params.Add('Protocol=TCPIP');
    FConnection.Params.Add('Database=C:\database\CISALV-3-2-1.FDB');
    FConnection.Params.Add('User_Name=SYSDBA');
    FConnection.Params.Add('Password=masterkey');
    FConnection.LoginPrompt := False;
    FConnection.Connected := True;
    FQuery.Connection := FConnection;
  except
    on E: Exception do
    begin
      FreeAndNil(FConnection);
      FreeAndNil(FQuery);
      raise Exception.Create('Falha ao Conectar com a base de dados: ' + E.Message);
    end;
  end;
}
end;

destructor TDataConService.Destroy;
begin
  FQuery.Free;
  FConnection.Free;
  inherited Destroy;
end;

function TDataConService.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

class function TDataConService.GetInstance: TDataConService;
begin
  if not Assigned(FInstance) then
    FInstance := TDataConService.CreatePrivate;
  Result := FInstance;
end;

function TDataConService.GetQuery: TFDQuery;
begin
  Result := FQuery;
end;

function TDataConService.ExecuteQuery(sql: String): TFDQuery;
begin
  FQuery.Connection := FConnection;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(sql);
  FQuery.Open;
  Result := FQuery;
end;

class procedure TDataConService.ReleaseInstance;
begin
  FreeAndNil(FInstance);
end;

initialization


finalization
  TDataConService.ReleaseInstance;

end.
