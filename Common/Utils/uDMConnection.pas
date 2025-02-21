unit uDMConnection;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  System.IniFiles, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDMConnection = class(TDataModule)
    FDConnection: TFDConnection;
  private
    procedure LoadDatabaseConfig;
    procedure DataModuleCreate(Sender: TObject);
  public
    class function GetConnection: TFDConnection;
  end;

var
  DMConnection: TDMConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConnection }

procedure TDMConnection.LoadDatabaseConfig;
var
  Ini: TIniFile;
  DatabasePath, Server, User, Password: string;
begin
  // Avoid modifying connection at design-time (in Delphi IDE)
  if (csDesigning in ComponentState) then
    Exit;

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  try
    Server := Ini.ReadString('Database', 'Server', '');
    DatabasePath := Ini.ReadString('Database', 'Path','');
    User := Ini.ReadString('Database', 'User', '');
    Password := Ini.ReadString('Database', 'Password', '');

    FDConnection.Params.Clear;
    FDConnection.DriverName := 'FB';
    FDConnection.Params.Add('Server=' + Server);
    FDConnection.Params.Add('Port=3050');
    FDConnection.Params.Add('Protocol=TCPIP');
    FDConnection.Params.Add('Database=' + DatabasePath);
    FDConnection.Params.Add('User_Name=' + User);
    FDConnection.Params.Add('Password=' + Password);
    FDConnection.LoginPrompt := False;
    FDConnection.Connected := True;

  finally
    Ini.Free;
  end;
end;

class function TDMConnection.GetConnection: TFDConnection;
begin
  if not Assigned(dmConnection) then
    dmConnection := TdmConnection.Create(nil);
  Result := dmConnection.FDConnection;
end;


procedure TdmConnection.DataModuleCreate(Sender: TObject);
begin
  LoadDatabaseConfig;
end;

end.
