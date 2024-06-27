/// <summary>
/// Table Service Order Header (ID 50151).
/// </summary>
table 50151 "Service Order Header"
{
    DataClassification = CustomerContent;
    Caption = 'Service Order Header';
    LookupPageId = "Service Order Page";
    DrillDownPageId = "Service Order Page";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Service Order No.';

            trigger OnValidate()
            var
                ServOrderLine: Record "Service Order Line";
            begin
                ServOrderLine.SetRange("Service Order No.", "No.");
                ServOrderLine.ModifyAll("Service Order No.", "No.");
                TestNoSeries();
            end;

        }
        field(2; "Sell-To"; Code[20])
        {
            Caption = 'Sell-To';
            TableRelation = "Customer"."No.";
            trigger OnValidate()
            var
                Customer: Record "Customer";
                ServOrderLine: Record "Service Order Line";
            begin
                if Customer.Get("Sell-To") then begin
                    "Sell-to Customer Name" := Customer.Name;
                    if ("Bill-To" = '') then begin
                        Rec."Bill-To" := Rec."Sell-To";
                        "Bill-to Customer Name" := Customer.Name;
                        servorderline."Sell-To" := Rec."Sell-To"
                    end
                    else
                        clear("Sell-to Customer Name");
                end;

                ServOrderLine.SetRange("Service Action No.", "No.");
                ServOrderLine.ModifyAll("Sell-To", Rec."Sell-To");
            end;
        }

        field(3; "Bill-To"; Code[20])
        {
            Caption = 'Bill-To';
            TableRelation = "Customer"."No.";
            trigger OnValidate()
            var
                customer: Record "Customer";
            begin
                if Customer.Get("Bill-To") then
                    "Bill-to Customer Name" := Customer.Name
                else
                    clear("Bill-to Customer Name");
            end;
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
        field(6; "Line Count"; Integer)
        {
            Caption = 'Line Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Service Order Line" where
                ("Service Order No." = field("No.")
            ));
        }
        field(7; "Amount"; Decimal)
        {
            Caption = 'Order Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Service Order Line"."Total Amount" where
                ("Service Order No." = field("No.")
            ));
        }
        field(8; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation = "Vehicle"."No.";
        }
        field(9; "Sell-to Customer Name"; text[50])
        {
            Caption = 'Sell-to Customer Name';
            Editable = false;
            TableRelation = "Customer"."Name";
        }
        field(10; "Bill-to Customer Name"; text[50])
        {
            Caption = 'Bill-to Customer Name';
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

    var
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        ServiceSetup: Record "Service Setup";

    local procedure TestNoSeries()
    var
        IsHandled: Boolean;
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

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRelease(var Rec: Record "Service Order Header"; var IsHandled: Boolean)
    begin
    end;
    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <param name="OldServiceOrderHeader">Record "Service Order Header".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(OldServiceOrderHeader: Record "Service Order Header"): Boolean
    var
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        ServiceSetup: Record "Service Setup";
    begin
        ServiceSetup.Get();
        ServiceSetup.TestField("Service Order Nos");
        if NoSeriesMgt.SelectSeries(ServiceSetup."Service Order Nos",
        OldServiceOrderHeader."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;

    trigger OnDelete()
    var
        ServOrderLine: Record "Service Order Line";
    begin
        ServOrderLine.SetRange("Service Order No.", "No.");
        ServOrderLine.DeleteAll();
    end;

    trigger OnModify()
    var
        servorderline: Record "Service Order Line";
    begin
        ServOrderLine.SetRange("Service Action No.", "No.");
        ServOrderLine.ModifyAll("Sell-To", "Sell-To");

        CheckOpen();
    end;

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        ServiceSetup: Record "Service Setup";
    begin
        if "No." = '' then begin
            ServiceSetup.Get();
            ServiceSetup.TestField("Service Nos");
            NoSeriesMgt.InitSeries(ServiceSetup."Service Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
    /// <summary>
    /// CheckOpen.
    /// </summary>
    procedure CheckOpen()
    begin
        TestField(Closed, false);
    end;
    /// <summary>
    /// CompleteOrder.
    /// </summary>
    procedure CompleteOrder()
    var
        OrderIsClosedTxt: Label 'Order is Closed';
        IsHandled: Boolean;
    begin
        OnBeforeRelease(Rec, IsHandled);
        if IsHandled then
            exit;

        TestField("Sell-To");
        TestField("Vehicle No.");
        TestField("Bill-To");

        closed := true;
        Modify();
        Message(OrderIsClosedTxt);
    end;
    /// <summary>
    /// ReOpen.
    /// </summary>
    procedure ReOpen()
    var
        OrderIsOpenTxt: Label 'Order is Re-opened';
    begin
        closed := false;
        Modify();
        Message(OrderIsOpenTxt);
    end;
}
