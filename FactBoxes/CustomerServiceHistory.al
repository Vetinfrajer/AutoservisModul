/// <summary>
/// Page Customer Service History (ID 50171).
/// </summary>
page 50171 "Customer Service History"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Service Order Header";

    layout
    {
        area(Content)
        {
            field(TotalAmount; rec."Amount")
            {
                ApplicationArea = All;
                Caption = 'Total Service Amount';
                ToolTip = 'Specifies the total amount of service orders for the customer.';
            }
            field("Line Count"; rec."Line Count")
            {
                ApplicationArea = All;
                Caption = 'No. of Service Orders';
                ToolTip = 'Specifies the number of service orders for the customer.';
            }
        }
    }
}
