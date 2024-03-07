table 50114 "Bonus Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Bonus Setup';

    fields
    {
        field(10; "Primary Key"; Code[10]) { DataClassification = ToBeClassified; }
        field(20; "Bonus Nos."; Code[20]) { DataClassification = ToBeClassified; TableRelation = "No. Series"; }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}