unit uMunicipioView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.ComCtrls,
  uframeSearchBar, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, uMasterFrame,
  uframeOperationsBar, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDataConService,uFormFactory,
  uMunicipioController,uMunicipioModel;

type
  TformMunicipioView = class(TformMasterCRUDView)
    edEmail: TEdit;
    edNome: TEdit;
    edId: TEdit;
    edCNPJ: TMaskEdit;
    Fields: TPageControl;
    Principal: TTabSheet;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure SearchBareditChange(Sender: TObject);

    procedure dbgridPesquisaDblClick(Sender: TObject);
      procedure CarregarMunicipio(MunicipioID:Integer);

    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure operationsBarspeedCancelarClick(Sender: TObject);
    procedure operationsBarspeedSalvarClick(Sender: TObject);
    procedure operationsBarspeedExcluirClick(Sender: TObject);

    procedure ClearFields(AControl: TWinControl);

    function MakeObjectfromFields : TMunicipio;


    procedure RecarregarMunicipios;
    procedure LimparCampos;
    procedure edCNPJEnter(Sender: TObject);
    procedure edCNPJExit(Sender: TObject);


  private
    FController : TMunicipioController;
  public
    { Public declarations }
  end;

var
  formMunicipioView: TformMunicipioView;
  Query : TFDQuery;
  dsMunicipio: TDataSource;

implementation

{$R *.dfm}

procedure TformMunicipioView.CarregarMunicipio(MunicipioID:Integer);
var
  Municipio : TMunicipio;
begin
  Municipio := FController.PreencherDados(MunicipioID);
  if Assigned(Municipio) then
  begin
    edId.Text := IntToStr(MunicipioID);
    edNome.Text := Municipio.Nome;
    edCNPJ.Text := Municipio.CNPJ;
    edEmail.Text := Municipio.Email;
  end
end;

procedure TformMunicipioView.ClearFields(AControl: TWinControl);
var
  I: Integer;
begin
for I := 0 to AControl.ControlCount do
  begin
  if AControl.Controls[I] is TEdit then
      TEdit(AControl.Controls[I]).Clear
   else if AControl.Controls[I] is TMaskEdit then
      TMaskEdit(AControl.Controls[I]).Text := ''
   end;
end;

procedure TformMunicipioView.dbgridPesquisaDblClick(Sender: TObject);
var
  MunicipioID : Integer;
begin
  inherited;
  Fields.ActivePage := Principal;
  MunicipioID := dsMunicipio.DataSet.FieldByName('id').AsInteger;
  CarregarMunicipio(MunicipioID);
end;


procedure TformMunicipioView.edCNPJEnter(Sender: TObject);
begin
  inherited;
  edCNPJ.EditMask := '00.000.000/0000-00;0;_' ;
end;

procedure TformMunicipioView.edCNPJExit(Sender: TObject);
begin
  inherited;
  if edCNPJ.Text = '' then
    edCNPJ.EditMask := '' ;
end;

procedure TformMunicipioView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Query.Close;

end;

procedure TformMunicipioView.FormShow(Sender: TObject);
var
  Col : TColumn;
begin
  inherited;
  FController := TMunicipioController.Create;

  try
    dsMunicipio := TDataSource.Create(nil);
    dsMunicipio.DataSet := FController.CarregarMunicipios;
    dbGridPesquisa.DataSource := dsMunicipio;

     dbGridPesquisa.Columns.Clear;

    Col := dbGridPesquisa.Columns.Add;
    Col.FieldName := 'nome';
    Col.Title.Caption := 'Municipio';
    Col.Width := 300;

    Col := dbGridPesquisa.Columns.Add;
    Col.FieldName := 'Email';
    Col.Title.Caption := 'E-mail';
    Col.Width := 200;

    Col := dbGridPesquisa.Columns.Add;
    Col.FieldName := 'CNPJ';
    Col.Title.Caption := 'CNPJ';
    Col.Width := 200


  finally
    FController.Free;
  end;
end;

procedure TformMunicipioView.LimparCampos;
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

function TformMunicipioView.MakeObjectfromFields: TMunicipio;
begin
  try
 Result := TMunicipio.Create(
      StrToIntDef(edId.Text, 0),
      edNome.Text,
      edCNPJ.Text,
      edEmail.Text
    );
  except
    on E: Exception do
    begin
      ShowMessage('Failed to create Municipio: ' + E.Message);
      raise;
    end;
  end;
end;


procedure TformMunicipioView.operationsBarspeedCancelarClick(Sender: TObject);
begin
  inherited;
  Fields.ActivePage := Principal;
  dsMunicipio.DataSet := FController.CarregarMunicipios;
  LimparCampos;
  RecarregarMunicipios;
end;

procedure TformMunicipioView.operationsBarspeedExcluirClick(Sender: TObject);
begin
  inherited;
  var
  ID: Integer;
begin
  inherited;
  ID := StrtoInt(edId.Text);
  FController.RemoverMunicipio(ID);
  RecarregarMunicipios;

end;
end;

procedure TformMunicipioView.operationsBarspeedNovoClick(Sender: TObject);

begin
  inherited;
  Fields.ActivePage := Principal;

  edNome.SetFocus;
  LimparCampos;
end;

procedure TformMunicipioView.operationsBarspeedSalvarClick(Sender: TObject);
var
 Municipio: TMunicipio;
begin
  inherited;
    try
    Municipio := MakeObjectfromFields;

      if (Municipio.Nome = '') or (Municipio.CNPJ = '') or (Municipio.Email= '') then
        begin
          ShowMessage('Todos os campos são necessários');
          Exit;
        end;

      FController.GravalterarMunicipio(Municipio);
      RecarregarMunicipios;
    finally
      Municipio.Free;
    end;
end;

procedure TformMunicipioView.RecarregarMunicipios;
begin
  dsMunicipio.Dataset := FController.CarregarMunicipios;
end;

procedure TformMunicipioView.SearchBareditChange(Sender: TObject);
  var
  Controller: TMunicipioController;
begin
  inherited;
  Controller := TMunicipioController.Create;
  try
    if Searchbar.edit.Text <> '' then
    begin
      dsMunicipio.Dataset := Controller.FiltrarPesquisa(SearchBar.combox.ItemIndex, SearchBar.Edit.Text);
    end
    else
    begin
      RecarregarMunicipios;
    end;
    finally
    Controller.Free;
  end;


end;
end.
