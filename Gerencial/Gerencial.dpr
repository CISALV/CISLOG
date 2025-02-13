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
  uViewMunicipio in '..\Common\View\uViewMunicipio.pas' {formMunicipioView},
  uControllerMunicipio in '..\Common\Controller\uControllerMunicipio.pas',
  uInterfaces in '..\Common\Interfaces\uInterfaces.pas',
  uMunicipio in '..\Common\Model\Entities\uMunicipio.pas',
  uframeSearch in '..\Common\Utils\frames\uframeSearch.pas' {frameSearch: TFrame},
  uDataConService in '..\Common\Utils\uDataConService.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMaster, formMaster);
  Application.Run;
end.
