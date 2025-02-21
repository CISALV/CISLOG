unit uViewGerenciarPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, Vcl.StdCtrls, Data.DB,
  uMasterFrame, uframeSearch, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.DApt, Vcl.Mask, FireDAC.Phys.FB, FireDAC.Phys.FBDef, Vcl.DBCtrls,
  uFormFactory, uViewCiclo, uViewGerenciarCiclo;

type
  TformGerenciarPedido = class(TformMaster)
    Panel2: TPanel;
    speedCiclo: TSpeedButton;
    pnlFundo: TPanel;
    speedGerenciar: TSpeedButton;
    procedure speedCicloClick(Sender: TObject);
    procedure speedGerenciarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formGerenciarPedido: TformGerenciarPedido;

implementation



{$R *.dfm}

uses uDataConService;

procedure TformGerenciarPedido.speedCicloClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformViewCiclo,pnlFundo);
end;

procedure TformGerenciarPedido.speedGerenciarClick(Sender: TObject);
begin
  inherited;
  TFormFactory.CreateAndShowForm(TformViewGerenciarCiclo,pnlFundo);
end;

end.
