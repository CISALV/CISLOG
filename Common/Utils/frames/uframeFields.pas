unit uframeFields;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TframeFields = class(TframeMaster)
    pnlTitulo: TPanel;
    Tabs: TPageControl;
    Principal: TTabSheet;
    Endereço: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frameFields: TframeFields;

implementation

{$R *.dfm}

end.
