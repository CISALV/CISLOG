unit uframeMunicipioFields;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMasterFrame, Vcl.StdCtrls, Vcl.ComCtrls,
  uframeOperationsBar, Data.DB, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TFields = class(TframeMaster)
    edNome: TEdit;
    edId: TEdit;
    edEmail: TEdit;
    edCNPJ: TMaskEdit;
    pnlFundo: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    property IdEdit: TEdit read edId write edId;
    property NomeEdit: TEdit read edNome write edNome;
    property CNPJEdit: TMaskEdit read edCNPJ write edCNPJ;
    property EmailEdit: TEdit read edEmail write edEmail;
  end;

var
  Fields: TFields;

implementation

{$R *.dfm}

{ TFields }
end.
