/// <summary>
/// Table Vehicle (ID 50101).
/// </summary>
table 50101 Vehicle
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'Vehicle ID';
        }
        field(2; "Customer ID"; Code[20])
        {
            Caption = 'Customer ID';
            TableRelation = "Customer"."No.";
        }
        field(3; "Licence Plate"; Text[20])
        {
            Caption = 'Licence Plate';
        }
        field(4; "Make"; Text[50])
        {
            Caption = 'Make';
        }
        field(5; Model; Text[50])
        {
            Caption = 'Model';
        }
        field(6; Year; Integer)
        {
            Caption = 'Year';
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}