/// <summary>
/// OnRun.
/// </summary>
codeunit 50172 "Customer history PBT"
{
    trigger OnRun()
    var
        Result: Dictionary of [Text, Text];
        OrderNo: Text;
        ServOrderLine: Record "service Order Line";
        LineCount: Integer;
        TotalAmount: Decimal;
    begin
        OrderNo := Page.GetBackgroundParameters().Get('OrderNo');
        ServOrderLine.SetRange("service Order No.", OrderNo);
        if ServOrderLine.FindSet() then begin
            repeat
                LineCount += 1;
                ServOrderLine.CalcFields("Total Amount");
                TotalAmount += ServOrderLine."Total Amount";
            until ServOrderLine.Next() = 0;
        end;
        Result.Add('LineCount', Format(LineCount));
        Result.Add('Amount', Format(TotalAmount));

        Page.SetBackgroundTaskResult(Result);
    end;

}
