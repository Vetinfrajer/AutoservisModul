/// <summary>
/// OnAction.
/// </summary>
page 50110 "Vehicle Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = Vehicle;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle ID field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
                field("Plate No."; Rec."Plate No.")
                {
                    ToolTip = 'Specifies the value of the Plate No. field.';
                }
                field("Serv. Order Line Count"; Rec."Serv. Order Line Count")
                {
                    ToolTip = 'Specifies the value of the Serv. Order Line Count field.';
                }
                field("Service Order Amt."; Rec."Service Order Amt.")
                {
                    ToolTip = 'Specifies the value of the Service Order Amt. field.';
                }
            }
        }
        area(FactBoxes)
        {
            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Customer No.");
            }
        }
    }
}