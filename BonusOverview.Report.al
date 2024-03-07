report 50111 "Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;
    Caption = 'Bonus Overview';

    dataset
    {
        dataitem("Bonus Header"; "Bonus Header")
        {
            RequestFilterFields = "No.", "Customer Code";
            column(No_; "No.") { }
            column(Customer_Code; "Customer Code") { }
            column(Start_Date; "Start Date") { AutoFormatExpression = 'dd.MM.yyyy'; }
            column(End_Date; "End Date") { AutoFormatExpression = 'dd.MM.yyyy'; }
            dataitem("Bonus Entry"; "Bonus Entry")
            {
                DataItemLink = "Bonus No." = field("No.");
                column(Document_No_; "Document No.") { }
                column(Item_No_; "Item No.") { }
                column(Posting_Date; "Posting Date") { AutoFormatExpression = 'dd.MM.yyyy'; }
                column(Bonus_Amount; "Bonus Amount") { }
            }

            column(bonusNoCaption; bonusNoCaption) { }
            column(itemNoCaption; itemNoCaption) { }
            column(documentNoCaption; documentNoCaption) { }
            column(endingDateCaption; endingDateCaption) { }
            column(bonusAmountCaption; bonusAmountCaption) { }
            column(postingDateCaption; postingDateCaption) { }
            column(startingDateCaption; startingDateCaption) { }
            column(customerCodeCaption; customerCodeCaption) { }
            column(sumAmountCaption; sumAmountCaption) { }
            column(sumAmount; sumAmount) { }

            trigger OnAfterGetRecord()
            var
                BE: Record "Bonus Entry";
            begin
                sumAmount := 0;
                be.CopyFilters("Bonus Entry");
                be.SetRange("Bonus No.", "No.");
                be.CalcSums("Bonus Amount");
                sumAmount := be."Bonus Amount";
            end;

        }
    }

    /*requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }*/

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'BonusOverview.Report.docx';
        }
    }

    var
        bonusNoCaption: Label 'Bonus No.';
        customerCodeCaption: Label 'Customer No';
        postingDateCaption: Label 'Posting Date';
        documentNoCaption: Label 'Document No.';
        bonusAmountCaption: Label 'Bonus Amount';
        itemNoCaption: Label 'Item No.';
        startingDateCaption: Label 'Starting Date';
        endingDateCaption: Label 'Ending Date';
        sumAmount: Decimal;
        sumAmountCaption: Label 'Total Amount';




}