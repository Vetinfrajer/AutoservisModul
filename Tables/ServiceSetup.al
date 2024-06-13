/// <summary>
/// OnInsert.
/// </summary>
table 50105 "Service Setup"
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
        field(2; "Service Nos"; code[20])
        {
            Caption = 'Service Nos';
            TableRelation = "No. Series".Code;
        }
        field(3; "Service Order Nos"; Code[20])
        {
            Caption = 'Service Order Nos';
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