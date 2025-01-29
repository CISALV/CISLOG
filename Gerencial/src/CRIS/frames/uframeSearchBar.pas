unit uframeSearchBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TframeSearchBar = class(TframeMaster)
    panelPesquisa: TPanel;
    combox: TComboBox;
    edit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frameSearchBar: TframeSearchBar;

implementation

{$R *.dfm}

end.
