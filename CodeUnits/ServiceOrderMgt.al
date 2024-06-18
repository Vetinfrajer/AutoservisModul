/// <summary>
/// Codeunit Service Order Management (ID 50118).
/// </summary>
codeunit 50163 "Service Order Management"
{

    /*
    [EventSubscriber(ObjectType::Page, Page::"Service Order", 'OnActionCompleteOrder', '', false, false)]
    local procedure OnCompleteOrder(var Rec: Record "Service Order Header")
    var
        ServiceOrderNote: Record "Service Order Note";
    begin
        if Rec."Closed" then
            exit;

        Rec."Closed" := true;
        Rec.Modify();

        ServiceOrderNote.Init();
        ServiceOrderNote."Order No." := Rec."No.";
        ServiceOrderNote."Note Text" := 'Vehicle repaired and ready for pickup.';
        ServiceOrderNote.Insert();

        // Další logika pro ověření vyplnění povinných polí
    end;*/
}
