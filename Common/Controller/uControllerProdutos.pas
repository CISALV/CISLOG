unit uControllerProdutos;

interface

uses uInterfaces,Data.DB;
type
 TControllerProdutos = class(TInterfacedObject, IController)
    constructor Create;
    destructor Destroy; override;

    function FilterDataSet(const AFieldName, ASearchText: String): TDataSet;
    function LoadData: TDataSet;

    //function PopularView(MunicipioID: Integer): TMunicipio;
    //procedure ProcessarEntidade(AMunicipio: TMunicipio);
    //procedure AtualizarEntidade(AMunicipio: TMunicipio);
    //procedure RemoverEntidade(MunicipioID: Integer);
  end;

implementation


end.
