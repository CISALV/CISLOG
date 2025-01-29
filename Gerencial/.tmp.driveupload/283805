unit uMasterCRIS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, uMasterFrame,
  uframeSearchBar, Data.DB, Vcl.ComCtrls, Vcl.WinXPanels, uframeOperationsBar,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TformMasterCRIS = class(TformMaster)
    SearchBar: TframeSearchBar;
    panelFundo: TPanel;
    dbgridPesquisa: TDBGrid;
    operationsBar: TframeOperationsBar;
    cardpanelCRIS: TCardPanel;
    cardPesquisa: TCard;
    cardCampos: TCard;
    paginas: TPageControl;
    tabPrimarios: TTabSheet;
    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure operationsBarspeedCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure operationsBarspeedEditarClick(Sender: TObject);
    procedure dbgridPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMasterCRIS: TformMasterCRIS;

implementation

{$R *.dfm}

procedure TformMasterCRIS.dbgridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  operationsBar.speedEditarClick(Sender);
  cardpanelCRIS.ActiveCard := cardCampos;
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

end;

procedure TformMasterCRIS.operationsBarspeedEditarClick(Sender: TObject);
begin
  inherited;
  operationsBar.speedEditarClick(Sender);
  cardpanelCRIS.ActiveCard := cardCampos;

end;

procedure TformMasterCRIS.operationsBarspeedNovoClick(Sender: TObject);
begin
  inherited;
  operationsBar.speedNovoClick(Sender);
  cardpanelCRIS.ActiveCard := cardCampos;

end;

end.

