unit uMunicipioFieldCriar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterForm, Vcl.ExtCtrls, uMasterFrame,uDataConService,
  uframeMunicipioFields, Data.DB;

type
  TMunicipioFieldCriar = class(TformMaster)
    frameMunicipioField1: TframeMunicipioField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MunicipioFieldCriar: TMunicipioFieldCriar;

implementation

{$R *.dfm}

end.
