/// <summary>
/// OnAction.
/// </summary>
page 50161 "Vehicle Card"
{
    PageType = Card;
    Caption = 'Vehicle Card';
    ApplicationArea = All;
    SourceTable = Vehicle;
    UsageCategory = none;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                    ApplicationArea = all;
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                    end;
                }
                field("Customer No"; Rec."Customer No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Plate No."; Rec."Plate No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Licence Plate field.';
                }
                field("Line Count"; Rec."Serv. Order Line Count")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Service Order Line Count field.';
                }
                field("Service Order Amount"; Rec."Service Order Amt.")
                {
                    ApplicationArea = all;
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