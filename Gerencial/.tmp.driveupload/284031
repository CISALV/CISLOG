unit malfunctioningdatacon;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TDataConModule = class(TDataModule)
    Connection: TFDConnection;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  function GetDataConModule: TDataConModule;

var
  DataConModule: TDataConModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDataConModule.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    Connection := TFDConnection.Create(Self);
    try
      Connection.DriverName := 'FB';
      Connection.Params.Add('Database=C:\database\CISALV-3-2-1.FDB');
      Connection.Params.Add('User_Name=SYSDBA');
      Connection.Params.Add('Password=masterkey');
      Connection.LoginPrompt := False;
      Connection.Connected := True;
    except
      on E: Exception do
        raise Exception.Create('Erro na conexão com a Base de Dados' + E.Message);
    end;
end;

destructor TDataConModule.Destroy;
begin
  Connection.Connected := False;
  inherited Destroy;
end;

function GetDataConModule: TDataConModule;
begin
if not Assigned(DataConModule) then
begin
  DataConModule := TDataConModule.Create(nil);
end;
Result := DataConModule;
end;

initialization

finalization
  FreeAndNil(DataConModule);

end.
