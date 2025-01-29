unit uframeMenuButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.Buttons, Vcl.ExtCtrls;

type
  TframeMenuButton = class(TframeMaster)
    panel: TPanel;
    speed: TSpeedButton;
    procedure speedMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure speedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
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
   panel.BevelOuter := BvLowered;
end;

procedure TframeMenuButton.speedMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  panel.BevelOuter := BvRaised;
end;

end.
