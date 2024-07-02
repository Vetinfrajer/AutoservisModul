/// <summary>
/// OnAction.
/// </summary>
page 50174 "Role Center Customer Cues"
{
    PageType = cardpart;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Role Center Customers Cues";

    layout
    {
        area(Content)
        {
            cuegroup(Customer)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';

                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field("Total Amount Spent"; Rec."Total Amount Spent")
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount Spent on Repairs';
                    DrillDownPageId = "Service Order Lines List";
                }
            }
            cuegroup("Most Repaired Vehicle")
            {

                field("MostVehicle"; Rec."MostVehicle")
                {
                    ApplicationArea = All;
                    Caption = 'Most Repaired Vehicle';

                }
            }

        }
    }

    trigger OnOpenPage()
    var
        MaxAmount: Decimal;
        Amount: Decimal;
        ServOrderLine: Record "Service Order Line";
    begin

        MaxAmount := 0.0;
        Amount := 0.0;


        if ServOrderLine.Get() then
            if ServOrderLine.FindFirst() then begin
                repeat
                    Amount := ServOrderLine."Total Amount";
                    if Amount > MaxAmount then
                        MaxAmount := Amount;
                until ServOrderLine.Next() = 0;
            end;

        // Set the maximum amount found to the current record
        Rec."Total Amount Spent" := MaxAmount;
    end;
}
