program Compras;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {formPrincipal},
  uMasterform in 'src\master\uMasterform.pas' {FormMaster},
  uMasterFrame in 'src\master\uMasterFrame.pas' {frameMaster: TFrame},
  uFormFactory in '..\Common\uFormFactory.pas',
  uDataConService in '..\Common\uDataConService.pas',
  uBaseVigenciaDAO in 'src\MVC\DAO\uBaseVigenciaDAO.pas',
  uPedidoDAO in 'src\MVC\DAO\uPedidoDAO.pas',
  uAreaComprasView in 'src\MVC\View\uAreaComprasView.pas' {formComprasView},
  uProdutoDAO in 'src\MVC\DAO\uProdutoDAO.pas',
  uframeSearch in '..\Common\uframeSearch.pas' {frameSearch: TFrame},
  uControllerCompras in 'src\MVC\Controller\uControllerCompras.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
