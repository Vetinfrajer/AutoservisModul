/// <summary>
/// OnAction.
/// </summary>
page 50170 "Vehicle List Factbox"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = Vehicle;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Plate No."; Rec."Plate No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Licence Plate field.';
                }
                field("Service Order Amt."; Rec."Service Order Amt.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order Amount field.';
                }
                field("Serv. Order Line Count"; Rec."Serv. Order Line Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order Line Count field.';
                }
            }
        }
    }
}