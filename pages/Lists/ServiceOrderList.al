/// <summary>
/// Page Service Order List (ID 50114).
/// </summary>
page 50114 "Service Order List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Order Header";

    layout
    {
        area(Content)
        {
            Repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order ID field.';

                }
            }
        }
    }
}