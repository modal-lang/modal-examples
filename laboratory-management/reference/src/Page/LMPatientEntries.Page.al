page 50052 "LM Patient Entries"
{
    ApplicationArea = All;
    Caption = 'Patient Entries';
    DataCaptionFields = "Patient No.";
    Editable = false;
    PageType = List;
    SourceTable = "LM Patient Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the entry was posted.';
                }
                field("Document Date"; "Document Date")
                {
                    Visible = false;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number on the Patient ledger entry.';
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the posted entry.';
                }
                field("Source No."; "Source No.")
                {
                    ApplicationArea = All;
                }
                field("Patient No."; "Patient No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the Patient.';
                }
                field("Blood Test No."; "Blood Test No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the Blood Test.';
                }
                field(Measurement; Measurement)
                {
                	ApplicationArea = All;
                }
                field(Result; Result)
                {
                	ApplicationArea = All;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    Visible = false;

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation("User ID");
                    end;
                }
                field("Source Code"; "Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the source code that specifies where the entry was created.';
                    Visible = false;
                }
                field("Reason Code"; "Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                    Visible = false;
                }
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Navigate")
            {
                ApplicationArea = All;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';

                trigger OnAction()
                begin
                    Navigate.SetDoc("Posting Date", "Document No.");
                    Navigate.Run;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if GetFilters <> '' then
            if FindFirst then;
    end;

    var
        Navigate: Page Navigate;
}
