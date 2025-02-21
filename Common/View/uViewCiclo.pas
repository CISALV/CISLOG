unit uViewCiclo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterCRUDView, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, uframeOperationsBar, uMasterFrame, uframeSearch, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ComCtrls, uControllerCiclo,uInterfaces,uCiclo,
  uCicloDAO, Vcl.Buttons;

type
  TformViewCiclo = class(TformMasterCRUDView)
    edNome: TEdit;
    edId: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edTipo: TEdit;
    procedure FormCreate(Sender: TObject);
  private

  public
    procedure Save; override;
    procedure Delete;
    function CreateController: ISearchController; override;
    function WrapObject : TCiclo;
  end;

var
  formViewCiclo: TformViewCiclo;

implementation

{$R *.dfm}


function TformViewCiclo.CreateController: ISearchController;
begin
 Result := TControllerCiclo.Create;
end;

procedure TformViewCiclo.Delete;
begin

end;

procedure TformViewCiclo.FormCreate(Sender: TObject);
begin
  inherited;
  SearchBar.ConfigureFilterFields(['NOME','TIPO']);


end;

procedure TformViewCiclo.Save;
var
 Ciclo : TCiclo;
begin
  Ciclo := WrapObject;
  (FController as ICRUDController<TCiclo>).PersistEntity(Ciclo);
  FController.LoadData;
end;



function TformViewCiclo.WrapObject: TCiclo;
begin
  Result := TCiclo.Create(
  StrtoIntDef(edId.Text,0),
  edNome.Text,
  edTipo.Text)
end;


end.
