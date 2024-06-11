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
            Caption = 'Service Order Line ID';
        }
        field(2; "Order ID"; code[20])
        {
            Caption = 'Order ID';
            TableRelation = "Service Order".ID;
        }
        field(3; "Activity ID"; code[20])
        {
            Caption = 'Activity ID';
            TableRelation = "Service Activity".ID;
        }
        field(4; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
        }
        field(5; "Price"; Decimal)
        {
            Caption = 'Price';
        }
        field(6; Total; Decimal)
        {
            Caption = 'Total';
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