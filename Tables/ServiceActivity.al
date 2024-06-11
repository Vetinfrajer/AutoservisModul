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

        }
        field(2; "Description"; Text[250])
        {

        }
        field(3; Duration; Time)
        {

        }
        field(4; Price; Decimal)
        {

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