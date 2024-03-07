page 50117 "Bonus Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Bonus Line";
    Caption = 'Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type) { ApplicationArea = all; ToolTip = 'Item or for all items'; }
                field("Item No."; Rec."Item No.") { ApplicationArea = all; }
                field("Bonus Perc."; Rec."Bonus Perc.") { ApplicationArea = all; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction();
                begin

                end;
            }
        }
    }
}