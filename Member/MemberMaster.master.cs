using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_MemberMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberRole"] != null && Request.IsAuthenticated)
        {
                string MemberRole = Session["MemberRole"].ToString().Trim();
                switch (Convert.ToInt32(MemberRole))
                {
                    case 0: VIPPanel.Visible = true;
                        break;
                    case 2: AdminPanel.Visible = true;
                        break;
                }
        }
        else
        {
            AdminPanel.Visible = false;
            VIPPanel.Visible = false;
            Response.Redirect("../Member/Login.aspx");
        }
    }
}
