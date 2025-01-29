program Compras;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form4},
  uMasterform in 'src\master\uMasterform.pas' {FormMaster},
  uMasterFrame in 'src\master\uMasterFrame.pas' {frameMaster: TFrame},
  uframeSearchCompras in 'src\frames\uframeSearchCompras.pas' {SearchCompras: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
