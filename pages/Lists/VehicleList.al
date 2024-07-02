/// <summary>
/// OnAction.
/// </summary>
page 50156 "Vehicle List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Vehicle;
    CardPageId = "Vehicle Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle ID field.';
                }
                field("Customer ID"; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
                field("Plate No."; Rec."Plate No.")
                {
                    ToolTip = 'Specifies the value of the Licence Plate field.';
                }
            }
        }
        area(FactBoxes)
        {
            part("Vehicle List Factbox"; "Vehicle List Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}