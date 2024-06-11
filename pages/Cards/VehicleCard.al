/// <summary>
/// OnAction.
/// </summary>
page 50110 "Vehicle Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = none;
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
                field(Model; Rec.Model)
                {

                }
                field("Licence Plate"; Rec."Licence Plate")
                {

                }
                field("Make"; Rec."Make")
                {

                }
                field(Year; Rec.Year)
                {

                }
            }
        }
        area(FactBoxes)
        {
            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Customer ID");
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