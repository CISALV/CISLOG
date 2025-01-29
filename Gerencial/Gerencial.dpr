program Gerencial;

uses
  Vcl.Forms,
  uMasterForm in 'src\master\uMasterForm.pas' {formMaster},
  uPrincipal in 'src\uPrincipal.pas' {formPrincipal},
  uMasterFrame in 'src\master\uMasterFrame.pas' {frameMaster: TFrame},
  uframeOperationsBar in 'src\CRIS\frames\uframeOperationsBar.pas' {frameOperationsBar: TFrame},
  uframeSearchBar in 'src\CRIS\frames\uframeSearchBar.pas' {frameSearchBar: TFrame},
  uMenuCadastro in 'src\uMenuCadastro.pas' {formMenuCadastros},
  ucBaseDados in 'src\services\ucBaseDados.pas',
  DataService in 'src\services\DataService.pas' {moduleDatabase: TDataModule},
  uMasterCRIS in 'src\master\uMasterCRIS.pas' {formMasterCRIS},
  uframeMenuButton in 'src\frames\uframeMenuButton.pas' {frameMenuButton: TFrame},
  uframeMainBar in 'src\frames\uframeMainBar.pas' {frameMainBar: TFrame},
  uFormFactory in 'src\uFormFactory.pas',
  malfunctioningdatacon in 'src\services\malfunctioningdatacon.pas' {DataConModule: TDataModule},
  uUsuarioView in 'src\CRIS\usuario\uUsuarioView.pas' {formUsuarioCRIS},
  uDataConService in 'uDataConService.pas',
  uMunicipioView in 'src\CRIS\municipio\uMunicipioView.pas' {formMunicipioView},
  uMunicipioDAO in 'src\CRIS\municipio\uMunicipioDAO.pas',
  uMunicipioModel in 'src\CRIS\municipio\uMunicipioModel.pas',
  uMunicipioController in 'src\CRIS\municipio\uMunicipioController.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
