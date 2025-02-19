unit uViewMockProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls,uDAOMockProduto, Vcl.ComCtrls,uMockProduto;

type
  TformViewMockProduto = class(TformMasterCRUDView)
    PageControl1: TPageControl;
    edId: TEdit;
    TabSheet1: TTabSheet;
    edUnidadeFracionamento: TEdit;
    edQuantidadeTotal: TEdit;
    edDescricao: TEdit;
    edApresentacao: TEdit;
    edValor: TEdit;
    edGGREM: TEdit;
    edCATMAT: TEdit;
    edQuantidadeRestante: TEdit;
    TabSheet2: TTabSheet;
    edQuantidadeMinima: TEdit;
  private
    function MakeObjectFromFields : TMockProduto;
    procedure Save; override;
  public

  end;

var
  formViewMockProduto: TformViewMockProduto;

implementation

{$R *.dfm}

{ TformViewMockProduto }

function TformViewMockProduto.MakeObjectFromFields: TMockProduto;
var
  Produto: TMockProduto;
begin
  Produto := TMockProduto.Create(
  StrtoIntDef(edId.Text,0),
  edApresentacao.Text,
  StrtoIntDef(edQuantidadeTotal.Text,0),
  StrtoIntDef(edCATMAT.Text,0),
  StrtoIntDef(edGGREM.Text,0),
  StrtoFloatDef(edValor.Text,0.0),
  StrToIntDef(edQuantidadeRestante.Text, 0),
  StrToFloatDef(edQuantidadeMinima.Text, 0.0),
  StrToIntDef(edUnidadeFracionamento.Text, 0));

  Result := Produto;

end;

procedure TformViewMockProduto.Save;
var
  Produto : TMockProduto;
  DAO : TDAOMockProduto;
begin
  Produto := MakeObjectFromFields;
  DAO := TDAOMockProduto.Create;

  DAO.Insert(Produto);

end;

end.
