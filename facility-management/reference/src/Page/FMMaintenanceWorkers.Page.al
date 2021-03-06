page 50005 "FM Maintenance Workers"
{
    ApplicationArea = All;
    Caption = 'Maintenance Workers';
    PageType = List;
    SourceTable = "FM Maintenance Worker";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
            	ShowCaption = false;
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field("Name"; "Name")
                {
                	ApplicationArea = All;
                	Importance = Promoted;
                	ShowMandatory = true;
                	
                	trigger OnValidate()
                	begin
                		CurrPage.SaveRecord;
                	end;
                }
                field("Name 2"; "Name 2")
                {
                	ApplicationArea = All;
                	Importance = Additional;
                	Visible = false;
                }
                field("Search Name"; "Search Name")
                {
                	ApplicationArea = All;
                	Importance = Additional;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = All;
                    Visible = false;
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
                Visible = true;
            }
        }
    }
}
