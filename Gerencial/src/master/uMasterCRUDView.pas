unit uMasterCRUDView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, uMasterFrame,
  uframeSearchBar, Data.DB, Vcl.ComCtrls, Vcl.WinXPanels, uframeOperationsBar,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask;

type
  TformMasterCRUDView = class(TformMaster)
    SearchBar: TframeSearchBar;
    panelFundo: TPanel;
    dbgridPesquisa: TDBGrid;
    operationsBar: TframeOperationsBar;
    cardpanelCRIS: TCardPanel;
    cardPesquisa: TCard;
    panelLateral: TPanel;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;

    procedure FormCreate(Sender: TObject);

    function ConfirmSave: Boolean; virtual;
    function ConfirmDelete: Boolean; virtual;

    procedure Save; virtual; abstract;
    procedure Delete; virtual; abstract;

    procedure operationsBarspeedCancelarClick(Sender: TObject);
    procedure operationsBarspeedExcluirClick(Sender: TObject);
    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure operationsBarspeedSalvarClick(Sender: TObject);

    procedure dbgridPesquisaDblClick(Sender: TObject);

    procedure LimparCampos;

  private
  public

  end;

var
  formMasterCRUDView: TformMasterCRUDView;

implementation

{$R *.dfm}

function TformMasterCRUDView.ConfirmDelete: Boolean;
begin
  Result := MessageDlg('Você realmente deseja Deletar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

function TformMasterCRUDView.ConfirmSave: Boolean;
begin
  Result := MessageDlg('Você realmente deseja Salvar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TformMasterCRUDView.dbgridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  panelLateral.Visible := True;
  dbgridPesquisa.ReadOnly := True;
  operationsBar.SetButtonState(osEdit);

end;

procedure TformMasterCRUDView.FormCreate(Sender: TObject);
begin
  inherited;
  cardpanelCRIS.ActiveCard := cardPesquisa;

end;

procedure TformMasterCRUDView.LimparCampos;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i] is TEdit then
    begin
      TEdit(Self.Components[i]).Text := '';
    end
    else if Self.Components[i] is TMaskEdit then
    begin
      TMaskEdit(Self.Components[i]).Text := '';
    end
  end;
end;

procedure TformMasterCRUDView.operationsBarspeedCancelarClick(Sender: TObject);
begin
  inherited;

  operationsbar.SetButtonState(osIdle);
  cardpanelCRIS.ActiveCard := cardPesquisa;
  panelLateral.Visible := False;
  dbgridPesquisa.DataSource.Enabled := False;
  dbgridPesquisa.DataSource.Enabled := True;
  // Clear Fields;
end;

procedure TformMasterCRUDView.operationsBarspeedExcluirClick(Sender: TObject);
begin
  inherited;
  if ConfirmDelete then
    operationsBar.SetButtonState(osIdle);
    panelLateral.Visible := False;
    Delete;
end;

procedure TformMasterCRUDView.operationsBarspeedNovoClick(Sender: TObject);
begin
  inherited;

  operationsBar.SetButtonState(osEdit);
  panelLateral.Visible := True;
  dbgridPesquisa.ReadOnly := True;
end;

procedure TformMasterCRUDView.operationsBarspeedSalvarClick(Sender: TObject);
begin
  inherited;
  if ConfirmSave then
    operationsBar.SetButtonState(osIdle);
    panelLateral.Visible := False;
    Save;
end;

end.
