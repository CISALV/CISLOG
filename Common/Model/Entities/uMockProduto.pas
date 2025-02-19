unit uMockProduto;

interface

type
  TMockProduto = class
  private
    FId: Integer;
    FApresentacao: String;
    FQuantidadeTotal: Integer;
    FCatMat: Integer;
    FGGrem: Integer;
    FQuantidadeRestante: Integer;
    FValor: Double;
    FUnidadeFracionamento: Integer;
    FQuantidadeMinima: Double;

    procedure SetId(const Value: Integer);
    procedure SetApresentacao(const Value: String);
    procedure SetQuantidadeTotal(const Value: Integer);
    procedure SetCatMat(const Value: Integer);
    procedure SetGGrem(const Value: Integer);
    procedure SetQuantidadeRestante(const Value: Integer);
    procedure SetValor(const Value: Double);
    procedure SetUnidadeFracionamento(const Value: Integer);
    procedure SetQuantidadeMinima(const Value: Double);

  public

    constructor Create(AId: Integer; AApresentacao: String;
  AQuantidadeTotal, ACatMat, AGGrem: Integer;
  AValor: Double; AQuantidadeRestante: Integer = 0; AQuantidadeMinima : Double = 0; AUnidadeFracionamento: Integer = 0);
    property Id: Integer read FId write SetId;
    property Apresentacao: String read FApresentacao write SetApresentacao;
    property QuantidadeTotal: Integer read FQuantidadeTotal write SetQuantidadeTotal;
    property CatMat: Integer read FCatMat write SetCatMat;
    property GGrem: Integer read FGGrem write SetGGrem;
    property QuantidadeRestante: Integer read FQuantidadeRestante write SetQuantidadeRestante;
    property Valor: Double read FValor write SetValor;
    property UnidadeFracionamento: Integer read FUnidadeFracionamento write SetUnidadeFracionamento;
    property QuantidadeMinima: Double read FQuantidadeMinima write SetQuantidadeMinima;
  end;

implementation

constructor TMockProduto.Create(AId: Integer; AApresentacao: String;
  AQuantidadeTotal, ACatMat, AGGrem: Integer;
  AValor: Double; AQuantidadeRestante: Integer = 0; AQuantidadeMinima: Double = 0; AUnidadeFracionamento: Integer = 0);
begin
  Self.FId := AId;
  Self.FApresentacao := AApresentacao;
  Self.FQuantidadeTotal := AQuantidadeTotal;
  Self.FCatMat := ACatMat;
  Self.FGGrem := AGGrem;
  Self.FValor := AValor;
  Self.FQuantidadeRestante := AQuantidadeRestante;
  Self.FQuantidadeMinima := AQuantidadeMinima;
  Self.FUnidadeFracionamento := AUnidadeFracionamento;
end;


procedure TMockProduto.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMockProduto.SetApresentacao(const Value: String);
begin
  FApresentacao := Value;
end;

procedure TMockProduto.SetQuantidadeTotal(const Value: Integer);
begin
  FQuantidadeTotal := Value;
end;

procedure TMockProduto.SetCatMat(const Value: Integer);
begin
  FCatMat := Value;
end;

procedure TMockProduto.SetGGrem(const Value: Integer);
begin
  FGGrem := Value;
end;

procedure TMockProduto.SetQuantidadeRestante(const Value: Integer);
begin
  FQuantidadeRestante := Value;
end;

procedure TMockProduto.SetValor(const Value: Double);
begin
  FValor := Value;
end;

procedure TMockProduto.SetUnidadeFracionamento(const Value: Integer);
begin
  FUnidadeFracionamento := Value;
end;

procedure TMockProduto.SetQuantidadeMinima(const Value: Double);
begin
  FQuantidadeMinima := Value;
end;

end.

