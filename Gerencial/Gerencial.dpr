program Gerencial;

uses
  Vcl.Forms,
  uFormFactory in '..\Common\uFormFactory.pas',
  uDataConService in '..\Common\uDataConService.pas',
  uframeSearch in '..\Common\uframeSearch.pas' {frameSearch: TFrame};

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
