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
  uMunicipioController,uMunicipioDTO;

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

    function MakeDTOfromFields : TMunicipioDTO;

    procedure RecarregarDados;

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

procedure TformMunicipioView.FormShow(Sender: TObject);
var
  Col : TColumn;
begin
  inherited;
  FController := TMunicipioController.Create;

  try
    dsMunicipio := TDataSource.Create(nil);
    dsMunicipio.DataSet := FController.CarregarDados;
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

procedure TformMunicipioView.CarregarMunicipio(MunicipioID:Integer);
var
  MunicipioDTO : TMunicipioDTO;
begin
  MunicipioDTO := FController.PopularView(MunicipioID);
  if MunicipioDTO.Id > 0 then
  begin
    edId.Text := IntToStr(MunicipioID);
    edNome.Text := MunicipioDTO.Nome;
    edCNPJ.Text := MunicipioDTO.CNPJ;
    edEmail.Text := MunicipioDTO.Email;
  end
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

procedure TformMunicipioView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Query.Close;

end;


procedure TformMunicipioView.operationsBarspeedCancelarClick(Sender: TObject);
begin
  inherited;
  Fields.ActivePage := Principal;
  dsMunicipio.DataSet := FController.CarregarDados;
  LimparCampos;
  RecarregarDados;
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
  RecarregarDados;
end;
end;

procedure TformMunicipioView.operationsBarspeedNovoClick(Sender: TObject);

begin
  inherited;
  Fields.ActivePage := Principal;
  edNome.SetFocus;
  LimparCampos;
end;

function TformMunicipioView.MakeDTOfromFields: TMunicipioDTO;
begin

FillChar(Result, SizeOf(TMunicipioDTO), 0);

 Result.Id := StrToIntDef(edId.Text, 0);
 Result.Nome := edNome.Text;
 Result.CNPJ := edCNPJ.Text;
 Result.Email := edEmail.Text;

end;


procedure TformMunicipioView.operationsBarspeedSalvarClick(Sender: TObject);
var
 MunicipioDTO: TMunicipioDTO;
begin
  inherited;
    MunicipioDTO := MakeDTOfromFields;
    FController.ProcessarMunicipio(MunicipioDTO);
    RecarregarDados;

end;

procedure TformMunicipioView.SearchBareditChange(Sender: TObject);
  var
  // Remove THIS!!
  Controller: TMunicipioController;
begin
  inherited;
  Controller := TMunicipioController.Create;
  try
    if Searchbar.edit.Text = '' then
      RecarregarDados
    else
      dsMunicipio.Dataset := Controller.FiltrarPesquisa(SearchBar.combox.ItemIndex, SearchBar.Edit.Text);
    finally
    Controller.Free;
  end;
end;

procedure TformMunicipioView.RecarregarDados;
begin
  dsMunicipio.Dataset := FController.CarregarDados;
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

end.
