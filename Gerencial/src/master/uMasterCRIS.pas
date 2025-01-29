unit uMasterCRIS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, uMasterFrame,
  uframeSearchBar, Data.DB, Vcl.ComCtrls, Vcl.WinXPanels, uframeOperationsBar,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
  TformMasterCRIS = class(TformMaster)
    SearchBar: TframeSearchBar;
    panelFundo: TPanel;
    dbgridPesquisa: TDBGrid;
    operationsBar: TframeOperationsBar;
    cardpanelCRIS: TCardPanel;
    cardPesquisa: TCard;
    cardNovo: TCard;
    cardEditar: TCard;
    panelLateral: TPanel;
    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure operationsBarspeedCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgridPesquisaDblClick(Sender: TObject);
    procedure operationsBarspeedExcluirClick(Sender: TObject);
    procedure operationsBarspeedSalvarClick(Sender: TObject);

  private
  public

  end;

var
  formMasterCRIS: TformMasterCRIS;

implementation

{$R *.dfm}

procedure TformMasterCRIS.dbgridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  panelLateral.Visible := True;
  dbgridPesquisa.ReadOnly := True;
  operationsBar.speedEditarClick(Sender);

end;

procedure TformMasterCRIS.FormCreate(Sender: TObject);
begin
  inherited;
  cardpanelCRIS.ActiveCard := cardPesquisa;

end;


procedure TformMasterCRIS.operationsBarspeedCancelarClick(Sender: TObject);
begin
  inherited;
  operationsBar.speedCancelarClick(Sender);
  cardpanelCRIS.ActiveCard := cardPesquisa;
  panelLateral.Visible := False;
  dbgridPesquisa.DataSource.Enabled := False;
  dbgridPesquisa.DataSource.Enabled := True;
  //Clear Fields;
end;

procedure TformMasterCRIS.operationsBarspeedExcluirClick(Sender: TObject);
begin
  inherited;
    operationsBar.speedNovoClick(Sender);
    panelLateral.Visible := False;

end;

procedure TformMasterCRIS.operationsBarspeedNovoClick(Sender: TObject);
begin
  inherited;
  operationsBar.speedNovoClick(Sender);
  //cardpanelCRIS.ActiveCard := cardNovo;

  panelLateral.Visible := True;
  dbgridPesquisa.ReadOnly := True;
end;

procedure TformMasterCRIS.operationsBarspeedSalvarClick(Sender: TObject);
begin
  inherited;
  operationsBar.speedSalvarClick(Sender);
  panelLateral.Visible := False;
end;

end.

