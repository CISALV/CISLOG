unit uframeSearchCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSearchCompras = class(TframeMaster)
    pnlFundo: TPanel;
    edPesquisa: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchCompras: TSearchCompras;

implementation

{$R *.dfm}

end.
