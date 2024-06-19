/// <summary>
/// OnInsert.
/// </summary>
table 50152 "Service Order Line"
{
    DataClassification = CustomerContent;
    Caption = 'Service Order Line';
    //LookupPageId = "Service Order Line List";
    //DrillDownPageId = "Service Order Line List"

    fields
    {
        field(1; "Serv Order No."; code[20])
        {
            Caption = 'Service Order No';
            TableRelation = "Service Order Header"."No.";
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No';
            Editable = false;
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
        }
        field(9; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
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
        key(pk; "Serv Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// 
    /// </summary>
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
        Rec.Validate("Unit Price");

        // Modify the record to save changes
        Modify;
    end;

    local procedure UpdateAmounts()
    var
        Totalamount: Decimal;
    begin
        Rec."Total Cost" := Rec."Quantity" * Rec."Unit Cost";
        Rec."Line Amount" := Rec."Quantity" * Rec."Unit Price";
        Rec."Discount Amount" := (Rec."Line Amount" / 100) * Rec."Discount %";
        Rec."Total Amount" := Rec."Line Amount" - Rec."Discount Amount";
        Totalamount := "Total Amount" - "Total Cost";
        Rec.Profit := (Totalamount / 100) * Rec."Total Cost";
    end;


}