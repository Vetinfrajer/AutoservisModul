/// <summary>
/// Page Customer Service History FactBox (ID 50171).
/// </summary>
page 50171 "Customer Service History"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Service Order Line";

    layout
    {
        area(Content)
        {
            field(customer; Rec."Sell-To Customer No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell To Customer field.';
            }
            field("Service Action No."; Rec."Service Action No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Service Action No. field.';

            }
            field("Service Action Desc."; Rec."Service Action Desc.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Service Action Description field.';

            }
        }
    }
}