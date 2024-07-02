/// <summary>
/// OnInsert.
/// </summary>
table 50153 "Service Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Service Setup';
    LookupPageId = "Service Setup";
    DrillDownPageId = "Service Setup";

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Service Setup ID';
        }
        field(2; "Service Order Nos"; Code[20])
        {
            Caption = 'Service Order Nos';
            TableRelation = "No. Series".Code;
        }
        field(3; "Vehicle Nos."; Code[20])
        {
            Caption = 'Vehicle Nos.';
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Pk; "Primary Key")
        {
            Clustered = true;
        }
    }
}