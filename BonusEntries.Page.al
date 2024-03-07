page 50118 "Bonus Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bonus Entry";
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(Entries)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = all; }
                field("Document No."; Rec."Document No.") { ApplicationArea = all; }
                field("Bonus No."; Rec."Bonus No.") { ApplicationArea = all; }
                field("Posting Date"; Rec."Posting Date") { ApplicationArea = all; }
                field("Bonus Amount"; Rec."Bonus Amount") { ApplicationArea = All; }

            }
        }

        area(Factboxes)
        {

        }
    }

    actions
    {
    }
}