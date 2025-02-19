unit uBaseVigencia;

interface
type
  TBaseVigencia = class
    private
    Fid: Integer;
    FNome: String;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    public
    property Id: Integer read Fid write SetId;
    property Nome: String read FNome write SetNome;
  end;

implementation

{ TBaseVigencia }

procedure TBaseVigencia.SetId(const Value: Integer);
begin
  Fid := Value;
end;

procedure TBaseVigencia.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
