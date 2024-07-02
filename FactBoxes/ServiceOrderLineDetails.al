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
            field("Sell-To"; Rec."Sell-To Customer No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sell To Customer';
                ToolTip = 'Specifies the customer who will be billed for this service order.';
            }

            group("Actions")
            {
                field("Service Action No."; Rec."Service Action No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Action No.';
                    ToolTip = 'Specifies the service action number that this line belongs to.';
                }
                field("Service Action Desc."; Rec."Service Action Desc.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Action Description';
                    ToolTip = 'Specifies the description of the service action that this line belongs to.';
                }
            }
        }
    }
    var

}
