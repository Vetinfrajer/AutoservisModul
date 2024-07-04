/// <summary>
/// OnRun.
/// </summary>
codeunit 50172 "Customer history PBT"
{
    trigger OnRun()
    var
        Result: Dictionary of [Text, Text];
        CustomerNo: Text;
        ServOrderHeader: Record "service Order Header";
        LineCount: Integer;
        TotalAmount: Decimal;
        LineCountTxt: Label 'LineCount';
        AmountTxt: Label 'TotalAmount';
    begin
        CustomerNo := Page.GetBackgroundParameters().Get('CustomerNo');
        ServOrderHeader.SetRange("Sell-To Customer No.", CustomerNo);
        if ServOrderHeader.FindSet() then begin
            repeat
                LineCount += 1;
                ServOrderHeader.CalcFields(Amount);
                TotalAmount += ServOrderHeader.Amount;
            until ServOrderHeader.Next() = 0;
        end;
        Result.Add(LineCountTxt, Format(LineCount));
        Result.Add(AmountTxt, Format(TotalAmount));

        Page.SetBackgroundTaskResult(Result);
    end;
}
