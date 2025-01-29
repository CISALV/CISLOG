program Compras;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {formPrincipal},
  uMasterform in 'src\master\uMasterform.pas' {FormMaster},
  uMasterFrame in 'src\master\uMasterFrame.pas' {frameMaster: TFrame},
  uframeSearchCompras in 'src\frames\uframeSearchCompras.pas' {SearchCompras: TFrame},
  uAreaComprasView in 'src\compras\uAreaComprasView.pas' {formComprasView},
  uFormFactory in '..\Common\uFormFactory.pas',
  comprasDAO in 'src\compras\comprasDAO.pas',
  uDataConService in '..\Common\uDataConService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
