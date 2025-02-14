unit uInterfaces;

interface

uses FireDAC.Comp.Client,uMunicipio,Data.DB;

type
  IController = interface
    ['{3322955C-5B9E-4495-ACCE-D260473497BF}']
    function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    function LoadData: TDataSet;
    function PopularView(MunicipioID: Integer): TMunicipio;
    procedure ProcessarEntidade(AMunicipio: TMunicipio);
    procedure AtualizarEntidade(AMunicipio: TMunicipio);
    procedure RemoverEntidade(MunicipioID: Integer);
  end;

  ISearchController = interface
    ['{4378C8BB-2A9D-4011-ADFF-540F0CFAD085}']
    function FilterDataSet(const AFieldName, ASearchText: string): TDataSet;
    function LoadData: TDataSet;
  end;

implementation

end.
