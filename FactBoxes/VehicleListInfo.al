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
                field("Service Order Amt."; rec."Service Order Amt.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order Amount field.';
                }
                field("Serv. Order Line Count"; rec."Serv. Order Line Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Order Line Count field.';
                }
            }
        }
    }

}