/// <summary>
/// OnInsert.
/// </summary>
table 50104 "Service Order Line"
{
    DataClassification = CustomerContent;
    Caption = 'Service Order Line';
    //LookupPageId = "Service Order Line List";
    //DrillDownPageId = "Service Order Line List"

    fields
    {
        field(1; "No."; code[20])
        {
            Caption = 'Service Order No';
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
        }
        field(6; "Service Action Desc."; Text[30])
        {
            Caption = 'Service Action Description';
        }
        field(7; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
        }
        field(8; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(9; "Total Cost"; Decimal)
        {
            Caption = 'Total Price';
        }
        field(10; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(11; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
        field(12; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
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
            Caption = 'Profit';
            Editable = false;
        }
    }

    keys
    {
        key(pk; "No.", "Line No.")
        {
            Clustered = true;
        }
    }
}