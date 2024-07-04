/// <summary>
/// Page Role Center Customer Cues (ID 50168).
/// </summary>
page 50168 "Role Center Customer Cues"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            cuegroup("Customer Cues")
            {
                field("Service Order Amount"; Maxamount)
                {
                    ApplicationArea = All;
                    Caption = 'Highest Total Service Amount';
                    Style = Strong;
                    StyleExpr = Maxamount > 10000;
                    DrillDownPageId = "Customer Service History";
                }
            }
        }
    }
    var
        Maxamount: Decimal;
        CustomerWithHighestTotalAmount: Text[100];
        Customer: Record Customer;

    trigger OnOpenPage()
    begin
        if Customer.FindSet() then begin
            repeat
                Customer.CalcFields("Service Order Amount");
                if Customer."Service Order Amount" > Maxamount then begin
                    Maxamount := Customer."Service Order Amount";
                end;
            until Customer.Next() = 0;
        end;
    end;
}
