page 50119 "Bonus Statistics"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Header";

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.") { ApplicationArea = all; }
            field("Bonus Amount"; Rec."Bonus Amount") { ApplicationArea = all; }

        }
    }

}