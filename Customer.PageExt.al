pageextension 50112 "AYH Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field(Bonuses; Rec.Bonuses)
            {
                Caption = 'Bonusses';
                ToolTip = 'The number of related Bonusses, Click to list them';
                Editable = false;
                ApplicationArea = all;

            }

        }


    }

    actions
    {
        addlast("&Customer")
        {
            action(ViewBonusses)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Bonusses';
                ToolTip = 'View Related Bonusses';
                Enabled = rec.Bonuses > 0;
                RunObject = page "Bonus List";
                RunPageLink = "Customer Code" = field("No.");
                Image = RelatedInformation;

            }
        }
    }

    var
        myInt: Integer;
}