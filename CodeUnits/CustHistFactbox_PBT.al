/// <summary>
/// OnRun.
/// </summary>
codeunit 50173 "Customer History Factbox PBT"
{
    trigger OnRun()
    var
        Result: Dictionary of [Text, Text];
        orderNo: Text;
        ServOrderLine: Record "Service Order Line";
        lineCount: Integer;
        TotalAmount: Decimal;
    begin
        orderNo := page.GetBackgroundParameters().Get('OrderNo');

        ServOrderLine.SetRange("Service Order No.", orderNo);
        if ServOrderLine.FindSet() then begin
            repeat
                lineCount += 1;
                ServOrderLine.CalcFields("Total Amount");
                TotalAmount += ServOrderLine."Total Amount";
            until ServOrderLine.Next() = 0;
        end;
        Result.Add('Line Count', Format(lineCount));
        Result.Add('Total Amount', Format(TotalAmount));
    end;
}