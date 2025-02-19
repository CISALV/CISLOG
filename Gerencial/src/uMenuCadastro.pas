unit uMenuCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus,uViewMunicipio,
  Vcl.StdCtrls, uMasterFrame,uFormFactory, Data.DB, Vcl.Grids, Vcl.DBGrids,uViewMockProduto;

type
  TformMenuCadastros = class(TformMaster)
    panelFundo: TPanel;
    gridMenu: TGridPanel;
    speedMunicipio: TSpeedButton;
    panelGRID: TPanel;
    speedUsuario: TSpeedButton;
    speedProdutos: TSpeedButton;
    speedMockProduto: TSpeedButton;
    procedure speedMunicipioClick(Sender: TObject);
    procedure speedProdutosClick(Sender: TObject);
    procedure speedMockProdutoClick(Sender: TObject);
    //procedure UsuarioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMenuCadastros: TformMenuCadastros;

implementation

{$R *.dfm}

uses uViewProduto;

procedure TformMenuCadastros.speedMockProdutoClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformViewMockProduto,panelFundo);
end;

procedure TformMenuCadastros.speedMunicipioClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformViewMunicipio,panelFundo);
end;

procedure TformMenuCadastros.speedProdutosClick(Sender: TObject);
begin
  inherited;
 TFormFactory.CreateAndShowForm(TFormViewProduto,panelFundo);
end;

end.
