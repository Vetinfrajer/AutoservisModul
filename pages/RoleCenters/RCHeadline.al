/// <summary>
/// Page RoleCenterHeadline (ID 50167).
/// </summary>
page 50175 "Service Role Center HeadLine"
{
    PageType = HeadLinePart;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            field(Headline1; hdl1Txt)
            {
                ToolTip = 'Specifies the value of the hdl2Txt field.';
            }
            field(Headline2; hdl2Txt)
            {
                ToolTip = 'Specifies the value of the hdl3Txt field.';
            }
            field(headline3; hdl3Txt)
            {
                ToolTip = 'Specifies the value of the hdl4Txt field.';
            }
            field(Headline4; hdl4Txt)
            {
                ToolTip = 'Specifies the value of the hdl4Txt field.';
            }
            field(Headline5; hdl5Txt)
            {
                ToolTip = 'Specifies the value of the hdl5Txt field.';
            }
        }
    }

    var
        hdl1Txt: Label 'Vítejte v modulu pro AutoServis';
        hdl2Txt: Text;
        hdl3Txt: Text;
        hdl4Txt: Text;
        hdl5Txt: Text;

    trigger OnOpenPage()
    var
        Customer: Record Customer;
        HighestTotalAmount: Decimal;
        CustomerWithHighestTotalAmount: Text[100];
        vehicle: Record Vehicle;
        HighestVehicleAmount: Decimal;
        VehiclePlateNo: Text[100];
    begin
        if Customer.FindSet() then begin
            repeat
                Customer.CalcFields("Service Order Amount");
                if Customer."Service Order Amount" > HighestTotalAmount then begin
                    HighestTotalAmount := Customer."Service Order Amount";
                    CustomerWithHighestTotalAmount := Customer.Name;
                end;
            until Customer.Next() = 0;
        end;
        if vehicle.FindSet() then begin
            vehicle.Calcfields("Service Order Amt.");
            repeat
                if vehicle."Service Order Amt." > HighestVehicleAmount then begin
                    HighestVehicleAmount := vehicle."Service Order Amt.";
                    VehiclePlateNo := vehicle."Plate No.";
                end;
            until vehicle.next() = 0;
        end;
        hdl2Txt := 'Zákazník s nejvyšší celkovou částkou: ' + CustomerWithHighestTotalAmount;
        hdl3Txt := 'Celková částka: ' + CustomerWithHighestTotalAmount + ' je ' + Format(HighestTotalAmount) + ',- (LCY)';
        hdl4Txt := 'Vozidlo s nejvyšší celkovou částkou: ' + VehiclePlateNo;
        hdl5Txt := 'Celková částka: ' + VehiclePlateNo + ' je ' + Format(HighestVehicleAmount) + ',- (LCY)';
    end;
}
