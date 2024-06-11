/// <summary>
/// OnInsert.
/// </summary>
table 50100 "Service Activity"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'Service Activity ID';
        }
        field(2; "Description"; Text[250])
        {
            Caption = 'Description';
        }
        field(3; Duration; Time)
        {
            Caption = 'Duration';
        }
        field(4; Price; Decimal)
        {
            Caption = 'Price';
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