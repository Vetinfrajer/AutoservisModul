/// <summary>
/// OnAction.
/// </summary>
page 50111 "Vehicle List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Vehicle;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; Rec.ID)
                {

                }
                field("Customer ID"; Rec."Customer ID")
                {

                }
                field("Licence Plate"; Rec."Licence Plate")
                {

                }
                field(Make; Rec.Make)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}