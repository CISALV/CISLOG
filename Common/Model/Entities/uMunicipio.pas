unit uMunicipio;

interface

uses uInterfaces;

type
  TMunicipio = class(TInterfacedObject, IEntity)
  private
    Fid: Integer;
    FNome: String;
    FCNPJ: String;
    FEmail: String;
    FTelefone: String;
    FRua: String;
    FNumero: String;
    FBairro: String;
    FComplemento: String;

    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetCNPJ(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetRua(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetBairro(const Value: String);
    procedure SetComplemento(const Value: String);

  public
    function GetId : Integer;
    property Id: Integer read Fid write SetId;
    property Nome: String read FNome write SetNome;
    property CNPJ: String read FCNPJ write SetCNPJ;
    property Email: String read FEmail write SetEmail;
    property Telefone: String read FTelefone write SetTelefone;
    property Rua: String read FRua write SetRua;
    property Numero: String read FNumero write SetNumero;
    property Bairro: String read FBairro write SetBairro;
    property Complemento: String read FComplemento write SetComplemento;
    constructor Create(AId: Integer; ANome, ACNPJ, AEmail: String;
                       ATelefone: String = ''; ARua: String = ''; ANumero: String = '';
                       ABairro: String = ''; AComplemento: String = '');
  end;

implementation

constructor TMunicipio.Create(AId: Integer; ANome, ACNPJ, AEmail: String;
  ATelefone, ARua, ANumero, ABairro, AComplemento: String);
begin
  inherited Create;

  Self.Fid := AId;
  Self.FNome := ANome;
  Self.FCNPJ := ACNPJ;
  Self.FEmail := AEmail;
  Self.FTelefone := ATelefone;
  Self.FRua := ARua;
  Self.FNumero := ANumero;
  Self.FBairro := ABairro;
  Self.FComplemento := AComplemento;
end;

procedure TMunicipio.SetId(const Value: Integer);
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

procedure TMunicipio.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

procedure TMunicipio.SetRua(const Value: String);
begin
  FRua := Value;
end;

procedure TMunicipio.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

function TMunicipio.GetId: Integer;
begin
 Result := FId;
end;

procedure TMunicipio.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TMunicipio.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

end.

