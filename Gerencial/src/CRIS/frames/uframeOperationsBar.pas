unit uframeOperationsBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.Buttons, Vcl.ExtCtrls;

type
  TOperationState = (osIdle, osEdit, osSaving);

  TframeOperationsBar = class(TframeMaster)
    panelFooterInserir: TPanel;
    speedSalvar: TSpeedButton;
    speedEditar: TSpeedButton;
    speedNovo: TSpeedButton;
    speedCancelar: TSpeedButton;
    speedExcluir: TSpeedButton;
  private
    { Private declarations }
    procedure UpdateButtonState(State: TOperationState);
  public
    { Public declarations }
    procedure SetButtonState(State: TOperationState);
  end;

var
  frameOperationsBar: TframeOperationsBar;

implementation

{$R *.dfm}



procedure TframeOperationsBar.UpdateButtonState(State: TOperationState);
begin
  case State of
    osIdle:
      begin
        speedNovo.Enabled := True;
        speedEditar.Enabled := False;
        speedCancelar.Enabled := False;
        speedSalvar.Enabled := False;
        speedExcluir.Enabled := False;
      end;
    osEdit:
      begin
        speedNovo.Enabled := False;
        speedEditar.Enabled := False;
        speedCancelar.Enabled := True;
        speedSalvar.Enabled := True;
        speedExcluir.Enabled := True;
      end;
    osSaving:
      begin
        speedNovo.Enabled := False;
        speedEditar.Enabled := True;
        speedCancelar.Enabled := False;
        speedSalvar.Enabled := False;
        speedExcluir.Enabled := False;
      end;
  end;
end;

procedure TframeOperationsBar.SetButtonState(State: TOperationState);
begin
  UpdateButtonState(State);
end;

end.

