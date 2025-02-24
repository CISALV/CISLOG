program Gerencial;

uses
  Vcl.Forms,
  uMasterForm in '..\Common\Utils\uMasterForm.pas' {formMaster},
  uMasterFrame in '..\Common\Utils\frames\uMasterFrame.pas' {frameMaster: TFrame},
  uframeMenuButton in '..\Common\Utils\frames\uframeMenuButton.pas' {frameMenuButton: TFrame},
  uframeOperationsBar in '..\Common\Utils\frames\uframeOperationsBar.pas' {frameOperationsBar: TFrame},
  uframeSearchBar in '..\Common\Utils\frames\uframeSearchBar.pas' {frameSearchBar: TFrame},
  uPrincipal in 'src\uPrincipal.pas' {formPrincipal},
  uMenuCadastro in 'src\uMenuCadastro.pas' {formMenuCadastros},
  uFormFactory in '..\Common\Utils\uFormFactory.pas',
  uMasterCRUDView in '..\Common\View\uMasterCRUDView.pas' {formMasterCRUDView},
  uInterfaces in '..\Common\Interfaces\uInterfaces.pas',
  uMunicipio in '..\Common\Model\Entities\uMunicipio.pas',
  uframeSearch in '..\Common\Utils\frames\uframeSearch.pas' {frameSearch: TFrame},
  uDataConService in '..\Common\Utils\uDataConService.pas',
  uDAOMunicipio in '..\Common\Model\DAO\uDAOMunicipio.pas',
  uViewProduto in '..\Common\View\uViewProduto.pas' {formViewProduto},
  uframePages in '..\Common\Utils\frames\uframePages.pas' {framePages: TFrame},
  uProduto in '..\Common\Model\Entities\uProduto.pas',
  uDAOProduto in '..\Common\Model\DAO\uDAOProduto.pas',
  uBaseCRUDController in '..\Common\Controller\uBaseCRUDController.pas',
  uMockProduto in '..\Common\Model\Entities\uMockProduto.pas',
  uDAOMockProduto in '..\Common\Model\DAO\uDAOMockProduto.pas',
  uView_Pedidos in '..\Common\View\uView_Pedidos.pas' {form_Pedidos},
  uViewCiclo in '..\Common\View\uViewCiclo.pas' {formViewCiclo},
  uCiclo in '..\Common\Model\Entities\uCiclo.pas',
  uCicloDAO in '..\Common\Model\DAO\uCicloDAO.pas',
  uViewGerenciarCiclos in '..\Common\View\uViewGerenciarCiclos.pas' {formViewGerenciarCiclo},
  uDAOGerenciarPedidos in '..\Common\Model\DAO\uDAOGerenciarPedidos.pas',
  uControllerHabilitacao in '..\Common\Controller\uControllerHabilitacao.pas',
  uViewMockProduto in '..\Common\View\uViewMockProduto.pas' {formViewMockProduto},
  uBaseDAO in '..\Common\Model\DAO\uBaseDAO.pas',
  uControllerCiclo in '..\Common\Controller\uControllerCiclo.pas',
  uControllerMunicipio in '..\Common\Controller\uControllerMunicipio.pas',
  uViewMunicipio in '..\Common\View\uViewMunicipio.pas' {formViewMunicipio},
  uControllerProduto in '..\Common\Controller\uControllerProduto.pas',
  uControllerMockProduto in '..\Common\Controller\uControllerMockProduto.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TformViewMockProduto, formViewMockProduto);
  Application.Run;
end.
