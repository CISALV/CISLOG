program Compras;

uses
  Vcl.Forms,
  uInterfaces in '..\Common\Interfaces\uInterfaces.pas',
  uAreaComprasView in '..\Common\View\uAreaComprasView.pas' {formComprasView},
  uControllerCompras in '..\Common\Controller\uControllerCompras.pas',
  uMasterForm in '..\Common\uMasterForm.pas' {formMaster},
  uMunicipio in '..\Common\Model\Entities\uMunicipio.pas',
  uDataConService in '..\Common\Utils\uDataConService.pas',
  uDAOMunicipio in '..\Common\Model\DAO\uDAOMunicipio.pas',
  uFormFactory in '..\Common\Utils\uFormFactory.pas',
  uMasterFrame in '..\Common\uMasterFrame.pas' {frameMaster: TFrame},
  uPrincipal in 'src\uPrincipal.pas' {formPrincipal},
  uframeSearch in '..\Common\Utils\frames\uframeSearch.pas' {frameSearch: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
