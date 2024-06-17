/// <summary>
/// OnAction.
/// </summary>
page 50110 "Vehicle Card"
{
    PageType = Card;
    Caption = 'Vehicle Card';
    ApplicationArea = All;
    SourceTable = Vehicle;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle ID field.';
                }
                field("Plate No."; Rec."Plate No.")
                {
                    ToolTip = 'Specifies the value of the Licence Plate field.';
                }
                field("Line Count"; Rec."Serv. Order Line Count")
                {
                    ToolTip = 'Specifies the value of the Service Order Line Count field.';
                }
                field("Service Order Amount"; Rec."Service Order Amt.")
                {
                    ToolTip = 'Specifies the value of the Service Order Amount field.';
                }


            }
        }
        area(FactBoxes)
        {
            part(CustomerFactBox; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Customer No.");
            }
        }
    }
}