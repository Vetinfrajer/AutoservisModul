/// <summary>
/// OnAction.
/// </summary>
page 50111 "Vehicle List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Vehicle;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle ID field.';
                }
                field("Customer ID"; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer ID field.';
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
                ToolTip = 'Executes the ActionName action.';

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}