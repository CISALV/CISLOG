unit ucBaseDados;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,SqlExpr,Forms, Classes,SysUtils, StrUtils,Clipbrd, INIFiles;

type
  TBaseDados = class

  private
    Fconnection : TFDConnection;
  public
    procedure DesconectaBase;
    function ConectaBase: TFDConnection;
    Destructor  Destroy; Override;

end;

implementation


destructor TBaseDados.Destroy;
begin
  Fconnection.Free;
inherited;
end;

function LerIni(Chave1, Chave2: String; ValorPadrao: String = ''): String;
var
  Arquivo: String;
  FileIni: TIniFile;
begin
  Arquivo := ChangeFileExt(Application.ExeName, '.ini');
  Result := ValorPadrao;
  try
    FileIni := TIniFile.create(Arquivo);
    if FileExists(Arquivo) then
      Result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;

//Conecta a base de dados
Function TBaseDados.ConectaBase;
var sql : String;
    F: TextFile;
    Linha, caminho: string;
    Data: TDate;
    dias: Currency;
    IniFile, atualizacao: string;
    Ini: TIniFile;
begin

   Fconnection := TFDConnection.Create(Application);

   Ini := TIniFile.create(IniFile);
   IniFile := ChangeFileExt(Application.ExeName, '.ini');

  try
    with Fconnection do
    begin
      Params.Clear;
      Params.Values['DriverID'] := 'FB';
      Params.Values['Server'] := LerIni('CONFIG_BD', 'Server');
      Params.Values['User_name'] := LerIni('CONFIG_BD', 'User');
      Params.Values['Password'] := LerIni('CONFIG_BD', 'Password');
      Params.Values['Database'] := LerIni('CONFIG_BD', 'Database');

      Connected := True;

      Result := Fconnection;
    end;
   Except
      Result := Fconnection;
   end;
end;

procedure TBaseDados.DesconectaBase;
begin
  Fconnection.Connected := false;
end;

end.
