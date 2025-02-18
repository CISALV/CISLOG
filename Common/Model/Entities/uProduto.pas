unit uProduto;

interface

type
 TProduto = class
  private
    FGGREM: integer;
    FDescricao: string;
    FApresentacao: string;
    FId: Integer;
    FCATMAT: integer;
    procedure SetApresentacao(const Value: string);
    procedure SetCATMAT(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetGGREM(const Value: integer);
    procedure SetId(const Value: Integer);

 public
  property Id: Integer read FId write SetId;
  property Apresentacao: string read FApresentacao write SetApresentacao;
  property CATMAT: integer read FCATMAT write SetCATMAT;
  property Descricao: string read FDescricao write SetDescricao;
  property GGREM: integer read FGGREM write SetGGREM;
  constructor Create(AId,AGGREM,ACATMAT: Integer ; AApresentacao: String; ADescricao : String = '');
 end;

implementation

{ TProduto }

constructor TProduto.Create(AId, AGGREM, ACATMAT: Integer; AApresentacao,
  ADescricao: String);
begin
  Self.Id := AId;
  Self.GGREM := AGGREM;
  Self.CATMAT := ACATMAT;
  Self.Apresentacao := AApresentacao;
  //Self.Descricao := ADescricao;
end;

procedure TProduto.SetApresentacao(const Value: string);
begin
  FApresentacao := Value;
end;

procedure TProduto.SetCATMAT(const Value: integer);
begin
  FCATMAT := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetGGREM(const Value: integer);
begin
  FGGREM := Value;
end;

procedure TProduto.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
