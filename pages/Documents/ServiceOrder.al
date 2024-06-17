/// <summary>
/// Page Service Order (ID 50113).
/// </summary> 
page 50113 "Service Order Page"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Service Order Header";

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order ID field.';
                }
                field("Sell-To Customer No."; Rec."Sell-To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
                field("Bill-To Customer No."; Rec."Bill-To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To field.';
                }
                // Přidejte další pole dle potřeby
            }
            part("Service Order Line"; "Service Order Subpage")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
                SubPageLink = "No." = FIELD("No.");
            }
        }
        area(FactBoxes)
        {
            /*
            part(CustomerServiceHistoryFactBox; "Customer Service History FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer No." = FIELD("Sell-To Customer No.");
            }
            part(ServiceOrderDetailsFactBox; "Service Order Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Service Order No." = FIELD("No.");
            }*/
        }
    }
    actions
    {
        area(processing)
        {
            action(CompleteOrder)
            {
                ApplicationArea = All;
                Caption = 'Complete Order';
                ToolTip = 'Mark the service order as completed.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Completed;

                trigger OnAction()
                begin
                    Rec."Closed" := true;
                end;
            }
        }
    }
}
