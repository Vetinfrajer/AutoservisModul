/// <summary>
/// PageExtension Customer Card Extension (ID 50173) extends Record Customer Card.
/// </summary>
pageextension 50173 "Customer Card Extension" extends "Customer Card"
{
    layout
    {
        addlast(Content)
        {
            group("Service Orders")
            {

                field("Order Amount"; Rec."Service Order Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Order Amount';
                    Importance = Promoted;
                    ToolTip = 'Specifies the total order amount for the customer.';
                }
                field("Order Count"; rec."Service Order Line Count")
                {
                    ApplicationArea = All;
                    Caption = 'Order Count';
                    Importance = Promoted;
                    ToolTip = 'Specifies the total number of orders for the customer.';
                }
            }
        }
    }
}
