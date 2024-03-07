table 50115 "Bonus Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Bonus List";
    DrillDownPageId = "Bonus List";
    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Customer Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                TestStatusOpen();
                CalcFields("Customer Name");
            end;
        }
        field(30; "Start Date"; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TestStatusOpen();
            end;
        }
        field(40; "End Date"; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TestStatusOpen();
            end;

        }
        field(50; "Bonus Status"; Enum "Bonus Status") { DataClassification = CustomerContent; }
        field(60; "Customer Name"; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer Code")));
        }
        field(70; "Bonus Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Bonus Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Bonus Entry"."Bonus Amount" where("Bonus No." = field("No.")));
        }

    }


    keys
    {
        key(PK; "No.") { Clustered = true; }
    }

    local procedure TestStatusOpen()
    begin
        TestField("Bonus Status", "Bonus Status"::Open);
    end;



    trigger OnInsert()
    var
        NoSeries: Record "No. Series";
        BonusSetup: Record "Bonus Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        errorLabel: Label 'Please review Bonus setp';
    begin
        if not BonusSetup.Get() then Error(errorLabel);
        if BonusSetup."Bonus Nos." = '' then Error(errorLabel);
        if NoSeries.Get(BonusSetup."Bonus Nos.") then begin
            //"No." := NoSeriesMgt.GetNextNo(BonusSetup."Bonus Nos.", WorkDate(), true);
            NoSeriesMgt.InitSeries(BonusSetup."Bonus Nos.", BonusSetup."Bonus Nos.", WorkDate(), "No.", BonusSetup."Bonus Nos.");
        end;
    end;

}
