/// <summary>
/// OnAction.
/// </summary>
page 50115 "Service Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Setup";

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
}