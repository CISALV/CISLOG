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
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, uInterfaces,
  uframeSearch, Data.FMTBcd, Data.SqlExpr;

type

  TformMasterCRUDView = class(TformMaster)
    panelFundo: TPanel;
    dbgridPesquisa: TDBGrid;
    operationsBar: TframeOperationsBar;
    cardpanelCRIS: TCardPanel;
    cardPesquisa: TCard;
    panelLateral: TPanel;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    SearchBar: TframeSearch;

    procedure operationsBarspeedSalvarClick(Sender: TObject);
    procedure operationsBarspeedExcluirCick(Sender: TObject);
    procedure operationsBarspeedCancelarClick(Sender: TObject);
    procedure operationsBarspeedNovoClick(Sender: TObject);

    procedure dbgridPesquisaDblClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SearchChange(Sender: TObject);

  private

  protected

    FController: ISearchController;
    FDataSource: TDataSource;

    //function CreateController: ISearchController; virtual; abstract;

  public

    procedure Save; virtual; abstract;
    function ConfirmSave: Boolean; virtual;
    procedure Delete; virtual; abstract;
    function ConfirmDelete: Boolean; virtual;
    procedure LimparCampos;

  end;

var
  formMasterCRUDView: TformMasterCRUDView;

implementation

{$R *.dfm}

function TformMasterCRUDView.ConfirmDelete: Boolean;
begin
  Result := MessageDlg('Voc� realmente deseja Deletar?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes;
end;

function TformMasterCRUDView.ConfirmSave: Boolean;
begin
  Result := MessageDlg('Voc� realmente deseja Salvar?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes;
end;

procedure TformMasterCRUDView.dbgridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  panelLateral.Visible := True;
  dbgridPesquisa.ReadOnly := True;
  operationsBar.SetButtonState(osEdit);
end;

procedure TformMasterCRUDView.FormDestroy(Sender: TObject);
begin
  inherited;
  FController := nil;

end;

procedure TformMasterCRUDView.FormShow(Sender: TObject);
begin
  inherited;
  FController := CreateController;

  FDataSource := TDataSource.Create(Self);
  try
    FDataSource.DataSet := FController.LoadData;
  except
    on E: Exception do
    begin
      ShowMessage('Error: ' + E.Message);
    end;
  end;

  dbgridPesquisa.DataSource := FDataSource;
  SearchBar.Controller := FController;
  SearchBar.DataSource := FDataSource;

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
  operationsBar.SetButtonState(osIdle);
  panelLateral.Visible := False;
  LimparCampos;

end;

procedure TformMasterCRUDView.operationsBarspeedExcluirCick(Sender: TObject);
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

procedure TformMasterCRUDView.SearchChange(Sender: TObject);
begin
  inherited;
  SearchBar.edSearchChange(Sender);

  if SearchBar.edSearch.Text = '' then
    FController.LoadData
  else
    FDataSource.DataSet := FController.FilterDataSet
      (SearchBar.cbFilter.Items.Text, SearchBar.edSearch.Text)

end;

end.
