/// <summary>
/// TableExtension Customer Extension (ID 50172) extends Record Customer.
/// </summary>
tableextension 50172 "Customer Extension" extends Customer
{
    fields
    {
        field(50100; "Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Service Order Line"."Total Amount" where("Sell-To Customer No." = Field("No.")));
        }
        field(50101; "Order Line Count"; Integer)
        {
            Caption = 'Order Line Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Service Order Line"
            where("Sell-To Customer No." = Field("No.")));
        }
    }
}