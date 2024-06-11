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

        }
        field(2; "Customer ID"; Code[20])
        {
            TableRelation = "Customer"."No.";
        }
        field(3; "Licence Plate"; Text[20])
        {

        }
        field(4; "Make"; Text[50])
        {

        }
        field(5; Model; Text[50])
        {

        }
        field(6; Year; Integer)
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