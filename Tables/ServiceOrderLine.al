/// <summary>
/// OnInsert.
/// </summary>
table 50104 "Service Order Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; code[20])
        {

        }
        field(2; "Order ID"; code[20])
        {
            TableRelation = "Service Order".ID;
        }
        field(3; "Activity ID"; code[20])
        {
            TableRelation = "Service Activity".ID;
        }
        field(4; "Quantity"; Decimal)
        {

        }
        field(5; "Price"; Decimal)
        {

        }
        field(6; Total; Decimal)
        {

        }

    }

    keys
    {
        key(pk; ID)
        {
            Clustered = true;
        }
    }
}