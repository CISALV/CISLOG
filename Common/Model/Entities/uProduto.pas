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

 public
  property Id: Integer read FId write FId;
  property Apresentacao: string read FApresentacao write FApresentacao;
  property CATMAT: integer read FCATMAT write FCATMAT;
  property Descricao: string read FDescricao write FDescricao;
  property GGREM: integer read FGGREM write FGGREM;
 end;

implementation

end.
