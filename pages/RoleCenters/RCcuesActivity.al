/// <summary>
/// Table Role Center Cues (ID 50168).
/// </summary>
table 50168 "Role Center Activity Cues"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[250])
        {
            Caption = 'Primary Key';
        }
        field(2; "Opened Orders"; Integer)
        {
            Caption = 'Opened Orders';
            TableRelation = "Service Order Header";
            FieldClass = FlowField;
            CalcFormula = Count("Service Order Header" where
                (Closed = const(false))
            );
        }
        field(3; "Closed Orders"; Integer)
        {
            Caption = 'Closed Orders';
            TableRelation = "Service Order Header";
            FieldClass = FlowField;
            CalcFormula = Count("Service Order Header" where
                (Closed = const(true))
            );
        }
    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}