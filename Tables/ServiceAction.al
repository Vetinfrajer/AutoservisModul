/// <summary>
/// Table Service Action (ID 50106).
/// </summary>
table 50150 "Service Action"
{
    DataClassification = CustomerContent;
    Caption = 'Service Action';
    DrillDownPageId = "Service Action List";
    LookupPageId = "Service Action List";
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Service Action Code';
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                item: Record Item;
            begin
                if item.Get() then begin
                    Description := item.Description;
                    "Unit Cost" := item."Unit Cost";
                    "Unit Price" := item."Unit Price";
                end;
            end;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            //TableRelation = Item."Unit Price"; Způsobuje Error??
        }
        field(4; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            //TableRelation = Item."Unit Cost";  Způsobuje Error??
        }
        field(5; "Serv. Order Line Count"; Integer)
        {
            Caption = 'Service Order Line Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Service Order line" where
                ("Service Action No." = field(code)
            ));
        }
        field(6; "Service Order Amt."; Decimal)
        {
            Caption = 'Service Order Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Service Order Line"."Total Amount" where
                ("Service Action No." = field(code))
            );
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        ServiceOrderLine: Record "Service Order Line";

}