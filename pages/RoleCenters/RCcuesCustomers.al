/// <summary>
/// Table Role Center Cues (ID 50168).
/// </summary>
table 50173 "Role Center Customers Cues"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; PrimaryKey; Code[250])
        {
            Caption = 'Primary Key';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer"."No.";
            trigger OnValidate()
            var
                customer: Record customer;
            begin
                if Customer.get("Customer No.") then
                    "Customer Name" := Customer.Name
                else
                    clear("Customer Name");
            end;
        }
        field(3; "MostVehicle"; code[20])
        {
            Caption = 'Most Vehicle';
            TableRelation = "Vehicle"."No.";
        }
        field(4; "Total amount Spent"; Decimal)
        {
            Caption = 'Total amount Spent';
            FieldClass = FlowField;
            CalcFormula = sum("Service Order Line"."Total Amount" where
                ("Sell-To Customer No." = field("Customer No.")
            ));
        }
        field(5; "Customer Name"; text[50])
        {
            Caption = 'Customer Name';
        }


    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}