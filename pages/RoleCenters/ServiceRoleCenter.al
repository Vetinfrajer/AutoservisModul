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
            part(HeadlinePart; "Role Center Headline")
            {
                Caption = 'Headlines';
            }

            group(CuesGroup)
            {
                part(CustomerVehicle; "Role Center Customer Cues")
                {
                    Caption = 'Mí Zákazníci';
                }
            }

            group("Role Center Cues")
            {
                part(Cues; "Role Center Cues")
                {
                    Caption = 'Aktivity';
                }
            }
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
                    ToolTip = 'Executes the Vehicle List action.';
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

            group("Actions")
            {
                Caption = 'Actions';

                action("Create Order")
                {
                    Caption = 'Create Order';
                    RunObject = Page "Service Order page";
                    ApplicationArea = All;
                    ToolTip = 'Create a new service order';
                }
            }
        }
    }
}

profile MyProfile
{
    ProfileDescription = 'Profile for AutoService administration';
    RoleCenter = "Service Role Center";
    Caption = 'AutoService';
}
