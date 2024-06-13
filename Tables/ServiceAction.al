/// <summary>
/// Table Service Action (ID 50106).
/// </summary>
table 50106 "Service Action"
{
    DataClassification = CustomerContent;
    Caption = 'Service Action';

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Service Action ID';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            TableRelation = Item."Unit Price";
        }
        field(4; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            TableRelation = Item."Unit Cost";
        }
        field(5; "Serv. Order Line Count"; Integer)
        {
            Caption = 'Service Order Line Count';
            FieldClass = FlowField;
            //CalcFormula = Count("Service Order Line"."No.");
        }
        field(6; "Service Order Amt."; Decimal)
        {
            Caption = 'Service Order Amount';
            FieldClass = FlowField;
            //CalcFormula = sum("Service Order Line"."Total");
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}