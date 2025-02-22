unit uframeMenuButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.Buttons, Vcl.ExtCtrls;

type
  TframeMenuButton = class(TframeMaster)
    panel: TPanel;
    speed: TSpeedButton;
    procedure speedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    class var LastClicked: TframeMenuButton;
  public
    { Public declarations }
  end;

var
  frameMenuButton: TframeMenuButton;

implementation

{$R *.dfm}

procedure TframeMenuButton.speedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;


  if Assigned(LastClicked) and (LastClicked <> Self) then
  begin
    LastClicked.panel.BevelOuter := BvRaised;
    LastClicked.panel.Color := clWhite;
  end;

  panel.BevelOuter := BvLowered;
  panel.Color := rgb(240, 240, 240);//rgb(0, 120, 215);
  LastClicked := Self;
end;

end.

