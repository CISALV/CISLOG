unit uAreaCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterform, uMasterFrame,
  uframeSearchCompras;

type
  TformCompras = class(TFormMaster)
    SearchCompras1: TSearchCompras;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCompras: TformCompras;

implementation

{$R *.dfm}

end.
