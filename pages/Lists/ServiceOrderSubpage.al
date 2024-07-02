/// <summary>
/// Page Service Order Subpage (ID 50116).
/// </summary>
page 50157 "Service Order Subpage"
{
    PageType = Listpart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Order Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            Repeater(General)
            {
                field("Sell-To"; Rec."Sell-To Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell To Customer field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Service Action No."; Rec."Service Action No.")
                {
                    ToolTip = 'Specifies the value of the Service Action No. field.';
                }
                field("Service Action Desc."; Rec."Service Action Desc.")
                {
                    ToolTip = 'Specifies the value of the Service Action Description field.';
                }
                field(quantity; Rec."Quantity")
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Discount %"; Rec."Discount %")
                {
                    ToolTip = 'Specifies the value of the Discount % field.';
                }
                field(profit; Rec.Profit)
                {
                    ToolTip = 'Specifies the value of the Profit field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Discount Amount field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
        }
    }
}