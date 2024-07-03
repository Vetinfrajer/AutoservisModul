/// <summary>
/// Page RoleCenterHeadline (ID 50109).
/// </summary>
page 50167 "Service Role Center HeadLine"
{
    PageType = HeadLinePart;

    layout
    {
        area(content)
        {
            field(Headline1; hdl1Txt)
            {
                ToolTip = 'Specifies the value of the hdl1Txt field.';
            }

            field(Headline2; hdl2Txt)
            {
                ToolTip = 'Specifies the value of the hdl2Txt field.';
            }
        }
    }

    var
        hdl1Txt: Label 'Dobrý den!';
        hdl2Txt: Label 'Vítejte v modulu pro AutoServis';
}