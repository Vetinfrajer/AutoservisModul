/// <summary>
/// Page Service Order (ID 50113).
/// </summary> 
page 50160 "Service Order Page"
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
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                    end;
                }
                field("Sell-To Customer No."; Rec."Sell-To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer ID field.';
                    Importance = promoted;
                }
                field("Sell-To Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Bill-To Customer No."; Rec."Bill-To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To field.';
                    Importance = promoted;
                }
                field("Bill-to Customer Name"; Rec."Bill-to Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer Name field.';
                }
                field("Line Count"; Rec."Line Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Count field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }


            }
            part("Lines"; "Service Order Subpage")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
                SubPageLink = "Service Order No." = FIELD("No.");
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
            group(ReleaseAction)
            {
                caption = 'Order Actions';
                action(CompleteOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Complete Order';
                    ToolTip = 'Mark the service order as completed.';
                    Image = Completed;
                    Enabled = not rec.Closed;
                    trigger OnAction()
                    begin
                        Rec."Closed" := true;
                    end;
                }
                action("ReOpen")
                {
                    Caption = 'ReOpen';
                    ApplicationArea = All;
                    ToolTip = 'Reopen the service order.';
                    enabled = Rec.Closed;
                }
            }
        }
        area(promoted)
        {
            group(Category_Process)
            {
                showas = splitbutton;
                actionref("CompleteOrder_Promoted"; CompleteOrder)
                {

                }
                actionref("ReleaseOrder_Promoted"; ReOpen)
                {

                }
            }
        }
    }
}
