unit ucMunicipio;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UCBaseDados;

type
  TMunicipio = class
  private
   Fid : integer;
   FNome : String;
   FCNPJ : String;
   Femail : String;
   FTelefone : String;
   FRua : String;
   FNumero : String;
   FBairro : String;
   FComplemento : String;
   ProcMunicipio : TFDStoredProc;
   baseDados : TBaseDados;


    procedure Setid(const Value: integer);
    procedure SetNome(const Value: String);
    procedure SetCNPJ(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetRua(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetBairro(const Value : String);
    procedure SetComplemento(const Value : String);

  public

   property id: Integer read Fid write Setid;
   property nome : String read FNome write SetNome;
   property cnpj : String read FCnpj write SetCnpj;
   property email : String read FEmail write SetEmail;
   property telefone : String read FTelefone write SetTelefone;
   property rua : String read Frua write SetRua;
   property numero : String read FNumero write SetNumero;
   property bairro : String read Fbairro write SetBairro;
   property complemento : String read FComplemento write SetComplemento;


   function Gravar(con : TFDConnection) : integer;
   function Alterar(con : TFDConnection) : integer;
   function Excluir(con : TFDConnection) : integer;

   constructor Create(id : Integer; nome, cnpj, email, telefone, rua, numero, bairro, complemento : String);
   destructor  Destroy; Override;

  end;

implementation

{ TMuncipio }

constructor TMunicipio.Create(id: Integer; nome, cnpj, email, telefone, rua, numero, bairro, complemento: String);
begin
  Self.SetId(id);
  Self.SetNome(nome);
  Self.SetCNPJ(cnpj);
  Self.SetEmail(email);
  Self.SetTelefone(telefone);
  Self.SetRua(rua);
  Self.SetNumero(numero);
  Self.SetBairro(bairro);
  Self.SetComplemento(complemento);

end;

Destructor TMunicipio.Destroy;
begin
   ProcMunicipio.Free;
end;

Function TMunicipio.Gravar(con : TFDConnection): Integer;
begin

  try

    con.TxOptions.AutoCommit := false;

    ProcMunicipio := TFDStoredProc.Create(nil);
    ProcMunicipio.StoredProcName := 'PROC_MUNICIPIO';
    ProcMunicipio.Connection := con;

    con.StartTransaction;
    ProcMunicipio.Prepare;
    ProcMunicipio.ParamByName('modo').Value := 'I';
    ProcMunicipio.ParamByName('nome_e').Value := Self.nome;
    ProcMunicipio.ParamByName('cnpj_e').Value := Self.cnpj;
    ProcMunicipio.ParamByName('email_e').Value := Self.email;
    ProcMunicipio.ParamByName('telefone_e').Value := Self.telefone;
    ProcMunicipio.ParamByName('rua_e').Value := Self.rua;
    ProcMunicipio.ParamByName('numero_e').Value := Self.numero;
    ProcMunicipio.ParamByName('bairro_e').Value := Self.bairro;
    ProcMunicipio.ParamByName('complemento_e').Value := Self.complemento;
    ProcMunicipio.Execute;

    con.Commit;
    Result := 1;

  except
    con.Rollback;
    Result := 0;
  end;

end;
/////////////////////////


Function TMunicipio.Alterar(con : TFDConnection): Integer;
begin

  try

    con.TxOptions.AutoCommit := false;

    ProcMunicipio := TFDStoredProc.Create(nil);
    ProcMunicipio.StoredProcName := 'PROC_MUNICIPIO';
    ProcMunicipio.Connection := con;

    con.StartTransaction;
    ProcMunicipio.Prepare;
    ProcMunicipio.ParamByName('modo').Value := 'U';
    ProcMunicipio.ParamByName('id_e').Value := Self.id;
    ProcMunicipio.ParamByName('nome_e').Value := Self.nome;
    ProcMunicipio.ParamByName('cnpj_e').Value := Self.cnpj;
    ProcMunicipio.ParamByName('email_e').Value := Self.email;
    ProcMunicipio.ParamByName('telefone_e').Value := Self.telefone;
    ProcMunicipio.ParamByName('rua_e').Value := Self.rua;
    ProcMunicipio.ParamByName('numero_e').Value := Self.numero;
    ProcMunicipio.ParamByName('bairro_e').Value := Self.bairro;
    ProcMunicipio.ParamByName('complemento_e').Value := Self.complemento;
    ProcMunicipio.Execute;

    con.Commit;
    Result := 1;

  except
    con.Rollback;
    Result := 0;
  end;

end;


Function TMunicipio.Excluir(con : TFDConnection): Integer;
begin

  try

    con.TxOptions.AutoCommit := false;

    ProcMunicipio := TFDStoredProc.Create(nil);
    ProcMunicipio.StoredProcName := 'PROC_MUNICIPIO';
    ProcMunicipio.Connection := con;

    con.StartTransaction;
    ProcMunicipio.Prepare;
    ProcMunicipio.ParamByName('modo').Value := 'D';
    ProcMunicipio.ParamByName('id_e').Value := Self.id;
    ProcMunicipio.Execute;

    con.Commit;
    Result := 1;

  except
    con.Rollback;
    Result := 0;
  end;

end;

///////////////////////

procedure TMunicipio.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TMunicipio.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TMunicipio.SetCNPJ(const Value: String);
begin
 FCNPJ := Value;
end;

procedure TMunicipio.SetEmail(const Value: String);
begin
 FEmail := Value;
end;

procedure TMunicipio.SetNumero(const Value: String);
begin
  FNumero := Value;
end;


procedure TMunicipio.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TMunicipio.SetRua(const Value: String);
begin
  FRua := Value;
end;

procedure TMunicipio.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TMunicipio.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
