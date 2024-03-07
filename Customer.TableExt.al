tableextension 50111 "AYH Customer" extends Customer
{
    fields
    {
        field(50100; Bonuses; integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("Bonus Header" where("Customer Code" = field("No.")));
            Editable = false;

        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnBeforeDelete()
    begin
        CalcFields(Bonuses);
        if Bonuses > 0 then Error(deleteLabel, "No.", Bonuses);

    end;

    var
        deleteLabel: Label 'You cannot delete Customer %1, bucause it has %2 Bonusses linked! ';
}