/// <summary>
/// OnInsert.
/// </summary>
table 50103 "Service Order"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; Code[20])
        {

        }
        field(2; "Customer ID"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(3; "Vehicle ID"; Code[20])
        {
            TableRelation = Vehicle.ID;
        }
        field(4; "Order Date"; date)
        {

        }
        field(5; Status; Option)
        {
            OptionMembers = Open,Closed;
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