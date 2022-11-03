/// <summary>
/// Table BSB Book (ID 50100).
/// </summary>
table 50100 "BSB Book"
{
    Caption = 'Book';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
                    "Search Description" := CopyStr(Description, 1, MaxStrLen("Search Description"));
            end;
        }
        field(3; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
            DataClassification = ToBeClassified;
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Hardcover,Paperback;
            OptionCaption = ' ,Hardcover,Paperback';
            DataClassification = ToBeClassified;
        }
        field(7; Created; Date)
        {
            Caption = 'Created';
            DataClassification = ToBeClassified;
            Editable = false;
            //TODO automatisch setzten
        }
        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
            //TODO automatisch setzten
        }
        field(10; Author; Text[50])
        {
            Caption = 'Author';
            DataClassification = ToBeClassified;
        }
        field(11; "Author Provision %"; Decimal)
        {
            Caption = 'Author Provision %';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;

        }
        field(15; ISBN; Code[20])
        {
            Caption = 'ISBN';
            DataClassification = ToBeClassified;
        }
        field(16; "No. of Pages"; Integer)
        {
            Caption = 'No. of Pages';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(17; "Edition No."; Integer)
        {
            Caption = 'Edition No.';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(18; "Date of Publishing"; Date)
        {
            Caption = 'Date of Publishing';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        OnDeleteErr: Label '%1 %2 cannot be deleted', Comment = '"DEU"=%1 %2 kann nicht gelöscht werden';

    trigger OnInsert()
    begin
        Created := Today;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    begin
        Error(OnDeleteErr, TableCaption, "No.");
    end;
    /// <summary>
    /// Die TestBlocked-Funktion überprüft...
    /// </summary>
    procedure TestBlocked()
    begin
        TestField(Blocked, false);
    end;
}
