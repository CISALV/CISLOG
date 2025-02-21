program Gerencial;

uses
  Vcl.Forms,
  uMasterForm in '..\Common\uMasterForm.pas' {formMaster},
  uMasterFrame in '..\Common\uMasterFrame.pas' {frameMaster: TFrame},
  uframeMenuButton in '..\Common\Utils\frames\uframeMenuButton.pas' {frameMenuButton: TFrame},
  uframeOperationsBar in '..\Common\Utils\frames\uframeOperationsBar.pas' {frameOperationsBar: TFrame},
  uframeSearchBar in '..\Common\Utils\frames\uframeSearchBar.pas' {frameSearchBar: TFrame},
  uPrincipal in 'src\uPrincipal.pas' {formPrincipal},
  uMenuCadastro in 'src\uMenuCadastro.pas' {formMenuCadastros},
  uFormFactory in '..\Common\Utils\uFormFactory.pas',
  uMasterCRUDView in '..\Common\uMasterCRUDView.pas' {formMasterCRUDView},
  uViewMunicipio in '..\Common\View\uViewMunicipio.pas' {formViewMunicipio},
  uControllerMunicipio in '..\Common\Controller\uControllerMunicipio.pas',
  uInterfaces in '..\Common\Interfaces\uInterfaces.pas',
  uMunicipio in '..\Common\Model\Entities\uMunicipio.pas',
  uframeSearch in '..\Common\Utils\frames\uframeSearch.pas' {frameSearch: TFrame},
  uDataConService in '..\Common\Utils\uDataConService.pas',
  uDAOMunicipio in '..\Common\Model\DAO\uDAOMunicipio.pas',
  uViewProduto in '..\Common\View\uViewProduto.pas' {formViewProduto},
  uframePages in '..\Common\Utils\frames\uframePages.pas' {framePages: TFrame},
  uMasterDAO in '..\Common\uMasterDAO.pas',
  uProduto in '..\Common\Model\Entities\uProduto.pas',
  uDAOProduto in '..\Common\Model\DAO\uDAOProduto.pas',
  uMasterController in '..\Common\uMasterController.pas',
  uControllerProduto in '..\Common\Controller\uControllerProduto.pas',
  uMockProduto in '..\Common\Model\Entities\uMockProduto.pas',
  uDAOMockProduto in '..\Common\Model\DAO\uDAOMockProduto.pas',
  uViewMockProduto in '..\Common\View\uViewMockProduto.pas' {formViewMockProduto},
  uControllerMockProduto in '..\Common\Controller\uControllerMockProduto.pas',
  uView_Pedidos in '..\Common\View\uView_Pedidos.pas' {formGerenciarPedido},
  uViewCiclo in '..\Common\View\uViewCiclo.pas' {formViewCiclo},
  uControllerCiclo in '..\Common\Controller\uControllerCiclo.pas',
  uCiclo in '..\Common\Model\Entities\uCiclo.pas',
  uCicloDAO in '..\Common\Model\DAO\uCicloDAO.pas',
  uViewGerenciarPedidos in '..\Common\View\uViewGerenciarPedidos.pas' {formViewGerenciarCiclo},
  uDAOGerenciarPedidos in '..\Common\Model\DAO\uDAOGerenciarPedidos.pas',
  uDMConnection in '..\Common\Utils\uDMConnection.pas' {DMConnection: TDataModule},
  teste in 'src\teste.pas' {Form1};

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
