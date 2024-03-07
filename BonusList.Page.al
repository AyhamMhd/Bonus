page 50114 "Bonus List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bonus Header";
    Caption = 'Bonus List';
    Editable = false;
    CardPageId = "Bonus Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Customer Code"; Rec."Customer Code") { ApplicationArea = All; }
                field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("End Date"; Rec."End Date") { ApplicationArea = All; }
                field("Bonus Status"; Rec."Bonus Status") { ApplicationArea = All; }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(Customer)
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer Code");
                Promoted = true;
                PromotedCategory = Process;
                Image = Customer;
                ToolTip = 'View Customer page';

            }
            action(Entries)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Entries;
                RunObject = page "Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
            }
            action(Test)
            {
                trigger OnAction()
                var
                    Options: Text[100];
                    output: Integer;
                begin
                    Options := 'None, First, Second';
                    output := StrMenu(Options, 1, 'Pick one please!');
                    Message('You selected option %1', Format(output));
                end;
            }

        }
        area(Reporting)
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Bonus Overview';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                ToolTip = 'This is o print an overview about bonuses';
                RunObject = report "Bonus Overview";

                trigger OnAction()
                begin

                end;
            }
        }

    }
}