/// <summary>
/// Table Vehicle (ID 50101).
/// </summary>
table 50154 Vehicle
{
    DataClassification = CustomerContent;
    LookupPageId = "Vehicle List";
    //DrillDownPageId = "Service Order Lines List";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Vehicle No.';
            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer ID';
            TableRelation = "Customer"."No.";
        }
        field(3; "Plate No."; Text[20])
        {
            Caption = 'Licence Plate';
        }
        field(4; "Serv. Order Line Count"; Integer)
        {
            Caption = 'Service Order Line Count';
            //FieldClass = FlowField;
            Editable = false;
            //CalcFormula = Count("Service Order Line"."No.");
        }
        field(5; "Service Order Amt."; Decimal)
        {
            Caption = 'Service Order Amount';
            //FieldClass = FlowField;
            Editable = false;
            //CalcFormula = sum("Service Order Line"."Total");
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series"."Code";
        }
        field(7; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            Editable = false;
            TableRelation = "Customer"."Name";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


    local procedure TestNoSeries()
    var
        IsHandled: Boolean;
        ServiceSetup: Record "Service Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IsHandled := false;
        OnBeforeTestNoSeries(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        if Rec."No." <> xRec."No." then begin
            ServiceSetup.Get();
            NoSeriesMgt.TestManual(ServiceSetup."Service Order Nos");
            Rec."No. Series" := '';
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var Vehicle: Record Vehicle;
    xVehicle: Record Vehicle; var IsHandled: Boolean)
    begin
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <param name="OldVehicle">Record Vehicle.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(OldVehicle: Record Vehicle): Boolean
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RestaurantSetup: Record "Service Setup";
    begin
        RestaurantSetup.Get();
        RestaurantSetup.TestField("Service Order Nos");
        if NoSeriesMgt.SelectSeries(RestaurantSetup."Service Order Nos",
        OldVehicle."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;

    trigger OnInsert()
    var
        IsHandled: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ServiceSetup: Record "Service Setup";
    begin
        if "No." = '' then begin
            ServiceSetup.Get();
            ServiceSetup.TestField("Service Nos");
            NoSeriesMgt.InitSeries(ServiceSetup."Service Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
}