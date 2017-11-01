using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberID"] != null && Request.IsAuthenticated)
        {
            //string MemberRole = Session["MemberRole"].ToString().Trim();
        }
        else
        {
            Response.Redirect("../Admin/Login.aspx");
        }
    }
}
