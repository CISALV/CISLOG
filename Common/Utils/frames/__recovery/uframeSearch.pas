unit uframeSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.ExtCtrls,
  Vcl.StdCtrls, uInterfaces, Data.DB;

type
  TframeSearch = class(TframeMaster)
    edSearch: TEdit;
    cbFilter: TComboBox;
    pnlSearch: TPanel;
    procedure edSearchChange(Sender: TObject);
  private
    procedure SetController(const Value: ISearchController);
    procedure SetDataSource(const Value: TDataSource);

  protected
    FController: ISearchController;
    FDataSource: TDataSource;
    FFilterFields: TStrings;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Controller: ISearchController read FController write SetController;
    property DataSource: TDataSource read FDataSource write SetDataSource;

    procedure ConfigureFilterFields(const AFields: TArray<string>);
  end;

var
  frameSearch: TframeSearch;

implementation

{$R *.dfm}
procedure TframeSearch.ConfigureFilterFields(const AFields: TArray<string>);
begin
  cbFilter.Items.Clear;
  for var Field in AFields do
    cbFilter.Items.Add(Field);
  cbFilter.ItemIndex := 0;
end;
constructor TframeSearch.Create(AOwner: TComponent);
begin
  inherited;
  FFilterFields := TStringList.Create;
end;

destructor TframeSearch.Destroy;
begin
  FFilterFields.Free;
  inherited;
end;

procedure TframeSearch.edSearchChange(Sender: TObject);
var
  SelectedField: string;
begin
  inherited;
  if not Assigned(FController) or not Assigned(FDataSource) then
    Exit;

  if cbFilter.ItemIndex >= 0 then
    SelectedField := cbFilter.Items[cbFilter.ItemIndex];

  if Trim(edSearch.Text) = '' then
    FDataSource.DataSet := FController.LoadData
  else
    FDataSource.DataSet := FController.FilterDataSet(SelectedField, edSearch.Text);
end;

procedure TframeSearch.SetController(const Value: ISearchController);
begin
  FController := Value;
end;

procedure TframeSearch.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

end.
