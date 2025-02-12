unit uframeSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.ExtCtrls, Vcl.StdCtrls,uInterfaces;

type
  TframeSearch = class(TframeMaster)
    ed: TEdit;
    cb: TComboBox;
    pnlPesquisa: TPanel;
  protected
  FFilterFields: TStrings;
  FConcreteCombo: TComboBox;
  FController : IController;
  procedure SetConcreteCombo(const Value : TComboBox);
  procedure SetFilterFields(const Value : TStrings);
  procedure edPesquisaChange(Sender: TObject); virtual;
  procedure ExecFiltering(const AFilterField, ASearchText: string); virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ReloadData; virtual; abstract;
    property ConcreteCombo: TComboBox read FConcreteCombo write SetConcreteCombo;
    property FilterFields: TStrings read FFilterFields write SetFilterFields;

  end;

var
  frameSearch: TframeSearch;

implementation

{$R *.dfm}


{ TframePesquisa }

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

procedure TframeSearch.edPesquisaChange(Sender: TObject);
var
  Filter: string;
  FilterField: string;
begin
  inherited;
  if ed.Text = '' then
  FController.CarregarDados
  else
  begin
    if Assigned(FConcreteCombo) then
      FilterField := FFilterFields[FConcreteCombo.ItemIndex]
    else
      FilterField := FFilterFields[0];

      ExecFiltering(FilterField, ed.Text);
  end;
end;

procedure TframeSearch.SetConcreteCombo(const Value: TComboBox);
begin
   FConcreteCombo := Value;
end;

procedure TframeSearch.SetFilterFields(const Value: TStrings);
begin
  FFilterFields.Assign(Value);
end;

end.
