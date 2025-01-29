unit uFormFactory;

interface

uses Vcl.Forms, Vcl.Controls;

type
TFormFactory = class
private
 class var FActualForm : TForm;
public
  class function CreateAndShowForm(AForm: TFormClass; AParent: TWinControl): TForm;
  class function CreateAndShowModal(AForm: TFormClass; AParent: TWinControl): TForm;
  end;

implementation

class function TFormFactory.CreateAndShowForm(Aform: TFormClass; AParent: TWinControl): TForm;
begin
  //if Assigned(FActualForm) then
  //begin
  //  FActualForm.Free;
  //  FActualForm := nil;
  // end
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
end;

class function TFormFactory.CreateAndShowModal(AForm: TFormClass; AParent: TWinControl): TForm;
 var
  NewModal: TForm;
  begin
    if not Assigned(AForm) then
      Exit;

  NewModal := AForm.Create(Application);

    try

      NewModal.Parent := AParent;
      NewModal.Align := alClient;
      NewModal.ShowModal;
    except
      NewModal.Free;
      raise;
    end;
  end;
end.
