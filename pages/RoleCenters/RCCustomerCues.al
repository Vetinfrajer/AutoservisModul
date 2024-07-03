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
                    Style = Strong;
                    StyleExpr = Maxamount > 10000;
                    DrillDownPageId = "Service Order List";
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        GetBestCustomer();
    end;

    var
        Maxamount: Decimal;
    /// <summary>
    /// GetBestCustomer.
    /// </summary>
    procedure GetBestCustomer()
    var
        customer: Record Customer;
    begin
        Maxamount := 0;
        if customer.findset then
            repeat
                if customer."Service Order Amount" > Maxamount then
                    Maxamount := customer."Service Order Amount";
            until customer.next() = 0;
    end;
}
