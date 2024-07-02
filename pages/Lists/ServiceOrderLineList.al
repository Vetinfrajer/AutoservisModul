/// <summary>
/// Page MyPage (ID 50166).
/// </summary>
page 50166 "Service Order Lines List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Order Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Service Order No."; Rec."Service Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order No. field.';
                }
                field("Sell-To"; Rec."Sell-To Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sell-To field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Service Action No."; Rec."Service Action No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Action No. field.';
                }
                field(quantity; Rec."Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Discount %"; Rec."Discount %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount % field.';
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount Amount field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field(profit; Rec.Profit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Profit field.';
                }
            }
        }
    }
}