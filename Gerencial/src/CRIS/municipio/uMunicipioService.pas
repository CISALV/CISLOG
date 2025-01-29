unit uMunicipioService;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,uDataConService;

type
  TmoduleMunicipio = class(TDataModule)
    Query: TFDQuery;
    QueryID: TIntegerField;
    QueryCNPJ: TStringField;
    QueryNOME: TStringField;
    QueryEMAIL: TStringField;
    QueryTELEFONE: TStringField;
    QueryRUA: TStringField;
    QueryNUMERO: TStringField;
    QueryBAIRRO: TStringField;
    QueryCOMPLEMENTO: TStringField;
    QueryCEP: TStringField;
    FDConnection1: TFDConnection;
  private
    Connection : TFDConnection;
  public
  end;

var
  moduleMunicipio: TmoduleMunicipio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TmoduleMunicipio }

end.
