/// <summary>
/// Page Service Role Center (ID 50117).
/// </summary>
page 50155 "Service Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(RoleCenter)
        {
        }
    }

    actions
    {
        area(Sections)
        {
            group(AutoService)
            {
                Caption = 'AutoService';
                Image = RegisteredDocs;
                action("Vehicle List")
                {
                    Caption = 'Vehicle List';
                    RunObject = Page "Vehicle List";
                    ApplicationArea = All;
                }
                action("Service Order List")
                {
                    Caption = 'Service Order List';
                    RunObject = Page "Service Order List";
                    ApplicationArea = All;
                    ToolTip = 'Executes the Service Order List action.';
                }
                action("Service Action List")
                {
                    Caption = 'Service Action List';
                    RunObject = Page "Service Action List";
                    ApplicationArea = All;
                    ToolTip = 'Executes the Service Action List action.';
                }
                action("Restaurant Setup")
                {
                    Caption = 'Service Setup';
                    RunObject = Page "Service Setup";
                    ApplicationArea = All;
                    ToolTip = 'Executes the Service Setup action.';
                }
            }
        }
    }
}
profile MyProfile
{
    ProfileDescription = 'Sample Profile';
    RoleCenter = "Service Role Center";
    Caption = 'AutoServiec';
}
