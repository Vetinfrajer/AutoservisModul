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
        field(3; "Sell-To"; Code[20])
        {
            Caption = 'Sell To Customer';
            TableRelation = "Customer"."No.";
        }
        field(4; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation = "Vehicle"."No.";
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

    trigger OnInsert()
    var
        ServOrderHeader: Record "Service Order Header";
        ServOrderLine: Record "Service Order Line";
    begin
        //if ServOrderHeader.get("Service Order No.", Rec."Service Order No.") then
        //ServOrderHeader.CheckOpen();

        ServOrderLine.SetRange("Service Order No.", rec."Service Order No.");
        if Rec."Line No." = 0 then
            rec."Line No." := 10000
        else
            if ServOrderLine.FindLast then
                Rec."Line No." := ServOrderLine."Line No.";
        Rec."Line No." += 10000;

        if ServOrderHeader.Get() then begin
            Rec."Sell-To" := ServOrderHeader."Sell-To";
            Rec."Vehicle No." := ServOrderHeader."Vehicle No.";
        end;


    end;

    var
        ServOrderHeader: Record "Service Order Header";
        ServOrderLine: Record "Service Order Line";

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
            Rec."Unit Price" := ServiceAction."Unit Price";
            Rec."Unit Cost" := ServiceAction."Unit Cost";
        end;
    end;

    local procedure UpdateAmounts()
    begin
        Rec."Total Cost" := Rec."Quantity" * Rec."Unit Cost";
        Rec."Line Amount" := Rec."Quantity" * Rec."Unit Price";
        Rec."Discount Amount" := (Rec."Line Amount" / 100) * Rec."Discount %";
        Rec."Total Amount" := Rec."Line Amount" - Rec."Discount Amount";
        if "Total Cost" <> 0 then
            Rec.Profit := ((Rec."Total Amount" - Rec."Total Cost") / Rec."Total Cost") * 100;

    end;

    local procedure CalcByProfit()
    var
        DesiredProfit: Decimal;
        TotalCost: Decimal;
        UnitPriceWithoutDiscount: Decimal;
        DiscountMultiplier: Decimal;
    begin
        // Step 1: Calculate Total Cost
        TotalCost := Rec."Quantity" * Rec."Unit Cost";

        // Step 2: Calculate the desired profit multiplier
        DesiredProfit := Rec.Profit / 100;

        // Step 3: Calculate Unit Price without considering the discount
        UnitPriceWithoutDiscount := (TotalCost * (1 + DesiredProfit)) / Rec."Quantity";

        // Step 4: Calculate the discount multiplier
        DiscountMultiplier := 1 - (Rec."Discount %" / 100);

        // Step 5: Adjust the Unit Price by considering the discount
        Rec."Unit Price" := UnitPriceWithoutDiscount / DiscountMultiplier;

        // Update amounts to reflect the changes
        UpdateAmounts();

        // Modify the record to save changes
        Modify;
    end;
}
