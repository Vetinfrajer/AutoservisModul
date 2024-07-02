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
        field(2; "Sell-To Customer No."; Code[20])
        {
            Caption = 'Sell-To';
            TableRelation = "Customer"."No.";
            trigger OnValidate()
            var
                Customer: Record "Customer";
                ServOrderLine: Record "Service Order Line";
            begin
                if Customer.Get("Sell-To Customer No.") then begin
                    "Sell-to Customer Name" := Customer.Name;
                    "Sell-To Customer Address" := Customer.Address;
                    "Sell-To Customer Post Code" := Customer."Post Code";
                    "Sell-To Customer City" := Customer.City;
                    "Sell-To Contact No" := Customer.Contact;
                    if ("Bill-To Customer No." = '') then begin
                        Rec."Bill-To Customer No." := Rec."Sell-To Customer No.";
                        "Bill-to Customer Name" := Customer.Name;
                        Validate("Bill-To Customer No.");
                    end
                    else begin
                        clear("Sell-to Customer Name");
                        Clear("Sell-To Customer Address");
                        Clear("Sell-To Customer Post Code");
                        Clear("Sell-To Customer City");
                        Clear("Sell-To Contact No");
                    end;
                end;

                ServOrderLine.SetRange("Service Order No.", "No.");
                ServOrderLine.ModifyAll("Sell-To Customer No.", Rec."Sell-To Customer No.");
            end;
        }

        field(3; "Bill-To Customer No."; Code[20])
        {
            Caption = 'Bill-To';
            TableRelation = "Customer"."No.";
            trigger OnValidate()
            var
                customer: Record "Customer";
            begin
                if Customer.Get("Bill-To Customer No.") then begin
                    "Bill-to Customer Name" := Customer.Name;
                    "Bill-To Customer Address" := Customer.Address;
                    "Bill-To Customer Post Code" := Customer."Post Code";
                    "Bill-To Customer City" := Customer.City;
                    "Bill-To Contact No" := Customer.Contact;
                end
                else begin
                    clear("Bill-to Customer Name");
                    clear("Bill-To Customer Address");
                    clear("Bill-To Customer Post Code");
                    clear("Bill-To Customer City");
                    clear("Bill-To Contact No");
                end;

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
        field(11; "Sell-To Customer Address"; Text[250])
        {
            Caption = 'Sell-To Customer Address';
            Editable = false;
            TableRelation = "Customer"."Address";
        }
        field(12; "Bill-To Customer Address"; Text[250])
        {
            Caption = 'Bill-To Customer Address';
            Editable = false;
            TableRelation = "Customer"."Address";
        }
        field(13; "Sell-To Customer Post Code"; Code[20])
        {
            Caption = 'Sell-To Customer Post Code';
            Editable = false;
            TableRelation = "Customer"."Post Code";
        }
        field(14; "Bill-To Customer Post Code"; Code[20])
        {
            Caption = 'Bill-To Customer Post Code';
            Editable = false;
            TableRelation = "Customer"."Post Code";
        }
        field(15; "Sell-To Customer City"; Code[20])
        {
            Caption = 'Sell-To Customer City';
            Editable = false;
            TableRelation = "Customer"."City";
        }
        field(16; "Bill-To Customer City"; Code[20])
        {
            Caption = 'Bill-To Customer City';
            Editable = false;
            TableRelation = "Customer"."City";
        }
        field(19; "Sell-To Contact No"; Code[20])
        {
            Caption = 'Sell-To Contact No';
            Editable = false;
            TableRelation = Customer."Contact";
        }
        field(20; "Bill-To Contact No"; Code[20])
        {
            Caption = 'Bill-To Contact No';
            Editable = false;
            TableRelation = Customer."Contact";
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    protected var
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
        ServOrderLine.ModifyAll("Sell-To Customer No.", "Sell-To Customer No.");

        CheckOpen();
    end;

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        ServiceSetup: Record "Service Setup";
    begin
        if "No." = '' then begin
            ServiceSetup.Get();
            ServiceSetup.TestField("Service Order Nos");
            NoSeriesMgt.InitSeries(ServiceSetup."Service Order Nos", xRec."No. Series", 0D, "No.", "No. Series");
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

        TestField("Sell-To Customer No.");
        TestField("Bill-To Customer No.");

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
