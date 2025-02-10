program Compras;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {formPrincipal},
  uMasterform in 'src\master\uMasterform.pas' {FormMaster},
  uMasterFrame in 'src\master\uMasterFrame.pas' {frameMaster: TFrame},
  uframeSearchCompras in 'src\frames\uframeSearchCompras.pas' {SearchCompras: TFrame},
  uAreaComprasView in 'src\compras\uAreaComprasView.pas' {formComprasView},
  uFormFactory in '..\Common\uFormFactory.pas',
  uPedidoDAO in 'src\compras\uPedidoDAO.pas',
  uDataConService in '..\Common\uDataConService.pas',
  uBaseVigenciaDAO in 'src\compras\uBaseVigenciaDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
