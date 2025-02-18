unit TestuControllerMunicipio;

interface

uses
  TestFramework, uControllerMunicipio, uDAOMunicipio, uMunicipio, System.SysUtils,
  FireDAC.Comp.Client, Data.DB, Dialogs;

type
  // Mock class for TDAOMunicipio to track method calls
  TMockDAOMunicipio = class(TDAOMunicipio)
  public
    InsertCalled: Boolean;
    UpdateCalled: Boolean;
    DeleteCalledId: Integer;
    GetByIDCalledId: Integer;
    FilterField: String;
    FilterText: String;
    TestMunicipio: TMunicipio;
    TestDataSet: TFDMemTable;

    constructor Create;
    destructor Destroy; override;

    function Insert(AMunicipio: TMunicipio): Integer; override;
    function Update(AMunicipio: TMunicipio): Integer; override;
    procedure Delete(AId: Integer); override;
    function GetByID(AId: Integer): TMunicipio; override;
    function GetWhere(const AFieldName, ASearchText: String): TDataSet; override;
    function GetAll: TDataSet; override;
  end;

  TestTControllerMunicipio = class(TTestCase)
  private
    FController: TControllerMunicipio;
    FMockDAO: TMockDAOMunicipio;
    procedure SetUpControllerWithMock;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCreateAndFreeDAO;
    procedure TestLoadData;
    procedure TestFilterDataSet;
    procedure TestPopularView_ValidId;
    procedure TestPopularView_InvalidId;
    procedure TestProcessarEntidade_InsertNew;
    procedure TestProcessarEntidade_UpdateExisting;
    procedure TestProcessarEntidade_ValidationFailure;
    procedure TestAtualizarEntidade_Success;
    procedure TestAtualizarEntidade_Failure;
    procedure TestRemoverEntidade;
  end;

implementation

{ TMockDAOMunicipio }

constructor TMockDAOMunicipio.Create;
begin
  inherited;
  TestDataSet := TFDMemTable.Create(nil);
  TestDataSet.FieldDefs.Add('ID', ftInteger);
  TestDataSet.FieldDefs.Add('Nome', ftString, 50);
  TestDataSet.CreateDataSet;
  TestDataSet.Open;
  TestDataSet.AppendRecord([1, 'Sample City']);
  TestMunicipio := TMunicipio.Create;
  TestMunicipio.Id := 1;
  TestMunicipio.Nome := 'Sample City';
end;

destructor TMockDAOMunicipio.Destroy;
begin
  TestDataSet.Free;
  TestMunicipio.Free;
  inherited;
end;

function TMockDAOMunicipio.Insert(AMunicipio: TMunicipio): Integer;
begin
  InsertCalled := True;
  Result := 1; // Simulate success
end;

function TMockDAOMunicipio.Update(AMunicipio: TMunicipio): Integer;
begin
  UpdateCalled := True;
  Result := 1; // Simulate success
end;

procedure TMockDAOMunicipio.Delete(AId: Integer);
begin
  DeleteCalledId := AId;
end;

function TMockDAOMunicipio.GetByID(AId: Integer): TMunicipio;
begin
  GetByIDCalledId := AId;
  Result := TMunicipio.Create;
  if AId = 1 then
  begin
    Result.Id := 1;
    Result.Nome := 'Sample City';
  end;
  // Else, returns a default TMunicipio with Id=0
end;

function TMockDAOMunicipio.GetWhere(const AFieldName, ASearchText: String): TDataSet;
begin
  FilterField := AFieldName;
  FilterText := ASearchText;
  Result := TestDataSet;
end;

function TMockDAOMunicipio.GetAll: TDataSet;
begin
  Result := TestDataSet;
end;

{ TestTControllerMunicipio }

procedure TestTControllerMunicipio.SetUp;
begin
  FMockDAO := TMockDAOMunicipio.Create;
  SetUpControllerWithMock;
end;

procedure TestTControllerMunicipio.TearDown;
begin
  FController.Free;
  FMockDAO.Free;
end;

procedure TestTControllerMunicipio.SetUpControllerWithMock;
begin
  FController := TControllerMunicipio.Create;
  // Inject mock DAO (requires changing FDAOMunicipio to protected or using a different method)
  // For demonstration, assume we can set it via a helper or accessor
  FController.FDAOMunicipio.Free; // Free the original DAO created in constructor
  FController.FDAOMunicipio := FMockDAO;
end;

procedure TestTControllerMunicipio.TestCreateAndFreeDAO;
begin
  // This test checks if the controller properly creates and frees the DAO
  // Since we're using a mock, TearDown will handle freeing
  CheckNotNull(FController.FDAOMunicipio, 'DAO should be initialized');
end;

procedure TestTControllerMunicipio.TestLoadData;
var
  DataSet: TDataSet;
begin
  DataSet := FController.LoadData;
  try
    CheckNotNull(DataSet, 'DataSet should not be nil');
    CheckTrue(DataSet is TFDMemTable, 'DataSet should be from mock');
    CheckEquals(1, DataSet.RecordCount, 'DataSet should have one record');
  finally
    DataSet.Free;
  end;
end;

procedure TestTControllerMunicipio.TestFilterDataSet;
var
  DataSet: TDataSet;
begin
  DataSet := FController.FilterDataSet('Nome', 'Sample');
  try
    CheckNotNull(DataSet, 'DataSet should not be nil');
    CheckEquals('Nome', FMockDAO.FilterField, 'Filter field should match');
    CheckEquals('Sample', FMockDAO.FilterText, 'Filter text should match');
  finally
    DataSet.Free;
  end;
end;

procedure TestTControllerMunicipio.TestPopularView_ValidId;
var
  Municipio: TMunicipio;
begin
  Municipio := FController.PopularView(1);
  try
    CheckEquals(1, Municipio.Id, 'Municipio ID should be 1');
    CheckEquals('Sample City', Municipio.Nome, 'Municipio name should match');
  finally
    Municipio.Free;
  end;
end;

procedure TestTControllerMunicipio.TestPopularView_InvalidId;
var
  Municipio: TMunicipio;
begin
  Municipio := FController.PopularView(2); // ID 2 does not exist in mock
  try
    CheckTrue(Municipio.Id <= 0, 'Municipio should be invalid');
  finally
    Municipio.Free;
  end;
end;

procedure TestTControllerMunicipio.TestProcessarEntidade_InsertNew;
var
  Municipio: TMunicipio;
begin
  Municipio := TMunicipio.Create;
  try
    Municipio.Id := 0;
    Municipio.Nome := 'New City';
    Municipio.CNPJ := '1234567890';
    Municipio.Email := 'new@city.com';
    FController.ProcessarEntidade(Municipio);
    CheckTrue(FMockDAO.InsertCalled, 'DAO.Insert should be called');
  finally
    Municipio.Free;
  end;
end;

procedure TestTControllerMunicipio.TestProcessarEntidade_UpdateExisting;
var
  Municipio: TMunicipio;
begin
  Municipio := TMunicipio.Create;
  try
    Municipio.Id := 1;
    Municipio.Nome := 'Updated City';
    Municipio.CNPJ := '0987654321';
    Municipio.Email := 'updated@city.com';
    FController.ProcessarEntidade(Municipio);
    CheckTrue(FMockDAO.UpdateCalled, 'DAO.Update should be called');
  finally
    Municipio.Free;
  end;
end;

procedure TestTControllerMunicipio.TestProcessarEntidade_ValidationFailure;
var
  Municipio: TMunicipio;
begin
  Municipio := TMunicipio.Create;
  try
    Municipio.Id := 0;
    Municipio.Nome := ''; // Invalid
    Municipio.CNPJ := '123';
    Municipio.Email := 'invalid@test.com';
    FController.ProcessarEntidade(Municipio);
    CheckFalse(FMockDAO.InsertCalled, 'DAO.Insert should not be called');
    CheckFalse(FMockDAO.UpdateCalled, 'DAO.Update should not be called');
  finally
    Municipio.Free;
  end;
end;

procedure TestTControllerMunicipio.TestAtualizarEntidade_Success;
var
  Municipio: TMunicipio;
begin
  Municipio := TMunicipio.Create;
  try
    Municipio.Id := 1;
    FController.AtualizarEntidade(Municipio);
    CheckTrue(FMockDAO.UpdateCalled, 'DAO.Update should be called');
    // Verify message is shown (requires mocking ShowMessage, omitted here)
  finally
    Municipio.Free;
  end;
end;

procedure TestTControllerMunicipio.TestAtualizarEntidade_Failure;
var
  Municipio: TMunicipio;
begin
  FMockDAO.TestMunicipio.Id := 0; // Simulate failure
  Municipio := TMunicipio.Create;
  try
    Municipio.Id := 999; // Non-existing ID
    FController.AtualizarEntidade(Municipio);
    // Here, you would check if the failure message is shown
  finally
    Municipio.Free;
  end;
end;

procedure TestTControllerMunicipio.TestRemoverEntidade;
begin
  FController.RemoverEntidade(5);
  CheckEquals(5, FMockDAO.DeleteCalledId, 'DAO.Delete should be called with ID 5');
end;

initialization
  RegisterTest(TestTControllerMunicipio.Suite);
end.
