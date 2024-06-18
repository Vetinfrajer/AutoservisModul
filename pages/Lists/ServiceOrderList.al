/// <summary>
/// Page Service Order List (ID 50114).
/// </summary>
page 50158 "Service Order List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Order Header";
    CardPageId = "Service Order Page";
    Caption = 'Service Order List';

    layout
    {
        area(Content)
        {
            Repeater(Lines)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order ID field.';
                }
                field("Sell-To"; Rec."Sell-To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
                field("Bill-To"; Rec."Bill-To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To field.';
                }


            }
        }
    }
}