/// <summary>
/// Table Service Order Line (ID 50152).
/// </summary>
table 50152 "Service Order Line"
{
    DataClassification = CustomerContent;
    Caption = 'Service Order Line';
    LookupPageId = "Service Order Lines List";
    DrillDownPageId = "Service Order Lines List";

    fields
    {
        field(1; "Service Order No."; Code[20])
        {
            Caption = 'Service Order No';
            TableRelation = "Service Order Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "Sell-To Customer No."; Code[20])
        {
            Caption = 'Sell To Customer';
            TableRelation = "Customer"."No.";
        }
        field(4; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation = "Vehicle"."No." where
            (
                "Customer No." = field("Sell-To Customer No.")
            );
        }
        field(5; "Service Action No."; Code[20])
        {
            Caption = 'Service Action No.';
            TableRelation = "Service Action"."Code";
            trigger OnValidate()
            begin
                UpdateInfoByActionNo();
            end;
        }
        field(6; "Service Action Desc."; Text[30])
        {
            Caption = 'Service Action Description';
        }
        field(7; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }
        field(8; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }
        field(9; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
            Editable = false;
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }
        field(10; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }
        field(11; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
        field(12; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }
        field(13; "Discount Amount"; Decimal)
        {
            Caption = 'Discount Amount';
            Editable = false;
        }
        field(14; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }
        field(15; Profit; Decimal)
        {
            Caption = 'Profit in %';
            trigger OnValidate()
            begin
                CalcByProfit();
            end;
        }

    }

    keys
    {
        key(pk; "Service Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        ServOrderHeader: Record "Service Order Header";
        ServOrderLine: Record "Service Order Line";

    trigger OnInsert()
    begin
        if ServOrderHeader.get("Service Order No.") then
            ServOrderHeader.CheckOpen();

        ServOrderLine.SetRange("Service Order No.", rec."Service Order No.");
        if Rec."Line No." = 0 then begin
            if ServOrderLine.FindLast then begin
                Rec."Line No." := ServOrderLine."Line No.";
            end;
            Rec."Line No." += 10000;
        end;

        if ServOrderHeader.Get("Service Order No.") then
            Rec."Sell-To Customer No." := ServOrderHeader."Sell-To Customer No.";
    end;

    trigger OnModify()
    begin
        if ServOrderHeader.Get(Rec."Service Order No.") then
            ServOrderHeader.CheckOpen();
    end;

    trigger onDelete()
    begin
        if ServOrderHeader.Get(Rec."Service Order No.") then
            ServOrderHeader.CheckOpen();
    end;

    local procedure UpdateInfoByActionNo()
    var
        ServiceAction: Record "Service Action";
    begin
        if ServiceAction.Get("Service Action No.") then begin
            Rec."Service Action Desc." := ServiceAction.Description;
            Validate("Unit Cost", ServiceAction."Unit Cost");
            Validate("Unit Price", ServiceAction."Unit Price");
        end;
    end;

    local procedure UpdateAmounts()
    begin
        Rec."Total Cost" := Rec."Quantity" * Rec."Unit Cost";
        Rec."Line Amount" := Rec."Quantity" * Rec."Unit Price";
        Rec."Discount Amount" := (Rec."Line Amount" / 100) * Rec."Discount %";
        Rec."Total Amount" := Rec."Line Amount" - Rec."Discount Amount";
        if Rec."Total amount" <> 0 then
            Rec.Profit := ((Rec."Total Amount" - Rec."Total Cost") / Rec."Total amount") * 100
        else
            Profit := 0;
    end;

    local procedure CalcByProfit()
    begin
        //Rec."Unit Price" := Rec."unit Cost" / (1 - (Rec.Profit / 100));
        Validate("Unit Price", Rec."unit Cost" / (1 - (Rec.Profit / 100)));
    end;


}
