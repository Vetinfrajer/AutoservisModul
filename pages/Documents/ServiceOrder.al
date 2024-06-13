/// <summary>
/// Page Service Order (ID 50113).
/// </summary> 
page 50113 "Service Order Page"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Service Order Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ID; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order ID field.';
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                    end;
                }
            }
        }
    }
}