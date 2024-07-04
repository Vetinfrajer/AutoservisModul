/// <summary>
/// Page Customer Service History (ID 50171).
/// </summary>
page 50171 "Customer Service History"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Service Order Header";

    layout
    {
        area(Content)
        {
            field(TotalAmount; Amount)
            {
                ApplicationArea = All;
                Caption = 'Total Service Amount';
                ToolTip = 'Specifies the total amount of service orders for the customer.';
            }
            field("Line Count"; LineCount)
            {
                ApplicationArea = All;
                Caption = 'Total No. of Service Orders';
                ToolTip = 'Specifies the number of service Orders for the customer.';
            }
        }
    }
    var
        WaitTaskId: Integer;
        LineCount: Integer;
        Amount: Decimal;

    trigger OnAfterGetCurrRecord()
    var
        TaskParameters: Dictionary of [Text, Text];
    begin
        TaskParameters.Add('CustomerNo', Rec."Sell-To Customer No.");
        CurrPage.EnqueueBackgroundTask(WaitTaskId,
        Codeunit::"Customer history PBT", TaskParameters, 1000,
        PageBackgroundTaskErrorLevel::Warning);
    end;

    trigger OnPageBackgroundTaskCompleted(BackgroundTaskId: Integer; Result: Dictionary of [Text, Text])
    var
        LineCountTxt: label 'LineCount';
        AmountTxt: label 'TotalAmount';
    begin
        if BackgroundTaskId = WaitTaskId then begin
            Evaluate(LineCount, Result.Get(LineCountTxt));
            Evaluate(Amount, Result.Get(AmountTxt));
            CurrPage.Update(true);
        end;
    end;
}