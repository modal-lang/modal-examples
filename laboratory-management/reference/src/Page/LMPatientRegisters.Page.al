page 50051 "LM Patient Registers"
{
    ApplicationArea = All;
    Caption = 'Patient Registers';
    Editable = false;
    PageType = List;
    SourceTable = "LM Patient Register";
    SourceTableView = SORTING("No.")
                      ORDER(Descending);
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the Patient ledger register.';
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the entries in the register were posted.';
                }
                field("Creation Time"; "Creation Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the time when the entries in the register were posted.';
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation("User ID");
                    end;
                }
                field(SourceCode; "Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the source code for the entries in the register.';
                }
                field("Journal Batch Name"; "Journal Batch Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the batch name of the Patient journal that the entries were posted from.';
                }
                field(Reversed; Reversed)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies if the register has been reversed (undone) from the Reverse Entries window.';
                    Visible = false;
                }
                field("From Entry No."; "From Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first Patient ledger entry number in the register.';
                }
                field("To Entry No."; "To Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last Patient ledger entry number in the register.';
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
        area(navigation)
        {
            group("&Register")
            {
                Caption = '&Register';
                Image = Register;
                action("Patient Ledger")
                {
                    ApplicationArea = All;
                    Caption = 'Patient Ledger';
                    Image = GLRegisters;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit "LM Patient Reg.-Show Ledger";
                    ToolTip = 'View the general ledger entries that resulted in the current register entry.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if FindSet then;
    end;
}
