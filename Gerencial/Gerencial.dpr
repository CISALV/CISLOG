program Gerencial;

uses
  Vcl.Forms,
  uMasterForm in 'src\master\uMasterForm.pas' {formMaster},
  uPrincipal in 'src\uPrincipal.pas' {formPrincipal},
  uMasterFrame in 'src\master\uMasterFrame.pas' {frameMaster: TFrame},
  uframeOperationsBar in 'src\CRIS\frames\uframeOperationsBar.pas' {frameOperationsBar: TFrame},
  uframeSearchBar in 'src\CRIS\frames\uframeSearchBar.pas' {frameSearchBar: TFrame},
  uMenuCadastro in 'src\uMenuCadastro.pas' {formMenuCadastros},
  uMasterCRUDView in 'src\master\uMasterCRUDView.pas' {formMasterCRUDView},
  uframeMenuButton in 'src\frames\uframeMenuButton.pas' {frameMenuButton: TFrame},
  uframeMainBar in 'src\frames\uframeMainBar.pas' {frameMainBar: TFrame},
  uUsuarioView in 'src\CRIS\usuario\uUsuarioView.pas' {formUsuarioCRIS},
  uMunicipioView in 'src\CRIS\municipio\uMunicipioView.pas' {formMunicipioView},
  uMunicipioDAO in 'src\CRIS\municipio\uMunicipioDAO.pas',
  uMunicipioModel in 'src\CRIS\municipio\uMunicipioModel.pas',
  uMunicipioController in 'src\CRIS\municipio\uMunicipioController.pas',
  uFormFactory in '..\Common\uFormFactory.pas',
  uDataConService in '..\Common\uDataConService.pas',
  uMunicipioDTO in 'src\CRIS\municipio\uMunicipioDTO.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
