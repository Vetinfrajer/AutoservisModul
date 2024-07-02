/// <summary>
/// OnAction.
/// </summary>
page 50162 "Service Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Setup";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Service Order Nos"; Rec."Service Order Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order Nos field.';
                }
                field("Vehicle Nos."; Rec."Vehicle Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Nos. field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        LastRecord: Record "Service Setup";
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}