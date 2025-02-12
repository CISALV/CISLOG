unit uFormFactory;

interface

uses Vcl.Forms, Vcl.Controls;

type
TFormFactory = class
private
 class var FActualForm : TForm;
public
  class function CreateAndShowForm(AForm: TFormClass; AParent: TWinControl): TForm;
  end;

implementation

class function TFormFactory.CreateAndShowForm(Aform: TFormClass; AParent: TWinControl): TForm;
begin
  FActualForm := AForm.Create(Application);
  try

    FActualForm.Parent := AParent;
    FActualForm.Align := alClient;
    FActualForm.Show;
  except
    FActualForm.Free;
    FActualForm := nil;
    raise;
  end;
end;
end.

