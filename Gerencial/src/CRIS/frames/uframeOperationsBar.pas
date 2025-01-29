unit uframeOperationsBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.Buttons, Vcl.ExtCtrls;

type
    TframeOperationsBar = class(TframeMaster)
    panelFooterInserir: TPanel;
    speedSalvar: TSpeedButton;
    speedEditar: TSpeedButton;
    speedNovo: TSpeedButton;
    speedCancelar: TSpeedButton;
    speedExcluir: TSpeedButton;
    procedure speedCancelarClick(Sender: TObject);
    procedure speedNovoClick(Sender: TObject);
    procedure speedExcluirClick(Sender: TObject);
    procedure speedSalvarClick(Sender: TObject);
    procedure speedEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frameOperationsBar: TframeOperationsBar;

implementation

{$R *.dfm}

procedure TframeOperationsBar.speedCancelarClick(Sender: TObject);
begin
  inherited;
  speedCancelar.Enabled := False;
  speedExcluir.Enabled := False;
  speedSalvar.Enabled := False;
  speedNovo.Enabled := True;
end;


procedure TframeOperationsBar.speedEditarClick(Sender: TObject);
begin
  inherited;
   speedNovo.Enabled := False;
   speedCancelar.Enabled := True;
   speedExcluir.Enabled := True;
   speedSalvar.Enabled := True;
end;

procedure TframeOperationsBar.speedExcluirClick(Sender: TObject);
begin
  inherited;
    speedExcluir.Enabled := False;
    speedNovo.Enabled := True;
    speedCancelar.Enabled := False;
    speedSalvar.Enabled := False;
end;

procedure TframeOperationsBar.speedNovoClick(Sender: TObject);
begin
  inherited;
    speedNovo.Enabled := False;
    speedEditar.Enabled := False;
    speedCancelar.Enabled := True;
    speedSalvar.Enabled := True;
end;

procedure TframeOperationsBar.speedSalvarClick(Sender: TObject);
begin
  inherited;
    speedCancelar.Enabled := False;
    speedExcluir.Enabled := False;
    speedSalvar.Enabled := False;
    speedEditar.Enabled := True;
    speedNovo.Enabled := True;
end;

end.
