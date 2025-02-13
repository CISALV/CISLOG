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
  uControllerMunicipio, uInterfaces;

type
  TformMunicipioView = class(TformMasterCRUDView)
    Fields: TPageControl;
    Principal: TTabSheet;
    edNome: TEdit;
    edId: TEdit;
    edEmail: TEdit;
    edCNPJ: TMaskEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure dbgridPesquisaDblClick(Sender: TObject);
    procedure CarregarMunicipio(MunicipioID: Integer);

    procedure operationsBarspeedNovoClick(Sender: TObject);
    procedure operationsBarspeedCancelarClick(Sender: TObject);
    procedure Save; override;
    procedure Delete; override;

    function MakeDTOfromFields: TMunicipioDTO;

    procedure edCNPJEnter(Sender: TObject);
    procedure edCNPJExit(Sender: TObject);

  private

  protected
      function CreateController: IController; override;

  public
    { Public declarations }
  end;

var
  formMunicipioView: TformMunicipioView;
  Query: TFDQuery;
  edId: TEdit;
  edNome: TEdit;
  edCNPJ: TMaskEdit;
  edEmail: TEdit;
  Fields: TPageControl;

implementation

{$R *.dfm}

procedure TformMunicipioView.FormShow(Sender: TObject);
var
  Col: TColumn;
begin
  inherited;

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

function TformMunicipioView.CreateController: IController;
begin
  Result := TMunicipioController.Create;
end;

procedure TformMunicipioView.dbgridPesquisaDblClick(Sender: TObject);
var
  MunicipioID: Integer;
begin
  inherited;
  Fields.ActivePage := Principal;
  MunicipioID := FDataSource.DataSet.FieldByName('id').AsInteger;
  CarregarMunicipio(MunicipioID);
end;

procedure TformMunicipioView.CarregarMunicipio(MunicipioID: Integer);
var
  MunicipioDTO: TMunicipioDTO;
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
  RecarregarDados;
end;

procedure TformMunicipioView.Delete;
var
  Id: Integer;
begin
  inherited;
  Id := StrtoInt(edId.Text);
  FController.RemoverEntidade(Id);
  RecarregarDados;
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

procedure TformMunicipioView.Save;
var
  MunicipioDTO: TMunicipioDTO;
begin
  MunicipioDTO := MakeDTOfromFields;

  if (MunicipioDTO.Nome = '') or (MunicipioDTO.CNPJ = '') or
    (MunicipioDTO.Email = '') then
  begin
    ShowMessage('Todos os campos são necessários');
    panelLateral.Visible := True;
    Exit;
  end;

  FController.ProcessarEntidade(MunicipioDTO);
  RecarregarDados;

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
