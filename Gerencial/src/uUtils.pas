unit uUtils;

interface
  uses
    Vcl.Controls, Vcl.StdCtrls;

    type
    TUtils = class
    public
      class procedure ClearEdits(Parent: TWinControl);
    end;

implementation

class procedure TUtils.ClearEdits(Parent: TWinControl);
var
 i : Integer;
 begin
   for i := 0 to Parent.ControlCount - 1 do
   begin
     if Parent.Controls[i] is TEdit then
     TEdit(Parent.Controls[i]).Clear
   end;
 end;
end.
