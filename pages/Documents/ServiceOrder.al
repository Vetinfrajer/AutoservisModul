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
                Editable = ServOrderEditable;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order ID field.';
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                    end;
                }
                field("Sell-To Customer No."; Rec."Sell-To Customer No.")
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
                field("Sell-To Contact No"; Rec."Sell-To Contact No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact No field.';
                }
                field("Sell-To Customer City"; Rec."Sell-To Customer City")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer City field.';
                }
                field("Sell-To Customer Address"; Rec."Sell-To Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Address field.';
                }
                field("Sell-To Customer Post Code"; Rec."Sell-To Customer Post Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Post Code field.';
                }
                field("Bill-To Customer No."; Rec."Bill-To Customer No.")
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
                field("Bill-To Contact No"; Rec."Bill-To Contact No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To Contact No field.';
                }
                field("Bill-To Customer City"; Rec."Bill-To Customer City")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To Customer City field.';
                }
                field("Bill-To Customer Address"; Rec."Bill-To Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To Customer Address field.';
                }
                field("Bill-To Customer Post Code"; Rec."Bill-To Customer Post Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To Customer Post Code field.';
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
                Editable = ServOrderEditable;
                ApplicationArea = All;
                UpdatePropagation = Both;
                SubPageLink = "Service Order No." = FIELD("No.");
            }
        }
        area(FactBoxes)
        {

            part(CustomerServiceHistoryFactBox; "Customer Service History")
            {
                ApplicationArea = All;
                UpdatePropagation = both;
                SubPageLink = "Sell-To Customer No." = FIELD("Sell-To Customer No.");
            }
            part(CustomerFactBox; "Customer Details FactBox")
            {
                ApplicationArea = All;
                UpdatePropagation = both;
                SubPageLink = "No." = FIELD("Sell-To Customer No.");
            }

            part(ServiceOrderDetailsFactBox; "Service Order Line Details")
            {
                ApplicationArea = All;
                UpdatePropagation = both;
                SubPageLink = "Service Order No." = FIELD("No.");
            }
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
                        Rec.ReleaseOrder();
                        CurrPage.Update(false);

                    end;
                }
                action("ReOpen")
                {
                    Caption = 'ReOpen';
                    ApplicationArea = All;
                    ToolTip = 'Reopen the service order.';
                    enabled = Rec.Closed;
                    trigger OnAction()
                    begin
                        Rec.ReOpen();
                        CurrPage.Update(false);
                    end;
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
    trigger OnOpenPage()
    begin
        ServOrderEditable := true;
    end;

    trigger OnAfterGetRecord()
    begin
        SetOrderEditable();
    end;

    var
        ServOrderEditable: Boolean;
    /// <summary>
    /// SetOrderEditable.
    /// </summary>
    /// <returns>Return value of type begin.</returns>
    procedure SetOrderEditable()
    begin
        ServOrderEditable := not Rec.Closed;
    end;
}
