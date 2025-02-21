unit uViewGerenciarCiclo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, Data.DB, uMasterFrame,
  uframeSearch, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TformViewGerenciarCiclo = class(TformMaster)
    PageControl1: TPageControl;
    tabGerenciar: TTabSheet;
    Panel1: TPanel;
    speedHabilitar: TSpeedButton;
    speedSelection: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    frameSearch1: TframeSearch;
    frameSearch2: TframeSearch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formViewGerenciarCiclo: TformViewGerenciarCiclo;

implementation

{$R *.dfm}

end.
