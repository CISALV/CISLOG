unit uViewMockProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls,uDAOMockProduto, Vcl.ComCtrls,uMockProduto,uInterfaces,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet,uControllerMockProduto;

type
  TformViewMockProduto = class(TformMasterCRUDView)
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
    edQuantidadeMinima: TEdit;
    procedure FormShow(Sender: TObject);
  private
    //function CreateController: ISearchController; override;
    function WrapObject : TMockProduto;
    procedure Save; override;
    procedure Delete; override;
  public

  end;

var
  formViewMockProduto: TformViewMockProduto;

implementation

{$R *.dfm}

{ TformViewMockProduto }
{
function TformViewMockProduto.CreateController: ISearchController;
begin
 //Result := TBaseCRUDController<TMockProduto>.Create(
end;
}
procedure TformViewMockProduto.Delete;
begin
  inherited;
//
end;

procedure TformViewMockProduto.FormShow(Sender: TObject);
begin
  inherited;
  Searchbar.ConfigureFilterFields(['APRESENTACAO','GGREM']);

end;

function TformViewMockProduto.WrapObject: TMockProduto;
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
  Produto := WrapObject;
  DAO := TDAOMockProduto.Create;

  DAO.Insert(Produto);

end;

end.
