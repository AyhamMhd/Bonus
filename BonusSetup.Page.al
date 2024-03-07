page 50113 "Bonus Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Setup";
    Caption = 'Bonus Setup';
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Bonus Nos."; Rec."Bonus Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Please set the numbering';
                }
            }
        }
    }

    /*actions
    {
        /*area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }*/


    trigger OnOpenPage()
    begin
        rec.Reset();
        if not rec.get() then begin
            rec.Init();
            rec.Insert();
        end;
    end;

}