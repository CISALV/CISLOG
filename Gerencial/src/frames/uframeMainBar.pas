unit uframeMainBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, uframeMenuButton,
  Vcl.ExtCtrls;

type
  TframeMainBar = class(TframeMaster)
    panelTaskbar: TPanel;
    Cadastro: TframeMenuButton;
    procedure CadastrospeedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frameMainBar: TframeMainBar;

implementation

{$R *.dfm}

procedure TframeMainBar.CadastrospeedClick(Sender: TObject);
begin
  inherited;
  Cadastro.panel.BevelOuter := bvLowered;
end;

end.
