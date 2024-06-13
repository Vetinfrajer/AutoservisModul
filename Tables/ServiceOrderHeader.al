/// <summary>
/// OnInsert.
/// </summary>
table 50103 "Service Order Header"
{
    DataClassification = CustomerContent;
    Caption = 'Service Order Header';
    LookupPageId = "Service Order Page";
    DrillDownPageId = "Service Order Page";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Service Order ID';
            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; "Sell-To"; Code[20])
        {
            Caption = 'Customer ID';
            TableRelation = "Customer"."No.";
        }
        field(3; "Bill-To"; Code[20])
        {
            Caption = 'Bill-To';
            TableRelation = "Customer"."No.";
        }
        field(4; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series"."Code";
        }
        field(5; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
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
    local procedure OnBeforeTestNoSeries(var ServiceOrderHeader: Record "Service Order Header";
    xServiceOrderHeader: Record "Service Order Header"; var IsHandled: Boolean)
    begin
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <param name="OldServiceOrderHeader">Record "Service Order Header".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(OldServiceOrderHeader: Record "Service Order Header"): Boolean
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RestaurantSetup: Record "Service Setup";
    begin
        RestaurantSetup.Get();
        RestaurantSetup.TestField("Service Order Nos");
        if NoSeriesMgt.SelectSeries(RestaurantSetup."Service Order Nos",
        OldServiceOrderHeader."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;
}