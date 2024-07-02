/// <summary>
/// Page Service Line Details (ID 50172).
/// </summary>
page 50172 "Service Order Line Details"
{
    Caption = 'Service Line Details';
    PageType = CardPart;
    SourceTable = "Service Order Line";

    layout
    {
        area(content)
        {
            field("Service Order No."; Rec."Service Order No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Service Order No.';
                ToolTip = 'Specifies the service order number that this line belongs to.';
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Line No.';
                ToolTip = 'Specifies the line number within the service order.';
            }
            field("Sell-To"; Rec."Sell-To Customer No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sell To Customer';
                ToolTip = 'Specifies the customer who will be billed for this service order.';
            }
            field("Vehicle No."; Rec."Vehicle No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vehicle No.';
                ToolTip = 'Specifies the vehicle number associated with this service order line.';
            }
            field("Service Action No."; Rec."Service Action No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Service Action No.';
                ToolTip = 'Specifies the service action code for this line.';
            }
            field("Service Action Desc."; Rec."Service Action Desc.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Service Action Description';
                ToolTip = 'Specifies the description of the service action.';
            }
            field("Quantity"; Rec."Quantity")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Quantity';
                DecimalPlaces = 0 : 5;
                ToolTip = 'Specifies the quantity of the service action.';
            }
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Unit Cost';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the unit cost of the service action.';
            }
            field("Total Cost"; Rec."Total Cost")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Total Cost';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the total cost for the service action.';
                Editable = false;
            }
            field("Unit Price"; Rec."Unit Price")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Unit Price';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the unit price of the service action.';
            }
            field("Line Amount"; Rec."Line Amount")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Line Amount';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the line amount for the service action.';
                Editable = false;
            }
            field("Discount %"; Rec."Discount %")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Discount %';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the discount percentage for the service action.';
            }
            field("Discount Amount"; Rec."Discount Amount")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Discount Amount';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the discount amount for the service action.';
                Editable = false;
            }
            field("Total Amount"; Rec."Total Amount")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Total Amount';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the total amount for the service action.';
                Editable = false;
            }
            field(Profit; Rec.Profit)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Profit in %';
                DecimalPlaces = 0 : 2;
                ToolTip = 'Specifies the profit percentage for the service action.';
            }
        }
    }
}
