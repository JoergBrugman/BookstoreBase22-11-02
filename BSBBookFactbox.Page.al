page 50102 "BSB Book Factbox"
{
    Caption = 'Book Details';
    PageType = CardPart;
    SourceTable = "BSB Book";
    Editable = false;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                Caption = 'Book No.';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. field.';

                trigger OnDrillDown()
                begin
                    ShowDetail();
                end;
            }
            field(Description; Rec.Description)
            {
                Caption = 'Book Description';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
            }
            field("Date of Publishing"; Rec."Date of Publishing")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date of Publishing field.';
            }
            field("No. of Pages"; Rec."No. of Pages")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. of Pages field.';
            }
            field(Author; Rec.Author)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Author field.';
            }
        }
    }

    local procedure ShowDetail()
    begin
        Rec.ShowCard();
    end;
}