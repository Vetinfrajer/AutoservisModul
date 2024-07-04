/// <summary>
/// OnAction.
/// </summary>
page 50169 "Role Center Cues"
{
    PageType = cardpart;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Role Center Activity Cues";

    layout
    {
        area(Content)
        {
            cuegroup(Activity)
            {
                CuegroupLayout = wide;
                field("Opened Orders"; Rec."Opened Orders")
                {
                    ToolTip = 'Specifies the value of the Opened Orders field.';
                    DrillDownPageId = "Service Order List";
                    Style = Strong;
                    StyleExpr = Rec."Opened Orders" > 5;
                }
                field("Closed Orders"; Rec."Closed Orders")
                {
                    ToolTip = 'Specifies the value of the Closed Orders field.';
                    DrillDownPageId = "Service Order List";
                    Style = Attention;
                    StyleExpr = Rec."Closed Orders" > 5;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}