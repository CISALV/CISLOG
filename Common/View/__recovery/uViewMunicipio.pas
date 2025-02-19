unit uViewMunicipio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.ComCtrls,
  uframeSearchBar, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, uMasterFrame,
  uframeOperationsBar, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDataConService, uFormFactory,
  uControllerMunicipio, uInterfaces,uMunicipio, uframeSearch;

type
  TformMunicipioView = class(TformMasterCRUDView)
    Fields: TPageControl;
    tabPrincipal: TTabSheet;
    edNome: TEdit;
    edId: TEdit;
    edEmail: TEdit;
    edCNPJ: TMaskEdit;
    TabSheet1: TTabSheet;

    procedure FormShow(Sender: TObject);

    procedure dbgridPesquisaDblClick(Sender: TObject);
    procedure CarregarMunicipio(MunicipioID: Integer);

    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure operationsBarspeedCancelarClick(Sender: TObject);
    procedure Save; override;
    procedure Delete; override;

    procedure edCNPJEnter(Sender: TObject);
    procedure edCNPJExit(Sender: TObject);

  private
    function MakeObjectfromFields: TMunicipio;
  protected
    function CreateController: ISearchController; override;
  public
    { Public declarations }
  end;

var
  formMunicipioView: TformMunicipioView;

implementation

{$R *.dfm}

procedure TformMunicipioView.FormShow(Sender: TObject);
var
  Col: TColumn;
begin
  inherited;

  SearchBar.ConfigureFilterFields(['NOME','CNPJ']);

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

end;

function TformMunicipioView.CreateController: ISearchController;
begin
  Result := TMunicipioController.Create;
end;

procedure TformMunicipioView.dbgridPesquisaDblClick(Sender: TObject);
var
  MunicipioID: Integer;
begin
  inherited;
  Fields.ActivePage := tabPrincipal;
  MunicipioID := FDataSource.DataSet.FieldByName('id').AsInteger;
  CarregarMunicipio(MunicipioID);
end;

procedure TformMunicipioView.CarregarMunicipio(MunicipioID: Integer);
var
  Municipio : TMunicipio;
begin
  Municipio := (FController as IController<TMunicipio>).PopularView(MunicipioID);
  if Municipio.Id > 0 then
  begin
    edId.Text := IntToStr(MunicipioID);
    edNome.Text := Municipio.Nome;
    edCNPJ.Text := Municipio.CNPJ;
    edEmail.Text := Municipio.Email;
  end
end;


procedure TformMunicipioView.operationsBarspeedCancelarClick(Sender: TObject);
begin
  inherited;
  Fields.ActivePage := tabPrincipal;
  FController.LoadData;
end;

procedure TformMunicipioView.Delete;
var
  Id: Integer;
begin
  inherited;
  Id := StrtoInt(edId.Text);
  (FController as IController<TMunicipio>).RemoverEntidade(Id);
  FController.LoadData;
end;

procedure TformMunicipioView.operationsBarspeedNovoClick(Sender: TObject);

begin
  inherited;
  Fields.ActivePage := tabPrincipal;
  edNome.SetFocus;
  LimparCampos;
end;

function TformMunicipioView.MakeObjectfromFields: TMunicipio;
var
  Municipio : TMunicipio;
begin
  FillChar(Result, SizeOf(TMunicipio), 0);
  Municipio := TMunicipio.Create(
      StrToIntDef(edId.Text,0),
      edNome.Text,
      edCNPJ.Text,
      edEmail.Text
  );

  Result := Municipio;

end;

procedure TformMunicipioView.Save;
var
  Municipio: TMunicipio;
begin
  Municipio := MakeObjectfromFields;
  (FController as IController<TMunicipio>).ProcessarEntidade(Municipio);
  FController.LoadData;

end;


procedure TformMunicipioView.edCNPJEnter(Sender: TObject);
begin
  inherited;
  edCNPJ.EditMask := '00.000.000/0000-00;0;_';
end;

procedure TformMunicipioView.edCNPJExit(Sender: TObject);
begin
  inherited;
  if edCNPJ.Text = '' then
    edCNPJ.EditMask := '';
end;


end.
