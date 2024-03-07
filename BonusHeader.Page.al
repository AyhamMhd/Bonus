page 50115 "Bonus Card"
{
    PageType = Document;
    //  ApplicationArea = All;
    //    UsageCategory = Administration;
    SourceTable = "Bonus Header";
    Caption = 'Bonus Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Customer Code"; Rec."Customer Code") { ApplicationArea = All; }
                field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("End Date"; Rec."End Date") { ApplicationArea = All; }
                field("Bonus Status"; Rec."Bonus Status") { ApplicationArea = All; }

            }
            group(Lines)
            {
                part(Lies; "Bonus Subform")
                {
                    SubPageLink = "Document No." = field("No.");
                    ApplicationArea = all;
                }
            }
        }
        area(FactBoxes)
        {
            part(Statistics; "Bonus Statistics")
            {

                ApplicationArea = all;
                SubPageLink = "No." = field("No.");
                Caption = 'Statistics';

            }
        }
    }


    actions
    {
        area(Navigation)
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
                RunObject = page "Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                Image = Entries;

            }
        }

    }

    var
        myInt: Integer;
}