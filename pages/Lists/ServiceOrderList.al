/// <summary>
/// Page Service Order List (ID 50114).
/// </summary>
page 50158 "Service Order List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Order Header";
    CardPageId = "Service Order Page";
    Caption = 'Service Order List';

    layout
    {
        area(Content)
        {
            Repeater(Lines)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order ID field.';
                }
                field("Sell-To"; Rec."Sell-To Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
                field("Bill-To"; Rec."Bill-To Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-To field.';
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
}