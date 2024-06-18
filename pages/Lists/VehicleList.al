/// <summary>
/// OnAction.
/// </summary>
page 50156 "Vehicle List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Vehicle;
    CardPageId = 50161;

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
                field("Service Order Line Count"; Rec."Serv. Order Line Count")
                {
                    ToolTip = 'Specifies the value of the Service Order Line Count field.';
                }
                field("Service Order Amount"; Rec."Service Order Amt.")
                {
                    ToolTip = 'Specifies the value of the Service Order Amount field.';
                }
            }
        }
    }
}