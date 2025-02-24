unit uCiclo;

interface

uses uInterfaces;

type
  TCiclo = class(TInterfacedObject, IEntity)
    private
    FId: Integer;
    FNome: String;
    FTipo: String;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetTipo(const Value: String);

    public
    function GetId : Integer;
    property Id: Integer read FId write SetId;
    property Nome: String read FNome write SetNome;
    property Tipo: String read FTipo write SetTipo;
    constructor Create(Aid: Integer; ANome, ATipo: String);
  end;

implementation

{ TCiclo }

constructor TCiclo.Create(Aid: Integer; ANome, ATipo: String);
begin
 Self.Id := AId;
 Self.Nome := ANome;
 Self.Tipo := ATipo;
end;

function TCiclo.GetId: Integer;
begin
 Result := FId;
end;

procedure TCiclo.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCiclo.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCiclo.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
