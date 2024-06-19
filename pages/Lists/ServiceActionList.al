/// <summary>
/// Page Service Action List (ID 50112).
/// </summary>
page 50159 "Service Action List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Action";

    layout
    {
        area(Content)
        {
            Repeater(General)
            {
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Action ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Serv. Order Line Count"; Rec."Serv. Order Line Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Serv. Order Line Count field.';
                }
                field("Service Order Amt."; Rec."Service Order Amt.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order Amt. field.';
                }
            }
        }
    }
}