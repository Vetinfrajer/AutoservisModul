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
                field("Service Nos"; Rec."Service Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Nos field.';
                }
                field("Service Order Nos"; Rec."Service Order Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order Nos field.';
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