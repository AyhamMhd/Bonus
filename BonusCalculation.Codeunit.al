codeunit 50101 "Bonus Calculation"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesInvLineInsert, '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        Bonus: Record "Bonus Header";
        BonusLines: Record "Bonus Line";
        BonusEntry: Record "Bonus Entry";
        EntryNo: Integer;

    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then exit;
        Bonus.Reset();
        Bonus.SetRange("Customer Code", SalesInvLine."Sell-to Customer No.");
        Bonus.SetRange("Bonus Status", "Bonus Status"::Released);
        Bonus.SetFilter("Start Date", '<= %1', SalesInvLine."Posting Date");
        Bonus.SetFilter("End Date", '>= %1', SalesInvLine."Posting Date");
        if Bonus.FindSet() then
            repeat
                BonusLines.Reset();
                BonusLines.SetRange("Document No.", Bonus."No.");
                if BonusLines.FindSet() then
                    repeat
                        if (BonusLines.Type = BonusLines.Type::"All Items") or ((BonusLines.Type = BonusLines.Type::Item) and (BonusLines."Item No." = SalesInvLine."No.")) then begin
                            if BonusEntry.FindLast() then EntryNo := BonusEntry."Entry No." + 1 else EntryNo := 1;
                            BonusEntry.Init();
                            BonusEntry."Entry No." := EntryNo;
                            BonusEntry."Bonus No." := BonusLines."Document No.";
                            BonusEntry."Document No." := SalesInvLine."Document No.";
                            BonusEntry."Bonus Amount" := BonusLines."Bonus Perc." * SalesInvLine.Amount / 100;
                            BonusEntry."Posting Date" := SalesInvLine."Posting Date";
                            BonusEntry."Item No." := SalesInvLine."No.";
                            BonusEntry.Insert(true);
                        end;
                    until BonusLines.Next() = 0;
            until Bonus.Next() = 0;
    end;


}