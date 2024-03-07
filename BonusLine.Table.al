table 50116 "Bonus Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Document No."; Code[20]) { DataClassification = CustomerContent; TableRelation = "Bonus Header"; }
        field(20; "Type"; Enum "Bonus Type") { DataClassification = CustomerContent; }
        field(30; "Item No."; Code[20]) { DataClassification = CustomerContent; TableRelation = if (type = filter(Item)) Item; }
        field(40; "Bonus Perc."; Integer) { DataClassification = CustomerContent; MinValue = 0; MaxValue = 100; Caption = 'Bonus Percentage'; }

    }

    keys
    {
        key(PK; "Document No.", Type, "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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