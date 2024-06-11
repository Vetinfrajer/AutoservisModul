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
            Caption = 'Service Order ID';
        }
        field(2; "Customer ID"; Code[20])
        {
            Caption = 'Customer ID';
            TableRelation = Customer."No.";
        }
        field(3; "Vehicle ID"; Code[20])
        {
            Caption = 'Vehicle ID';
            TableRelation = Vehicle.ID;
        }
        field(4; "Order Date"; date)
        {
            Caption = 'Order Date';
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
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