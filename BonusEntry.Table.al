table 50117 "Bonus Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Entry No."; Integer) { DataClassification = CustomerContent; Editable = false; }
        field(20; "Bonus No."; Code[20]) { DataClassification = CustomerContent; TableRelation = "Bonus Header"; Editable = false; }
        field(30; "Document No."; Code[20]) { DataClassification = CustomerContent; TableRelation = "Sales Invoice Header"; Editable = false; }
        field(40; "Item No."; Code[20]) { DataClassification = CustomerContent; TableRelation = Item; Editable = false; }
        field(50; "Posting Date"; Date) { DataClassification = CustomerContent; Editable = false; }
        field(60; "Bonus Amount"; Decimal) { DataClassification = CustomerContent; Editable = false; }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
            SumIndexFields = "Bonus Amount";
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